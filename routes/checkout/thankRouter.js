const { Router } = require("express");
const thankController = require("../../controllers/checkout/thankController");

const thankRouter = Router();

thankRouter.get("/", thankController.thankGet);

module.exports = thankRouter;