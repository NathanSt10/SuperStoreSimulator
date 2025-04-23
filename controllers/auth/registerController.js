const asyncHandler = require("express-async-handler");

exports.getRegisterPage = asyncHandler(async (req, res) => {
  res.render("auth/register");
});

exports.createUser = asyncHandler(async (req, res) => {
    res.redirect("/login");
});