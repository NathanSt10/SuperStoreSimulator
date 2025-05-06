const asyncHandler = require("express-async-handler");
const Produce = require("../../models/produceModel");
const Cart = require("../../models/cartModel");

exports.entranceGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const produce = await Produce.findAll();
  const cart = await Cart.findAll();
  res.render("aisles/entrance", {
    title: "SuperStore",
    produce: produce,
    cart: cart,
    memberid: memberid,
  });
});
