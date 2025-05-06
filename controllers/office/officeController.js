const asyncHandler = require("express-async-handler");
const Member = require("../../models/membersModel");

exports.officeWelcomeGet = asyncHandler(async (req, res) => {
    const members = await Member.findAll();
    res.render("office", {
      title: "SuperStore",
      members: members
    });
  });


exports.officeUpdate = asyncHandler(async (req, res) => {
  const { id } = req.params;
  let { email, phone_number } = req.body;
  const [[member]] = await Member.getMember(id);
  if(email == "") {
    email = member.email
  }

  if(phone_number == "") {
    phone_number = member.phone_number
  }
  await Member.updateMember(id, email, phone_number);
  const members = await Member.findAll();
  res.redirect("/office");
});

exports.officeDelete = asyncHandler(async (req, res) => {
  const { id } = req.params;
  await Member.deleteMember(id);
  const members = await Member.findAll();
  res.redirect("/office");
});
