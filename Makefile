all: reset setup test

reset:
	./primary-replica/reset.sh

setup:
	./primary-replica/setup.sh

test:
	./primary-replica/test.sh

down:
	docker compose down

.PHONY: all reset setup test down