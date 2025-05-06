const asyncHandler = require("express-async-handler");
const Frozen = require("../../models/frozenModel");
const Cart = require("../../models/cartModel");

exports.frozenGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const frozen = await Frozen.findAll();
  const cart = await Cart.findAll();
  res.render("aisles/frozen", {
    title: "SuperStore",
    frozen: frozen,
    cart: cart,
    memberid: memberid,
  });
});
