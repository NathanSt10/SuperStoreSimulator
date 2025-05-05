const { Router } = require("express");
const electronicsController = require("../../controllers/aisles/electronicsController");

const electronicsRouter = Router();

electronicsRouter.get("/:id", electronicsController.electronicsGet);

module.exports = electronicsRouter;