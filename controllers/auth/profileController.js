const asyncHandler = require("express-async-handler");
const Member = require("../../models/membersModel");
const Orders = require("../../models/ordersModel");

exports.getProfilePage = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const orders = await Orders.getOrders(memberid);
  const [[member]] = await Member.getMember(memberid);
  res.render("auth/profile", {
    member: member,
    memberid: memberid,
    orders: orders,
  });
});

exports.profileUpdate = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const orders = await Orders.getOrders(memberid);
  const [[member]] = await Member.getMember(memberid);
  let { email, phone_number } = req.body;
  if(email == "") {
    email = member.email
  }

  if(phone_number == "") {
    phone_number = member.phone_number
  }
  await Member.updateMember(memberid, email, phone_number);
  const [[newMember]] = await Member.getMember(memberid);
  res.render("auth/profile", {
    member: newMember,
    memberid: memberid,
    orders: orders,
  });
});
