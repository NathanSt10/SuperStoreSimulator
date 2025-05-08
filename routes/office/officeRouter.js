const { Router } = require("express");
const officeController = require("../../controllers/office/officeController");

const officeRouter = Router();
officeRouter.post("/:id/delete/:updateid", officeController.officeDelete);
officeRouter.post("/:id/update/:updateid", officeController.officeUpdate);
officeRouter.get("/:id", officeController.officeWelcomeGet);
officeRouter.post("/restock/:id", officeController.restock);


module.exports = officeRouter;