# ---- Base Node ----
FROM node:18-alpine AS base
WORKDIR /home/node

#
# ---- Dependencies ----
FROM base AS dependencies
COPY package.json package-lock.json ./
RUN npm ci

#
# ---- Build ----
FROM dependencies AS build
COPY platformatic.runtime.json ./
COPY services/service/ ./services/service/
ENV PLT_TYPESCRIPT=true
RUN npm run build

#
# ---- Prune ----
FROM dependencies AS prune
RUN npm prune --omit=dev

#
# ---- Package ----
FROM base AS package
# install tini and set as entrypoint
RUN apk add --no-cache tini
ENTRYPOINT ["/sbin/tini", "--"]
# copy build output and node_modules
COPY --chown=root:root --from=prune /home/node/node_modules/ ./node_modules/
COPY --chown=root:root package.json platformatic.runtime.json ./
COPY --chown=root:root --from=build /home/node/services/service/dist/ ./services/service/dist/
COPY --chown=root:root services/service/platformatic.service.json ./services/service/

#
# ---- Start ----
FROM package as start
USER node
ENV PLT_TYPESCRIPT=false
CMD ["npm", "run", "start"]