FROM python:3.7

WORKDIR /app

COPY . .

RUN pip install flask
RUN flask init-db

EXPOSE 5000

CMD ["python3", "app.py"]
