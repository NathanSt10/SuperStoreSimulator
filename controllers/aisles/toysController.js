const asyncHandler = require("express-async-handler");
const Toys = require("../../models/toysModel");
const Cart = require("../../models/cartModel");

exports.toysGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const toys = await Toys.findAll();
  const cart = await Cart.findAll();
  res.render("aisles/toys", {
    title: "SuperStore",
    toys: toys,
    cart: cart,
    memberid: memberid,
  });
});
