const asyncHandler = require("express-async-handler");
const Member = require("../../models/membersModel");

exports.getProfilePage = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const [[member]] = await Member.getMember(memberid);
  console.log(member)
  res.render("auth/profile", { member: member });
});
