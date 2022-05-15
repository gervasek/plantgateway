FROM python:3.5



RUN apt-get update \
&& apt-get -y install bluetooth bluez bluez-tools \
&& apt-get install -y vim \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* 


COPY scripts/run.sh /scripts/run.sh
COPY plantgw /plantgateway/plantgw
COPY requirements.txt /plantgateway/requirements.txt
COPY plantgateway /plantgateway/plantgateway

RUN cd /plantgateway \
&& pip install -r requirements.txt

CMD ["/scripts/run.sh"]