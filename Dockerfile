# builder is name of phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# next phase
FROM nginx
# copy stuff from previous phase
COPY --from=builder /app/build /usr/share/nginx/html


