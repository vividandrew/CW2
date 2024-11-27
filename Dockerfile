FROM node:10-alpine

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

COPY server.js /home/node/app

WORKDIR /home/node/app

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080
CMD ["node", "server.js"]
