const asyncHandler = require("express-async-handler");
const User = require("../../models/usersModel");

exports.getLoginPage = asyncHandler(async (req, res) => {
  const users = await User.findAll();
  res.render("auth/login", {
    title: "SuperStore",
    users: users,
  });
});
