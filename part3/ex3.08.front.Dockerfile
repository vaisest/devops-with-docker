FROM node:16-alpine as build

WORKDIR /home/app/
COPY example-frontend .

ENV NODE_ENV=production
RUN npm ci && npm run build


FROM nginx:alpine-slim as run

COPY --from=build /home/app/build /usr/share/nginx/html
RUN sed -i s/80/5000/ /etc/nginx/conf.d/default.conf

EXPOSE 5000