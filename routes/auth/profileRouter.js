const { Router } = require("express");
const profileController = require("../../controllers/auth/profileController");

const profileRouter = Router();

profileRouter.get("/", profileController.getProfilePage);

module.exports = profileRouter;