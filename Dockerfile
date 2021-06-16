FROM mhart/alpine-node:14 as builder

RUN apk add --no-cache make gcc g++ python git bash
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
WORKDIR /app
RUN git config --global url.https://github.com/.insteadOf ssh://git@github.com/
RUN npm ci
COPY . .
RUN npx webpack-cli --config ./webpack/webpack.docker.config.js

FROM mhart/alpine-node:14 as runtime

WORKDIR /app

COPY --from=builder "/app/build/ganache-core.docker.cli.js" "./ganache-core.docker.cli.js"
COPY --from=builder "/app/build/ganache-core.docker.cli.js.map" "./ganache-core.docker.cli.js.map"

ENV DOCKER true

EXPOSE 8545

CMD node /app/ganache-core.docker.cli.js --fork https://mainnet.infura.io/v3/$INFURA_PROJECT_ID  -m 'luxury visual dentist trumpet banana immune that charge baby board finger pet' -u '0xb7f993e0b314148e02c105badb12b02b1143e704' 
