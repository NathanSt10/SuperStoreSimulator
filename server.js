const express = require("express");
const server = express();
const path = require("node:path");
const loginRouter = require("./routes/auth/loginRouter");
const registerRouter = require("./routes/auth/registerRouter");
const officeRouter = require("./routes/office/officeRouter");
const entranceRouter = require("./routes/aisles/entranceRouter");
const checkoutRouter = require("./routes/checkout/checkoutRouter");
const thankRouter = require("./routes/checkout/thankRouter");
const profileRouter = require("./routes/auth/profileRouter");
const bakeryRouter = require("./routes/aisles/bakeryRouter");
const deliRouter = require("./routes/aisles/deliRouter");
const dairyRouter = require("./routes/aisles/dairyRouter");
const frozenRouter = require("./routes/aisles/frozenRouter");
const clothesRouter = require("./routes/aisles/clothesRouter");


// Middleware
server.use(express.static(path.join(__dirname, "public"))); // Serves static files in public (.html, .css)
server.set("views", path.join(__dirname, "views")); // Serves dynamic files in views (.ejs)
server.set("view engine", "ejs"); // Tells server view's templates are .ejs
server.use(express.urlencoded({ extended: true })); // parses form data
//const methodOverride = require('method-override');
//server.use(methodOverride('_method'));

// Routes
server.use("/login", loginRouter);
server.use("/register", registerRouter);
server.use("/profile", profileRouter);
server.use("/entrance", entranceRouter);
server.use("/checkout", checkoutRouter);
server.use("/thank", thankRouter);
server.use("/office", officeRouter);
server.use("/bakery", bakeryRouter);
server.use("/deli", deliRouter);
server.use("/dairy", dairyRouter);
server.use("/frozen", frozenRouter);
server.use("/clothes", clothesRouter);

// Redirect root to login
server.get("/", (req, res) => {
  res.redirect("/login");
});


// Error handling
server.use((err, req, res, next) => {
  const statusCode = res.statusCode === 200 ? 500 : res.statusCode;
  res.status(statusCode);
  res.json({
    message: err.message,
    stack: process.env.NODE_ENV === 'production' ? '🥞' : err.stack
  });
});

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(`Server running here: http://localhost:${PORT}`);
});
