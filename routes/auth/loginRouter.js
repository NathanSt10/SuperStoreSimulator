const { Router } = require("express");
const loginController = require("../../controllers/auth/loginController");

const loginRouter = Router();

loginRouter.get("/", loginController.getLoginPage);


module.exports = loginRouter;