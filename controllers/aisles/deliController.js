const asyncHandler = require("express-async-handler");
const Deli = require("../../models/deliModel");
const Cart = require("../../models/cartModel");

exports.deliGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const deli = await Deli.findAll();
  const cart = await Cart.findAll();
  res.render("aisles/deli", {
    title: "SuperStore",
    deli: deli,
    cart: cart,
    memberid: memberid,
  });
});
