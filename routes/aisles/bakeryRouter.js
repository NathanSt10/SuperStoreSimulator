const { Router } = require("express");
const bakeryController = require("../../controllers/aisles/bakeryController");

const bakeryRouter = Router();

bakeryRouter.get("/:id", bakeryController.bakeryGet);

module.exports = bakeryRouter;