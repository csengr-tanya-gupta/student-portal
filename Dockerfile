FROM node:24-alpine

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

COPY --chown=node:node package*.json ./
RUN npm ci --omit=dev

COPY --chown=node:node . .
RUN mkdir -p data && chown -R node:node /app

USER node

EXPOSE 3000

CMD ["npm", "start"]
