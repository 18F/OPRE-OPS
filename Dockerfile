FROM python:3.12.0a4
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y netcat
ENV DJANGO_SETTINGS_MODULE=opre_ops.settings.local
WORKDIR /opre_project
COPY Pipfile Pipfile.lock /opre_project/
RUN pip install --upgrade pip pipenv && pipenv install --dev --system --deploy
COPY ./opre_ops/ /opre_project/
