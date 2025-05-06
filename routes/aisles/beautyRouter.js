const { Router } = require("express");
const beautyController = require("../../controllers/aisles/beautyController");

const beautyRouter = Router();

beautyRouter.get("/:id", beautyController.beautyGet);
beautyRouter.post("/add/:id", beautyController.addItem);

module.exports = beautyRouter;