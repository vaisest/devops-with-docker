FROM node:16-alpine

RUN addgroup app && adduser app --disabled-password --ingroup app
USER app

WORKDIR /home/app

COPY example-frontend .
RUN npm ci

RUN npm run build

CMD npx serve -s -l 5000 build

EXPOSE 5000