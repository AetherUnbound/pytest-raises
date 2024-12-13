IS_TTY = -it

.PHONY: build test
build:
	docker build . -t pytest-raises:dev

test: build
	docker run --rm $(IS_TTY) pytest-raises:dev py.test --cov-report term-missing --cov

lint: build
	docker run --rm $(IS_TTY) pytest-raises:dev sh -c /src/pytest-raises/pylint.sh
