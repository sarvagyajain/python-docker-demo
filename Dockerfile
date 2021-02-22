FROM python:3.7.5-slim-buster
# Never prompt the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive

## install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y netcat-openbsd gcc libpq-dev python3-dev && \
    apt-get clean
RUN pip install --upgrade pip


WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt



COPY . .

#CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
CMD ["flask", "run", "--host", "0.0.0.0"]