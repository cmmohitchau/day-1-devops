FROM oven/bun

WORKDIR /usr/src/app

COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json

COPY ./turbo.json ./turbo.json

COPY ./packages ./packages

COPY ./apps/ws ./apps/ws

ARG DATABASE_URL

RUN bun install

RUN DATABASE_URL=$DATABASE_URL bun run generate:db

EXPOSE 8080

CMD ["bun" , "run" , "start:ws"]