const { Router } = require("express");
const checkoutController = require("../../controllers/checkout/checkoutController");

const checkoutRouter = Router();

checkoutRouter.get("/", checkoutController.checkoutGet);

module.exports = checkoutRouter;