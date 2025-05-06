const asyncHandler = require("express-async-handler");
const User = require("../../models/usersModel");

exports.getLoginPage = asyncHandler(async (req, res) => {
  const { registered, username } = req.query;
  res.render("auth/login", {
    invalidLogin: false,
    showWelcome: registered === "true",
    registeredUsername: username || null
  });
});

exports.authenticateUser = asyncHandler(async (req, res) => {
  const { username, password } = req.body;
  const [[user]] = await User.getUser(username);

  if (user && password === user.password) {
    const [[memberid]] = await User.getMember(user.id);
    res.redirect(`entrance/${memberid.member_id}`);
  } else {
    res.render("auth/login", { invalidLogin: true, showWelcome: false, registeredUsername: null});
  }
});
