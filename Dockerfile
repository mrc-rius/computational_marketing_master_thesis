FROM python:3.5
ENV PYTHONUNBUFFERED 1
RUN mkdir /src
RUN mkdir /static
WORKDIR /src
ADD ./src /src
RUN pip install -r requirements.pip
CMD python manage.py collectstatic --no-input;python manage.py migrate; gunicorn computationalMarketing.wsgi -b 0.0.0.0:8000