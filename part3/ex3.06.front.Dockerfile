FROM node:16-alpine as build

WORKDIR /home/app/
COPY example-frontend .

ENV NODE_ENV=production
RUN addgroup app && adduser app --disabled-password --ingroup app && chown -R app:app .
USER app
RUN npm ci && npm run build && mv build /tmp/build && rm -rf * && mv /tmp/build .

CMD npx serve -s -l 5000 .

EXPOSE 5000