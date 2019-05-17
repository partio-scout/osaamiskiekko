docker-build-production:
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml build frontend backend

docker-build:
	docker-compose build
	
docker-cleanrun:
	docker-compose down
	docker volume prune -f
	docker container prune -f
	docker-compose up

docker-run:
	docker-compose up

### model import/export ###
backupdatamodels:
	cp -r ./backend/cms/api ./tmp/datamodels

dump: dump-schema dump-data

dump-schema:
	docker exec -t osaamiskiekko_db_1 pg_dump -U myuser -s mydb > ./backend/postgre/01_schema.sql

dump-data:
	docker exec -t osaamiskiekko_db_1 pg_dump --data-only -U myuser -d mydb > ./backend/postgre/02_testdata.sql  

restore-data:
	cat ./backend/postgre/02_testdata.sql | docker exec -i osaamiskiekko_db_1 psql -U myuser -d mydb


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
	
robot:
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml build frontend db backend robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml run robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml down

sonar:
ifeq ($(password), )
	$(error "partionosaamiskiekko-bot password required")
endif
	sonar-scanner -Dsonar.login=partionosaamiskiekko-bot -Dsonar.password=$(password)
