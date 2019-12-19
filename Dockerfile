FROM node:alpine as builder_phase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as run_phase
COPY --from=builder_phase /app/build /usr/share/nginx/html
