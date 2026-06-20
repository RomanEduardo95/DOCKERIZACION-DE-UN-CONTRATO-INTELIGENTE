FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY hardhat.config.ts tsconfig.json ./

COPY contracts/  contracts/

COPY scripts/  scripts/

COPY test/  test/

CMD ["npx", "hardhat", "run", "scripts/crear-evento.ts"]

#CMD ["npx", "hardhat", "compile"]


