const asyncHandler = require("express-async-handler");
const User = require("../models/usersModel");

exports.loginWelcomeGet = asyncHandler(async (req, res) => {
  const users = await User.findAll();
  res.render("login", {
    title: "SuperStore",
    users: users,
  });
});

exports.officeWelcomeGet = asyncHandler(async (req, res) => {
  const users = await User.findAll();
  res.render("office", {
    title: "SuperStore",
    users: users,
  });
});
