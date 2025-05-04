const { Router } = require("express");
const profileController = require("../../controllers/auth/profileController");

const profileRouter = Router();

profileRouter.get("/:id", profileController.getProfilePage);

module.exports = profileRouter;