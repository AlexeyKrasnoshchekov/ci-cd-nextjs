# using staged builds
# FROM node:22-slim as builder
# make the directory where the project files will be stored
#RUN mkdir -p /app
# set it as the working directory so that we don't need to keep referencing it
# WORKDIR /app
# Copy the package.json file
# COPY package.json package-lock.json ./
# RUN npm install
# copy project files 
# make sure to set up .dockerignore to copy only necessary files
# COPY . .
# run the build command which will build and export html files
# RUN npm run build
# bundle static assets with nginx
FROM nginx:1.21.0-alpine
WORKDIR /app
# ENV NODE_ENV=production
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY /app/index.html /usr/share/nginx/html/index.html
# COPY --from=builder /app/out /usr/share/nginx/html/
EXPOSE 30012
# start nginx
CMD ["nginx", "-g", "daemon off;"]
