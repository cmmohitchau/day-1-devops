FROM oven/bun

WORKDIR /usr/src/app

COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json

COPY ./turbo.json ./turbo.json

COPY ./packages ./packages

COPY ./apps/my-app ./apps/my-app

RUN bun install

RUN bun run generate:db

ARG DATABASE_URL

RUN DATABASE_URL=$DATABASE_URL bun run build 

EXPOSE 3000

CMD ["bun" , "run" , "start:frontend"]