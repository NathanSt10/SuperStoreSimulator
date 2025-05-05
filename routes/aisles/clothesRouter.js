const { Router } = require("express");
const clothesController = require("../../controllers/aisles/clothesController");

const clothesRouter = Router();

clothesRouter.get("/:id", clothesController.clothesGet);

module.exports = clothesRouter;