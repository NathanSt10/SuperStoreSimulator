const { Router } = require("express");

const entranceRouter = Router();

entranceRouter.get("/", (req, res) => res.render("aisles/entrance"));


module.exports = entranceRouter;