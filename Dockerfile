FROM ubuntu:latest
LABEL Maintainer="Simon <simon@qic.ca>"

RUN mkdir -p /home/backup
WORKDIR /work

RUN apt update && apt install -y tar wget cron curl nano perl cpanminus && apt clean

# Timezone (no prompt)
ARG TZ "America/Toronto"
ENV tz=$TZ
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN echo "$tz" > /etc/timezone
RUN rm -f /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

#Cleaning
RUN rm -rf /var/lib/apt/lists/*

# Install IDrive
# change the url and filename and uncomment
#RUN curl -O wget -O IDrive360_putyourown_private.deb https://webapp.idrive360.com/api/v1/download/setup/deb/putyourown?encryption=true
#RUN dpkg -i IDrive360_putyourown_private.deb
#RUN rm filename.deb

RUN touch /var/log/idrive.log