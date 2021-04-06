FROM node:alpine as builder
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx

# Copy the nginx configuration file. This sets up the behavior of nginx, most
# importantly, it ensure nginx listens on port 8080. Google App Engine expects
# the runtime to respond to HTTP requests at port 8080.
COPY nginx.conf /etc/nginx/nginx.conf

# create log dir configured in nginx.conf
RUN mkdir -p /var/log/app_engine

COPY --from=builder /app/build /usr/share/nginx/www