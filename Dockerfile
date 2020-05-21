FROM node:alpine
WORKDIR '/usr/nodeapp'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
EXPOSE 80
COPY --from=0 /usr/nodeapp/build /usr/share/nginx/html


