FROM ubuntu:latest

ENV DEBIAN_FRONTEND='noninteractive'

RUN apt-get update -y && apt-get install -y python3-pip python3-dev libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev

COPY ./app /home/ubuntu

RUN python3 -m pip install -r /home/ubuntu/requirements.txt
RUN cd /home/ubuntu && ls && pwd
CMD /bin/bash -c "python3 /home/ubuntu/server.py"