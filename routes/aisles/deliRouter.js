const { Router } = require("express");
const deliController = require("../../controllers/aisles/deliController");

const deliRouter = Router();

deliRouter.get("/", deliController.deliGet);

module.exports = deliRouter;