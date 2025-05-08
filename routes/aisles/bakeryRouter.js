const { Router } = require("express");
const bakeryController = require("../../controllers/aisles/bakeryController");

const bakeryRouter = Router();

bakeryRouter.get("/:id", bakeryController.bakeryGet);
bakeryRouter.post("/add/:id", bakeryController.addItem);
bakeryRouter.post("/remove/:id", bakeryController.removeItem);

module.exports = bakeryRouter;