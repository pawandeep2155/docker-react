FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# builder stage/phase will create the build directory in container working directory

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html