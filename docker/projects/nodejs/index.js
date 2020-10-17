const express = require("express");

const app = express();

app.get("/", (req, resp) => {
  resp.send("hola amiwo");
});

app.listen(8080, () => {
  console.log("Listening on port 8080");
});
