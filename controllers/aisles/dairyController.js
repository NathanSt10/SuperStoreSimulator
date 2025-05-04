const asyncHandler = require("express-async-handler");
const Dairy = require("../../models/dairyModel");
const Cart = require("../../models/cartModel");

exports.dairyGet = asyncHandler(async (req, res) => {
    const dairy = await Dairy.findAll();
    const cart = await Cart.findAll();
    res.render("aisles/dairy", {
      title: "SuperStore",
      dairy: dairy,
      cart: cart
    });
});