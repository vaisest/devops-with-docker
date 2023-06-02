FROM node:16-alpine as build

WORKDIR /home/app/
COPY example-frontend .

ENV NODE_ENV=production
RUN npm ci && npm run build


FROM node:16-alpine as run

RUN addgroup app && adduser app --disabled-password --ingroup app
WORKDIR /home/app/
RUN chown -R app:app .
USER app

COPY --from=build /home/app/build ./build

CMD npx serve -s -l 5000 build

EXPOSE 5000