const { Router } = require("express");
const loginController = require("../../controllers/auth/loginController");

const loginRouter = Router();

loginRouter.get("/", loginController.getLoginPage);
loginRouter.post("/", loginController.authenticateUser);


module.exports = loginRouter;