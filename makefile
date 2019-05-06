run-robot:
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml build frontend db backend robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml run robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml down

backupdatamodels:
	cp -r ./backend/cms/api ./tmp/datamodels

getdatabasedump:
	docker exec -t partio_db_1 pg_dump --clean --if-exists -U myuser -d mydb > ./backend/postgre/dump.sql

docker-cleanrun:
	docker volume prune -f
	docker container prune -f
	docker-compose up

getdatabasedump-dataonly:
	docker exec -t partio_db_1 pg_dump --data-only -U myuser -d mydb > ./backend/postgre/dump_dataonly.sql  

restoredata-dataonly:
	cat ./backend/postgre/dump_dataonly.sql | docker exec -i partio_db_1 psql -U myuser -d mydb

deploy: check-deploy-arguments deploy-backend-service deploy-backend deploy-frontend deploy-ingress

check-deploy-arguments:
ifeq ($(backendimage), )
	$(error "backendimage required. Usage 'backendimage=[url] frontendimage=[url] make deploy")
endif
ifeq ($(frontendimage), )
	$(error "frontendimage required. Usage 'backendimage=[url] frontendimage=[url] make deploy")
endif

deploy-db:
	$(info deploying db)
	@kubectl apply -f kubectl/db.yaml

deploy-backend-service:
	$(info deploying backend service)
	@kubectl apply -f kubectl/backend-service.yaml

deploy-backend:
	$(info deploying backend)
	@sed -e 's#$$BACKENDIMAGE#$(backendimage)#g' kubectl/backend.yaml | kubectl apply -f -

deploy-frontend:
	$(info deploying frontend)
	@sed -e 's#$$FRONTENDIMAGE#$(frontendimage)#g' kubectl/frontend.yaml | kubectl apply -f -

deploy-ingress:
	$(info deploying ingress)
	@kubectl apply -f kubectl/ingress.yaml
