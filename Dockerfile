FROM python:3

ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/app

COPY ./poetry.lock ./pyproject.toml  ./

ENV POETRY_VERSION=1.2.2
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 - && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

RUN poetry install  --no-root

EXPOSE 8000