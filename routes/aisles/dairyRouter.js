const { Router } = require("express");
const dairyController = require("../../controllers/aisles/dairyController");

const dairyRouter = Router();

dairyRouter.get("/", dairyController.dairyGet);

module.exports = dairyRouter;