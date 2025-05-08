const { Router } = require("express");
const frozenController = require("../../controllers/aisles/frozenController");

const frozenRouter = Router();

frozenRouter.get("/:id", frozenController.frozenGet);
frozenRouter.post("/add/:id", frozenController.addItem);
frozenRouter.post("/remove/:id", frozenController.removeItem);

module.exports = frozenRouter;