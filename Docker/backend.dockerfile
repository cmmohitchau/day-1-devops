FROM oven/bun

WORKDIR /usr/src/app

COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json

COPY ./turbo.json ./turbo.json

COPY ./packages ./packages

COPY ./apps/http-backend ./apps/http-backend

RUN bun install

RUN bun run generate:db

EXPOSE 3002

CMD ["bun" , "run" , "start:backend"]