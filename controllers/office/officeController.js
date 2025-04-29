const asyncHandler = require("express-async-handler");
const Member = require("../../models/membersModel");

exports.officeWelcomeGet = asyncHandler(async (req, res) => {
    const members = await Member.findAll();
    res.render("office", {
      title: "SuperStore",
      members: members
    });
  });

// Update a member
//.put('/members/:id', (req, res) => {
exports.officeUpdate = asyncHandler(async (req, res) => {
  const { id } = req.params;
  let { email, phone_number } = req.body;
  const [[member]] = await Member.getMember(id);
  //console.log("member: ", member)
  // console.log("Last", member[1])
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
