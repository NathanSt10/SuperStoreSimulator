const asyncHandler = require("express-async-handler");
const User = require("../../models/usersModel");

exports.getLoginPage = asyncHandler(async (req, res) => {
  res.render("auth/login");
});

exports.authenticateUser = asyncHandler(async (req, res) => {
  const { username } = req.body;
  const [user] = await User.getUser(username);
  console.log("user: ", user.username);
  res.render("aisles/entrance");
});