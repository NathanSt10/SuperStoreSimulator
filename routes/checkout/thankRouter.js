const { Router } = require("express");
const thankController = require("../../controllers/checkout/thankController");

const thankRouter = Router();

thankRouter.get("/:id", thankController.thankGet);

module.exports = thankRouter;