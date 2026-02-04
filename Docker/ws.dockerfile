FROM oven/bun

WORKDIR /usr/src/app

COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json

COPY ./turbo.json ./turbo.json

COPY ./packages ./packages

COPY ./apps/ws ./apps/ws

RUN bun install

RUN bun run generate:db

EXPOSE 8080

CMD ["bun" , "run" , "start:ws"]