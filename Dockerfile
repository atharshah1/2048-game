FROM nginx:latest
WORKDIR /usr/share/nginx/html
RUN rm -r ./*
COPY . ./
CMD ["nginx", "-g", "daemon off;"]