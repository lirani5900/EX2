FROM python:3.7

WORKDIR /app

COPY . .

env FLASK_APP=flaskr
env FLASK_ENV=development

RUN pip install flask
RUN flask init-db

EXPOSE 5000

CMD ["python3","run","app.py","--host=0.0.0.0"]
