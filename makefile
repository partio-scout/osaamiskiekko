build-production:
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml build frontend backend

docker-cleanrun:
	docker-compose down
	docker volume prune -f
	docker container prune -f
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
	cat ./backend/postgre/dump_dataonly.sql | docker exec -i osaamiskiekko_db_1 psql -U myuser -d mydb


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
deploy: check-deploy-arguments deploy-backend deploy-frontend deploy-loadbalancer

check-deploy-arguments:
ifeq ($(namespace), )
	$(error "namespace required. Usage 'namespace=[] backendimage=[] frontendimage=[] make deploy")
endif
ifeq ($(backendimage), )
	$(error "backendimage required. Usage 'namespace=[] backendimage=[] frontendimage=[] make deploy")
endif
ifeq ($(frontendimage), )
	$(error "frontendimage required. Usage 'namespace=[] backendimage=[] frontendimage=[] make deploy")
endif

deploy-db:
	$(info deploying db)
	@kubectl apply -n $(namespace) -f kubectl/db.yaml

deploy-backend:
	$(info deploying backend)
	@sed -e 's#$$BACKENDIMAGE#$(backendimage)#g' kubectl/backend.yaml | kubectl apply -n $(namespace) -f -

deploy-frontend:
	$(info deploying frontend)
	@sed -e 's#$$FRONTENDIMAGE#$(frontendimage)#g' kubectl/frontend.yaml | kubectl apply -n $(namespace) -f -

deploy-loadbalancer:
	$(info deploying load balancer)
	@kubectl apply -n $(namespace) -f kubectl/load-balancer.yaml 


### tests ###
unit:
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
