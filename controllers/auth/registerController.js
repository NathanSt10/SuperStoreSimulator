const asyncHandler = require("express-async-handler");
const User = require("../../models/usersModel");
const Member = require("../../models/membersModel");

exports.getRegisterPage = asyncHandler(async (req, res) => {
  res.render("auth/register");
});

exports.createUser = asyncHandler(async (req, res) => {
  const { first_name, last_name, email, phone, password, membership } = req.body;
  const memberID = await Member.addMemberProcedure(first_name, last_name, email, phone, membership);
  const username = first_name.substring(0,3) + "_" + last_name.substring(0,3) + memberID;
  // const userID = await User.addUser(username, password);
  // if (userID) {
  res.redirect("/login");
  // }
  // else {
  //   console.error();
  // }
});

