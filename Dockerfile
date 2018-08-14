FROM node:8-stretch
MAINTAINER David MARTIN <dmartin.pro@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install jq unzip wget -y && \
    npm cache verify && npm update && npm install pm2 -g && \
    mkdir -p /opt/assistant-plugins && \
    cd /opt/assistant-plugins && \
    wget https://raw.githubusercontent.com/Aymkdn/assistant-plugins/master/docs/install/package.json && \
    wget https://raw.githubusercontent.com/Aymkdn/assistant-plugins/master/docs/install/index.js && \
    wget https://raw.githubusercontent.com/Aymkdn/assistant-plugins/master/docs/install/postinstall.js && \
    npm install --loglevel error && npm run-script postinstall && \
    npm install assistant-freebox@latest --save --loglevel error && npm run-script postinstall

COPY docker-entrypoint.sh .
COPY pm2assistant.yml .

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["pm2-docker", "pm2assistant.yml"]
