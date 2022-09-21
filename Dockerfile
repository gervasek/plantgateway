FROM python:3.9



RUN apt-get update \
&& apt-get -y install bluetooth bluez bluez-tools \
&& apt-get install -y vim \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* 

COPY requirements.txt /plantgateway/requirements.txt
RUN cd /plantgateway \
&& pip install -r requirements.txt

COPY scripts/run.sh /scripts/run.sh
RUN chmod u+x /scripts/run.sh

COPY plantgw /plantgateway/plantgw
COPY plantgateway /plantgateway/plantgateway

CMD ["/scripts/run.sh"]