docker rm -f $(docker ps -aq)

docker build -t nacho270/node-express .
docker run -p 8080:8080 nacho270/node-express

docker build -f Dockerfile.dev .
docker run -it -p 3000:3000 -v /app/node_modules -v $(pwd):/app 4e8246f89acc

docker-compose up --build -d
docker-compose down
