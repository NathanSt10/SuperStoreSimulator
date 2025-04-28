const { Router } = require("express");
const officeController = require("../../controllers/office/officeController");

const officeRouter = Router();
officeRouter.get("/", officeController.officeWelcomeGet);

module.exports = officeRouter;