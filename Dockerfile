FROM node:17-alpine

# Normally, would do this in the docker-compose.yaml file instead of here.
# ENV MONGO_DB_USERNAME=mongadmin \
#     MONGO_DB_PWD=secret

RUN mkdir -p /home/app

# Should put Dockerfile at the outmost layer of the repo
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
# Somehow this will take forever to do so I don't do it, instead I COPY all the node_modules to the thing in the COPY step.
# RUN npm install

# Try this to check if we have enough files
# RUN cd ./home/app && ls

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

