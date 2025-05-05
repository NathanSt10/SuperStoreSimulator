const { Router } = require("express");
const beautyController = require("../../controllers/aisles/beautyController");

const beautyRouter = Router();

beautyRouter.get("/:id", beautyController.beautyGet);

module.exports = beautyRouter;