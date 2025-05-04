const asyncHandler = require("express-async-handler");
const Bakery = require("../../models/bakeryModel");
const Cart = require("../../models/cartModel");

exports.bakeryGet = asyncHandler(async (req, res) => {
    const bakery = await Bakery.findAll();
    const cart = await Cart.findAll();
    res.render("aisles/bakery", {
      title: "SuperStore",
      bakery: bakery,
      cart: cart
    });
});