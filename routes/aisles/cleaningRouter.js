const { Router } = require("express");
const cleaningController = require("../../controllers/aisles/cleaningController");

const cleaningRouter = Router();

cleaningRouter.get("/:id", cleaningController.cleaningGet);

module.exports = cleaningRouter;