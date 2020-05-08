FROM node:12.16.2

# This image (container) is for dev-server and build. Not production

RUN mkdir /app
WORKDIR /app

COPY ./package.json ./package-lock.json ./
RUN npm ci

COPY . /app
