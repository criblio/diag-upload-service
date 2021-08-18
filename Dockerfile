FROM node:14.15.5-stretch-slim

WORKDIR /usr/app
COPY index.js /usr/app/
COPY package.json /usr/app/

RUN mkdir /usr/app/diags && npm install

EXPOSE 8000

CMD /usr/local/bin/node index.js
