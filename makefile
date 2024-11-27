PYTHON = python3
POETRY = poetry
ALEMBIC = alembic
PYTHON_SCRIPTS_DIR = scripts

all: install lint test run

install:
	$(POETRY) install

lint:
	ruff check

test:
	pytest -vv --cov --cov-report term-missing

run:
	uvicorn src.main:app --host 0.0.0.0 --port 8001 --reload

run-in-docker:
	uvicorn src.main:app --host 0.0.0.0 --port 8001 --reload

docker:
	docker compose up --build -d

clean:
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type d -name ".pytest_cache" -exec rm -r {} +
	docker-compose down -v
