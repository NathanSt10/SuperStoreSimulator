const { Router } = require("express");
const electronicsController = require("../../controllers/aisles/electronicsController");

const electronicsRouter = Router();

electronicsRouter.get("/:id", electronicsController.electronicsGet);
electronicsRouter.post("/add/:id", electronicsController.addItem);
electronicsRouter.post("/remove/:id", electronicsController.removeItem);

module.exports = electronicsRouter;