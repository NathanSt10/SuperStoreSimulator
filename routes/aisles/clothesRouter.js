const { Router } = require("express");
const clothesController = require("../../controllers/aisles/clothesController");

const clothesRouter = Router();

clothesRouter.get("/:id", clothesController.clothesGet);
clothesRouter.post("/add/:id", clothesController.addItem);
clothesRouter.post("/remove/:id", clothesController.removeItem);

module.exports = clothesRouter;