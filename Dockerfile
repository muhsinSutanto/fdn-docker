# The name of the base image to use.
# Set the base image to use for any subsequent instructions that follow.
# FROM <base image> 
FROM node:10-alpine

# The absolute or relative path to use as the working directory. Will be created if it does not exist.
# Set the working directory for any ADD, COPY, CMD, ENTRYPOINT, or RUN instructions that follow. 
# WORKDIR < /the/workdir/path >
WORKDIR /usr/src/app

# Copy files or folders from source to the dest path in the image's filesystem.
# COPY <source> <dest>
COPY package*.json ./

# Execute any commands on top of the current image as a new layer and commit the results.
RUN npm install

# Difference between COPY & ADD => https://medium.freecodecamp.org/dockerfile-copy-vs-add-key-differences-and-best-practices-9570c4592e9e
#ADD <source> <dest>
ADD . .

# Define the network ports that this container will listen on at runtime.
# EXPOSE <port>
EXPOSE 40000

# Provide defaults for an executing container.
# If an executable is not specified, then ENTRYPOINT must be specified as well.
CMD ["node", "index.js"]