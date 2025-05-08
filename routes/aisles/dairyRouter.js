const { Router } = require("express");
const dairyController = require("../../controllers/aisles/dairyController");

const dairyRouter = Router();

dairyRouter.get("/:id", dairyController.dairyGet);
dairyRouter.post("/add/:id", dairyController.addItem);
dairyRouter.post("/remove/:id", dairyController.removeItem);

module.exports = dairyRouter;