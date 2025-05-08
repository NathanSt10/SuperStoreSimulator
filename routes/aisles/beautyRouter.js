const { Router } = require("express");
const beautyController = require("../../controllers/aisles/beautyController");

const beautyRouter = Router();

beautyRouter.get("/:id", beautyController.beautyGet);
beautyRouter.post("/add/:id", beautyController.addItem);
beautyRouter.post("/remove/:id", beautyController.removeItem);

module.exports = beautyRouter;