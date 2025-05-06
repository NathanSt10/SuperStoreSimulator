const asyncHandler = require("express-async-handler");
const Automotive = require("../../models/automotiveModel");
const Cart = require("../../models/cartModel");

exports.automotiveGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const automotive = await Automotive.findAll();
  const cart = await Cart.findAll(memberid);
  res.render("aisles/automotive", {
    title: "SuperStore",
    automotive: automotive,
    cart: cart,
    memberid: memberid,
  });
});
