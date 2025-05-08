const { Router } = require("express");
const automotiveController = require("../../controllers/aisles/automotiveController");

const automotiveRouter = Router();

automotiveRouter.get("/:id", automotiveController.automotiveGet);
automotiveRouter.post("/add/:id", automotiveController.addItem);
automotiveRouter.post("/remove/:id", automotiveController.removeItem);

module.exports = automotiveRouter;