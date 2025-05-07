const { Router } = require("express");
const pharmacyController = require("../../controllers/aisles/pharmacyController");

const pharmacyRouter = Router();

pharmacyRouter.get("/:id", pharmacyController.pharmacyGet);
pharmacyRouter.post("/add/:id", pharmacyController.addItem);

module.exports = pharmacyRouter;