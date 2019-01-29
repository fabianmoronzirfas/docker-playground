# multistage build
FROM node:alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build
#----------------------
# naming the phase is not needed here
# but still nice
FROM nginx as server
# We need the expose instruction for
# running it on Elasticbeanstalk
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html

