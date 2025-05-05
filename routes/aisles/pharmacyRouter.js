const { Router } = require("express");
const pharmacyController = require("../../controllers/aisles/pharmacyController");

const pharmacyRouter = Router();

pharmacyRouter.get("/:id", pharmacyController.pharmacyGet);

module.exports = pharmacyRouter;