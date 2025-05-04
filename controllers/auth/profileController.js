const asyncHandler = require("express-async-handler");

exports.getProfilePage = asyncHandler(async (req, res) => {
  res.render("auth/profile");
});