FROM node:10-alpine

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

RUN apk update && apk add --no-cache git

#Sometimes docker caches repo this is to remove that caching
ARG CACHEBUST=1

RUN git clone https://github.com/vividandrew/CW2 /home/node/app

WORKDIR /home/node/app

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080
CMD ["node", "server.js"]
