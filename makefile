run-robot:
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml build frontend db api robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml run robot
	docker-compose --project-directory . -f docker-compose.yml -f compose/frontend.yml -f compose/robot.yml down
