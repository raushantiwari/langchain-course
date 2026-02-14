`README.txt`.

---

LANGCHAIN COURSE
Production-grade FastAPI application demonstrating best practices for building scalable LangChain-powered backends.

---

## TECH STACK

- Python 3.12+
- FastAPI
- Uvicorn
- Pydantic Settings
- uv (modern Python package manager)
- Makefile-based workflow

---

## PROJECT STRUCTURE

langchain-course/
│
├── src/
│ └── app/
│ ├── main.py
│ ├── config.py
│ └── **init**.py
│
├── .env.development
├── .env.production
├── pyproject.toml
├── uv.lock
└── Makefile

---

## SETUP

Install dependencies:

```
make install
```

This runs:

```
uv sync
```

---

## DEVELOPMENT MODE

Start development server:

```
make dev
```

Configuration:

- Environment: .env.development
- Host: 127.0.0.1
- Port: 8001
- Reload enabled
- Debug logging enabled

Open in browser:

```
http://127.0.0.1:8001
```

---

## PRODUCTION MODE (LOCAL TESTING)

Start production server:

```
make start
```

Configuration:

- Environment: .env.production
- Host: 0.0.0.0
- Port: 8002
- Workers: 4
- Log level: info

Open in browser:

```
http://localhost:8002
```

NOTE:
If running in WSL or remote Linux, always use:
[http://localhost:8002](http://localhost:8002)

---

## TESTING

Run test suite:

```
make test
```

This runs:

```
uv run pytest
```

---

## CLEANUP

Clean cache and temporary files:

```
make clean
```

Removes:

- **pycache** directories
- .pytest_cache
- .pyc files

---

## ENVIRONMENT VARIABLES

Example .env.development

```
APP_ENV=development
DEBUG=true
OPENAI_API_KEY=your-dev-key
```

Example .env.production

```
APP_ENV=production
DEBUG=false
OPENAI_API_KEY=your-prod-key
```

---

## RUN WITHOUT MAKEFILE

Development:

```
ENV_FILE=.env.development uv run uvicorn src.app.main:app --reload --port 8001
```

Production:

```
ENV_FILE=.env.production uv run uvicorn src.app.main:app --port 8002 --workers 4
```

---

## NOTES

- Do not commit real .env files to version control.
- Use separate environment files for development and production.
- Workers are recommended only for production environments.
- Use host 0.0.0.0 when exposing server externally.

---

## AUTHOR

Raushan Tiwari
Full Stack & GenAI Engineer
