FROM node:latest

WORKDIR /home/choreouser

EXPOSE 3000

COPY files/* /home/choreouser/

ENV PM2_HOME=/tmp

RUN apt-get update &&\
    apt-get install -y iproute2 vim netcat-openbsd &&\
    npm install -r package.json &&\
    npm install -g pm2 &&\
    addgroup --gid 10010 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10010 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x index.js start.sh server &&\
    npm install -r package.json

CMD [ "node", "index.js" ]

USER 10010
