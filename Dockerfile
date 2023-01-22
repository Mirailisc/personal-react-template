FROM node:16.18.1-alpine as setup
RUN npm i -g pnpm
WORKDIR /app
COPY ./package.json ./
COPY ./pnpm-lock.yaml ./

FROM setup as build
RUN pnpm i --frozen-lockfile

COPY . ./

FROM build as deploy
CMD [ "pnpm", "start" ]
