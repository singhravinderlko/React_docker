FROM node:alpine as BuildStage

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --FROM=BuildStage /app/build /usr/share/nginx/html



