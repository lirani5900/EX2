FROM python:3.7

WORKDIR /app

COPY . .

RUN pip install flask

EXPOSE 5001

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
