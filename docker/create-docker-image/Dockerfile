# base image
FROM alpine

# dependencies
RUN apk add --update redis
RUN apk add --update gcc

# run
CMD ["redis-server"]
