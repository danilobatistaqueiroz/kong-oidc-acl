FROM node:12.13-alpine As start

WORKDIR /home/node

RUN mkdir -p start

FROM node:12.13-alpine As development

WORKDIR /usr/src/app

COPY . .

WORKDIR /home/node

RUN mkdir -p www

FROM node:12.13-alpine as production

COPY --from=development /usr/src/app/bootstrap ./bootstrap

FROM node:12.13-alpine as tests

WORKDIR /home/node

RUN mkdir -p tests && echo 'jest is the best' > jest.js

