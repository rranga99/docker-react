FROM node:alpine as builder
WORKDIR '/usr/nodeapp'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
EXPOSE 80
COPY --from=builder /usr/nodeapp/build /usr/share/nginx/html


