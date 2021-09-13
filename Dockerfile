# # Name the node stage "builder"
# FROM node:15-alpine AS builder

# # Set working directory
# WORKDIR /app

# # Copy our node module specification
# COPY package.json package.json
# COPY yarn.lock yarn.lock

# # install node modules and build assets
# RUN yarn install --production

# # Copy all files from current directory to working dir in image
# # Except the one defined in '.dockerignore'
# COPY . .

# # Create production build of React App
# RUN yarn build

# # Choose NGINX as our base Docker image
# FROM nginx:alpine

# # Set working directory to nginx asset directory
# WORKDIR /usr/share/nginx/html

# # Remove default nginx static assets
# RUN rm -rf *

# # Copy static assets from builder stage
# COPY --from=builder /app/build .

# # Entry point when Docker container has started
# ENTRYPOINT ["nginx", "-g", "daemon off;"]

# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
# COPY package-lock.json ./
RUN npm install

# add app
COPY . ./

# start app
CMD ["npm", "start"]   