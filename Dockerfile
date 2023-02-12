FROM python:3.7

WORKDIR /app

COPY . .

RUN pip install Flask

ENV FLASK_APP=app.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
