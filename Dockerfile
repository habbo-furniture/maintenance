FROM node:16-alpine AS build

WORKDIR /app

COPY package.json .
COPY yarn.lock .

RUN yarn

COPY . .

RUN yarn build

FROM caddy:2-alpine

COPY --from=build /app/build/ /usr/share/caddy
