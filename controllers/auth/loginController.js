const asyncHandler = require("express-async-handler");
const User = require("../../models/usersModel");
const Member = require("../../models/membersModel");

exports.getLoginPage = asyncHandler(async (req, res) => {
  res.render("auth/login");
});
