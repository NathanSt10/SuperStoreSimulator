const asyncHandler = require("express-async-handler");
const Cleaning = require("../../models/cleaningModel");
const Cart = require("../../models/cartModel");

exports.cleaningGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const cleaning = await Cleaning.findAll();
  const cart = await Cart.findAll(memberid);
  res.render("aisles/cleaning", {
    title: "SuperStore",
    cleaning: cleaning,
    cart: cart,
    memberid: memberid,
  });
});
