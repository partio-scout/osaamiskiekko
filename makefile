build-production:
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml build frontend backend

run-robot:
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml build frontend db backend robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml run robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml down

docker-cleanrun:
	docker volume prune -f
	docker container prune -f
	docker-compose up

### model import/export ###
backupdatamodels:
	cp -r ./backend/cms/api ./tmp/datamodels

getdatabasedump:
	docker exec -t partio_db_1 pg_dump --clean --if-exists -U myuser -d mydb > ./backend/postgre/dump.sql

getdatabasedump-dataonly:
	docker exec -t partio_db_1 pg_dump --data-only -U myuser -d mydb > ./backend/postgre/dump_dataonly.sql  

restoredata-dataonly:
	cat ./backend/postgre/dump_dataonly.sql | docker exec -i partio_db_1 psql -U myuser -d mydb


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
	kubectl create secret generic database-credentials \
	--from-literal=username='${username}' \
	--from-literal=password='${password}' \
	-n ${namespace} \
	--dry-run -o yaml \
	| kubectl apply -f -


### Deployment ###
deploy: check-deploy-arguments deploy-db deploy-backend deploy-frontend deploy-loadbalancer

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

