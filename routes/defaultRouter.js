const { Router } = require("express");
const loginController = require("../controllers/loginController");

const defaultRouter = Router();

defaultRouter.get("/office", loginController.officeWelcomeGet);
defaultRouter.get("/", loginController.loginWelcomeGet);


module.exports = defaultRouter;
