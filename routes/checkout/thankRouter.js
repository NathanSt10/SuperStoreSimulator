const { Router } = require("express");
const thankController = require("../../controllers/checkout/thankController");

const thankRouter = Router();

thankRouter.post("/:id", thankController.thankGet);

module.exports = thankRouter;