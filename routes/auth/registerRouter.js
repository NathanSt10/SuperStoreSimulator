const { Router } = require("express");
const registerController = require("../../controllers/auth/registerController");

const registerRouter = Router();

registerRouter.get("/", registerController.getRegisterPage);
registerRouter.post("/", registerController.createUser)

module.exports = registerRouter;
