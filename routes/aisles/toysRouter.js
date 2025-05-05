const { Router } = require("express");
const toysController = require("../../controllers/aisles/toysController");

const toysRouter = Router();

toysRouter.get("/:id", toysController.toysGet);

module.exports = toysRouter;