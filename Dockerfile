FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#上でビルドしたものから必要最低限をコピーしてnginxを起動する。
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# docker build .
# docker run -p 8080:80 <image>
# *if you see nginx welcome page then you have typo in this Dockerfile