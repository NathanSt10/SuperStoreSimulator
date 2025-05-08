const { Router } = require("express");
const cleaningController = require("../../controllers/aisles/cleaningController");

const cleaningRouter = Router();

cleaningRouter.get("/:id", cleaningController.cleaningGet);
cleaningRouter.post("/add/:id", cleaningController.addItem);
cleaningRouter.post("/remove/:id", cleaningController.removeItem);

module.exports = cleaningRouter;