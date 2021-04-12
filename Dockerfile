FROM node:14.9.0

# create destination directory
RUN mkdir /app
WORKDIR /app

# update and install dependency
#RUN apk update && apk upgrade
#RUN apk add git

# copy the app, note .dockerignore
COPY . /app/
RUN yarn install

# build necessary, even if no static files are needed,
# since it builds the server as well
RUN yarn build

# expose 5000 on container
EXPOSE 7000

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0
# set app port
ENV NUXT_PORT=7000

ARG DOCKER_TAG
ENV DOCKER_TAG $DOCKER_TAG

# start the app
CMD [ "yarn", "start" ]
