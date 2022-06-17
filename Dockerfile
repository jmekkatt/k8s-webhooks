FROM python:alpine3.7
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
COPY validate.py /app
COPY wsgi.py /app
CMD gunicorn --certfile=webhook.crt --keyfile=webhook.key --bind 0.0.0.0:443 wsgi:webhook
