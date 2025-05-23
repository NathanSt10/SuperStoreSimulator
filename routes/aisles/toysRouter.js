const { Router } = require("express");
const toysController = require("../../controllers/aisles/toysController");

const toysRouter = Router();

toysRouter.get("/:id", toysController.toysGet);
toysRouter.post("/add/:id", toysController.addItem);
toysRouter.post("/remove/:id", toysController.removeItem);

module.exports = toysRouter;