const { Router } = require("express");
const entranceController = require("../../controllers/aisles/entranceController");

const entranceRouter = Router();

entranceRouter.get("/:id", entranceController.entranceGet);
entranceRouter.post("/add/:id", entranceController.addItem);

module.exports = entranceRouter;
