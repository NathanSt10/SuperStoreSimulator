const asyncHandler = require("express-async-handler");
const Clothes = require("../../models/clothesModel");
const Cart = require("../../models/cartModel");

exports.clothesGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const clothes = await Clothes.findAll();
  const cart = await Cart.findAll(memberid);
  res.render("aisles/clothes", {
    title: "SuperStore",
    clothes: clothes,
    cart: cart,
    memberid: memberid,
  });
});
