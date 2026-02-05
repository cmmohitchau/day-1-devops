FROM oven/bun:latest

WORKDIR /usr/src/app

ARG DATABASE_URL

COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json

COPY ./turbo.json ./turbo.json

COPY ./packages ./packages

COPY ./apps/http-backend ./apps/http-backend

RUN bun install

RUN DATABASE_URL=$DATABASE_URL bun run generate:db

EXPOSE 3002

CMD ["bun" , "run" , "start:backend"]