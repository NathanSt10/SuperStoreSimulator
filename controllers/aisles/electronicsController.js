const asyncHandler = require("express-async-handler");
const Electronics = require("../../models/electronicsModel");
const Cart = require("../../models/cartModel");

exports.electronicsGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const electronics = await Electronics.findAll();
  const cart = await Cart.findAll(memberid);
  res.render("aisles/electronics", {
    title: "SuperStore",
    electronics: electronics,
    cart: cart,
    memberid: memberid,
  });
});
