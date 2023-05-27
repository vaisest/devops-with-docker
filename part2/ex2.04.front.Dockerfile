FROM node:16-alpine

WORKDIR /usr/src/app

COPY example-frontend/package.json .
COPY example-frontend/package-lock.json .
ENV NODE_ENV=production
RUN npm install --production

COPY example-frontend .

ARG REACT_APP_BACKEND_URL
RUN npm run build

RUN npm install -g serve
CMD serve -s -l 5000 build
EXPOSE 5000