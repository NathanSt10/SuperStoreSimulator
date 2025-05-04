const { Router } = require("express");
const entranceController = require("../../controllers/aisles/entranceController");

const entranceRouter = Router();

entranceRouter.get("/:id", entranceController.entranceGet);

module.exports = entranceRouter;