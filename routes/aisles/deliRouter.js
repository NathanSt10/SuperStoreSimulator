const { Router } = require("express");
const deliController = require("../../controllers/aisles/deliController");

const deliRouter = Router();

deliRouter.get("/:id", deliController.deliGet);

module.exports = deliRouter;