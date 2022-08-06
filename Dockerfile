FROM node:16.16.0 AS build-step

WORKDIR /apps
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.23.1
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build-step /apps/build /frontend/build
