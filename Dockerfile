# Fetching the minified node image on alpine linux
FROM node:slim

# Setting up the work directory
WORKDIR /usr/src/app

# Install curl
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*
# Copying all the files in our project
COPY app/package*.json ./

COPY app/ .

# Installing dependencies
RUN npm install

# Exposing server port
EXPOSE 8080
# Starting our application
CMD [ "node", "index.js" ]

