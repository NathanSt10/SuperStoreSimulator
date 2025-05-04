const asyncHandler = require("express-async-handler");
const User = require("../../models/usersModel");

exports.getLoginPage = asyncHandler(async (req, res) => {
  res.render("auth/login");
});

exports.authenticateUser = asyncHandler(async (req, res) => {
  const { username, password } = req.body;
  const [[user]] = await User.getUser(username);
  console.log("user: ", user);
  // console.log("username: ", user.username);
  if (user && password === user.password) {
    console.log("Entered password: ", password);
    console.log("Actual user password: ", user.password);
    console.log("Good password");
    res.redirect("entrance");
  } else {
    // console.log("Entered password: ", password);
    // console.log("Actual user password: ", user.password);
    console.log("Bad password");
    res.render("auth/login");
  }
});
