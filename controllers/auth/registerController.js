const asyncHandler = require("express-async-handler");
const Member = require("../../models/membersModel");
const User = require("../../models/usersModel");

exports.getRegisterPage = asyncHandler(async (req, res) => {
  res.render("auth/register");
});

exports.createUser = asyncHandler(async (req, res) => {
  const { first_name, last_name, email, phone, password, membership } = req.body;
  const memberID = await Member.addMemberProcedure(first_name, last_name, email, phone, membership);
  await User.setPassword(memberID, password);
  const username = await User.getUsername(memberID);
  res.redirect(`/login?registered=true&username=${encodeURIComponent(username)}`);
});

