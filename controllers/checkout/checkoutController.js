const asyncHandler = require("express-async-handler");
const Checkout = require("../../models/checkoutModel");

exports.checkoutGet = asyncHandler(async (req, res) => {
    const memberid = req.params.id;
    const checkout = await Checkout.findAll(memberid);
    res.render("checkout/checkout", {
      title: "SuperStore",
      checkout: checkout,
      memberid: memberid
    });
  });