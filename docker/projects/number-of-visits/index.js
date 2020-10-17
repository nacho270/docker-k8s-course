const express = require("express");
const redis = require("redis");

const app = express();
const redisClient = redis.createClient({
  host: "redis-server", // same as docker compose
  port: 6379,
});

redisClient.set("visits", 0);

app.get("/", (req, resp) => {
  redisClient.get("visits", (err, visits) => {
    resp.send("Number of visits: " + visits);
    redisClient.set("visits", parseInt(visits) + 1);
  });
});

app.listen(8080, () => {
  console.log("Listening on port 8080");
});
