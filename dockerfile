FROM node:16-alpine

ARG GITBRANCH="local"
ARG GITSHA="local"

RUN mkdir -p /home/app

COPY . /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

LABEL gitbranch=${GITBRANCH}
LABEL gitsha=${GITSHA}

ENV GITBRANCH=${GITBRANCH}
ENV GITSHA=${GITSHA}

RUN npm ci

CMD ["yarn", "dev"]