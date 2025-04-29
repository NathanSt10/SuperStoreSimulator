const { Router } = require("express");
const officeController = require("../../controllers/office/officeController");

const officeRouter = Router();
officeRouter.post("/delete/:id", officeController.officeDelete);
officeRouter.post("/:id", officeController.officeUpdate);
officeRouter.get("/", officeController.officeWelcomeGet);


module.exports = officeRouter;