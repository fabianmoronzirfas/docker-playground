# multistage build
FROM node:alpine as build
WORKDIR /app
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build
#----------------------
# naming the phase is not needed here
# but still nice
FROM nginx as server
WORKDIR /usr/share/nginx/html
COPY --from=build /app/build .

