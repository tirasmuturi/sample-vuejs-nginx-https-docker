# build environment
FROM node:10 as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package*.json /app/
RUN npm install --silent
RUN npm install @vue/cli@3.7.0 -g
COPY . /app
RUN ls /app/nginx/my-site.com.crt
RUN pwd
RUN npm run build

# production environment
FROM nginx:1.16.0-alpine
COPY --from=build /app/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
RUN mkdir /etc/nginx/ssl
COPY nginx/my-site.com.crt /etc/nginx/ssl
COPY nginx/my-site.com.key /etc/nginx/ssl
COPY nginx/nginx.conf /etc/nginx/conf.d
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
