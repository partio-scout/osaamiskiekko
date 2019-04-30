run-robot:
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml build frontend db backend robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml run robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml down

backupdatamodels:
	cp -r ./backend/cms/api ./tmp/datamodels

getdatabasedump:
	docker exec -t partio_db_1 pg_dump --clean --if-exists -U myuser -d mydb > ./backend/postgre/dump.sql