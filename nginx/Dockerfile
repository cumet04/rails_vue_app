FROM nginx

WORKDIR /etc/nginx
# remove defaults; leave mime.types
RUN rm -rf ./conf.d && \
    rm ./*_params ./koi-utf ./koi-win ./win-utf

ARG ENV="prod"
ARG PUMA_HOST="localhost"
ARG ASSETS_HOST
ARG EDGE_PROTO="https"

COPY ./nginx.conf.template ./nginx.conf.template
COPY ./assets_location.conf.${ENV}.template ./assets_location.conf.template
RUN envsubst '$PUMA_HOST $EDGE_PROTO' < ./nginx.conf.template > ./nginx.conf
RUN envsubst '$ASSETS_HOST' < ./assets_location.conf.template > ./assets_location.conf

RUN mkdir /app
WORKDIR /app
COPY ./public /app/public
