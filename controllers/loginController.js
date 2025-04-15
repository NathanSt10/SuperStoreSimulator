const asyncHandler = require("express-async-handler");
const User = require("../models/usersModel");

exports.loginWelcomeGet = asyncHandler(async (req, res) => {
  const users = await User.findAll();
  res.render("index", {
    title: "SuperStore",
    users: users,
  });
});
