const asyncHandler = require("express-async-handler");
const Beauty = require("../../models/beautyModel");
const Cart = require("../../models/cartModel");

exports.beautyGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const beauty = await Beauty.findAll();
  const cart = await Cart.findAll();
  res.render("aisles/beauty", {
    title: "SuperStore",
    beauty: beauty,
    cart: cart,
    memberid: memberid,
  });
});
