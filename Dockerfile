# Create the web app
FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# Create the nginx server and connect the two
FROM nginx

# Copy from the first part (0) 
COPY --from=0 /app/build /usr/share/nginx/html