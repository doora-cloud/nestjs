FROM node:20-alpine

WORKDIR /srv/app

RUN apk add --no-cache bash curl && curl -1sLf \
  'https://dl.cloudsmith.io/public/infisical/infisical-cli/setup.alpine.sh' | bash

RUN apk --no-cache add infisical