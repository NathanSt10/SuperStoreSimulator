const express = require("express");
const server = express();
const path = require("node:path");

const defaultRouter = require("./routes/defaultRouter");

// Middleware
server.use(express.static(path.join(__dirname, "public"))); // Serves static files in public (.html, .css)
server.set("views", path.join(__dirname, "views")); // Serves dynamic files in views (.ejs)
server.set("view engine", "ejs"); // Tells server view's templates are .ejs
server.use(express.urlencoded({ extended: true }));

// Routes
server.use("/", defaultRouter);

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(
    `Server running Here https://localhost:${PORT}`
  );
});
