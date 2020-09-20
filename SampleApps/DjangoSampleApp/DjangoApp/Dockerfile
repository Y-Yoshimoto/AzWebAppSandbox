# build
FROM python:3.8
# https://hub.docker.com/r/library/python
LABEL  maintainer "y.yoshimoto"
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt && pip freeze > requirements.lock
ADD . /code/
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]