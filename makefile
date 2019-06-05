docker-build-production:
	docker-compose --project-directory . -f docker-compose.yml -f compose/production.yml build frontend backend

docker-build:
	docker-compose build

docker-clean: 	
	docker-compose -f docker-compose.yml -f compose/production.yml -f compose/robot.yml down
	docker volume prune -f
	docker container prune -f

docker-run:
	docker-compose up

docker-cleanrun: docker-clean docker-run

### model import/export ###
backupdatamodels:
	cp -r ./backend/cms/api ./tmp/datamodels

dump: dump-schema dump-data

dump-schema:
	docker exec -t osaamiskiekko_dev-db pg_dump -U myuser -s mydb > ./backend/postgre/01_schema.sql

dump-data:
	docker exec -t osaamiskiekko_dev-db pg_dump --data-only -U myuser -d mydb > ./backend/postgre/02_testdata.sql  

restore-data:
	cat ./backend/postgre/02_testdata.sql | docker exec -i osaamiskiekko_dev-db psql -U myuser -d mydb


### Cluster configuration ###
secret-db-credentials:
ifeq ($(namespace), )
	$(error "namespace environment variable required.")
endif
ifeq ($(username), )
	$(error "username environment variable required.")
endif
ifeq ($(password), )
	$(error "password environment variable required.")
endif
ifeq ($(dbname), )
	$(error "dbname environment variable required.")
endif
	kubectl create secret generic database-credentials \
	--from-literal=username='${username}' \
	--from-literal=password='${password}' \
	--from-literal=dbname='${dbname}' \
	-n ${namespace} \
	--dry-run -o yaml \
	| kubectl apply -f -

### Deployment ###
# deploy: check-deploy-arguments deploy-db deploy-backend deploy-frontend deploy-loadbalancer
deploy-master: check-deploy-arguments deploy-backend deploy-frontend deploy-loadbalancer

check-deploy-arguments:
ifeq ($(version), )
	$(error "version required.")
endif

deploy-backend:
	$(info deploying backend)
	@sed -e 's#$$BACKENDIMAGE#artifactory.dev.eficode.io/partionosaamiskiekko/osaamiskiekko/backend_master:${version}#g; s#$$PHASE#master#g; s#$$NODE_ENV#development#g' kubectl/backend.yaml | kubectl apply -n master -f -
	@sed -e 's#$$PHASE#master#g' kubectl/backend-service.yaml | kubectl apply -n master -f -

deploy-frontend:
	$(info deploying frontend)
	@sed -e 's#$$FRONTENDIMAGE#artifactory.dev.eficode.io/partionosaamiskiekko/osaamiskiekko/frontend_master:${version}#g; s#$$PHASE#master#g; s#$$NODE_ENV#development#g' kubectl/frontend.yaml | kubectl apply -n master -f -

deploy-loadbalancer:
	$(info deploying load balancer)
	@sed -e 's#$$SUBDOMAIN#dev#g' kubectl/namespace-ingress.yaml | kubectl apply -n master -f -

### tests ###
unit:
	CI=true npm run test --prefix frontend
	
unit-sonar:
	CI=true npm run test-sonar --prefix frontend -- --coverage

unit-update:
	CI=true npm run test --prefix frontend -- -u

unit-interactive:
	npm run test --prefix frontend
	
robot: robot-down robot-build robot-run

robot-down:
	docker-compose --project-directory . -f compose/robot.yml down

robot-build:
	docker-compose --project-directory . -f compose/robot.yml build frontend robot-db backend robot

robot-run:
	docker-compose --project-directory . -f compose/robot.yml run robot

robot-run-local:
	cd robot && BROWSER=chrome SERVER=http://localhost:3000/ API=http://localhost:1337/api/ SELENIUM= python run.py -d ./results

sonar:
ifeq ($(password), )
	$(error "partionosaamiskiekko-bot password required")
endif
	sonar-scanner -Dsonar.login=partionosaamiskiekko-bot -Dsonar.password=$(password)
