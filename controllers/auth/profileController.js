const asyncHandler = require("express-async-handler");
const Member = require("../../models/membersModel");
const Orders = require("../../models/ordersModel");

exports.getProfilePage = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const orders = await Orders.getOrders(memberid);
  const [[member]] = await Member.getMember(memberid);
  console.log(orders)
  res.render("auth/profile", { member: member, memberid: memberid, orders: orders });
});
