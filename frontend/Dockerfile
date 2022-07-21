FROM node:18.4-buster

RUN mkdir -p /planner
WORKDIR /planner

COPY package.json yarn.lock ./

RUN yarn install
