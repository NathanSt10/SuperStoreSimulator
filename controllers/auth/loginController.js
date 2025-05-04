const asyncHandler = require("express-async-handler");
const User = require("../../models/usersModel");

exports.getLoginPage = asyncHandler(async (req, res) => {
  res.render("auth/login", { invalidLogin: false });
});

exports.authenticateUser = asyncHandler(async (req, res) => {
  const { username, password } = req.body;
  const [[user]] = await User.getUser(username);

  if (user && password === user.password) {
    res.render("aisles/entrance");
  } else {
    res.render("auth/login", { invalidLogin: true });
  }
});
