const asyncHandler = require("express-async-handler");
const Member = require("../../models/membersModel");
const Product = require("../../models/officeModel");

exports.officeWelcomeGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const members = await Member.findAll();
  res.render("office", {
    title: "SuperStore",
    members: members,
    memberid: memberid
  });
});


exports.officeUpdate = asyncHandler(async (req, res) => {
  const { id, updateid } = req.params;
  let { email, phone_number } = req.body;
  const [[member]] = await Member.getMember(updateid);
  if(email == "") {
    email = member.email
  }

  if(phone_number == "") {
    phone_number = member.phone_number
  }
  await Member.updateMember(updateid, email, phone_number);
  const members = await Member.findAll();
  res.redirect(`/office/${id}`);
});

exports.officeDelete = asyncHandler(async (req, res) => {
  const { id, updateid } = req.params;
  await Member.deleteMember(updateid);
  res.redirect(`/office/${id}`);
});

exports.restock = asyncHandler(async (req, res) => {
  const { id } = req.params;
  const quantity = req.body.quantity;
  await Product.restock(quantity);
  res.redirect(`/office/${id}`);
})
