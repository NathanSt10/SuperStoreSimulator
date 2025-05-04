const asyncHandler = require("express-async-handler");
const Checkout = require("../../models/checkoutModel");

exports.checkoutGet = asyncHandler(async (req, res) => {
    const checkout = await Checkout.findAll();
    res.render("checkout/checkout", {
      title: "SuperStore",
      checkout: checkout
    });
  });