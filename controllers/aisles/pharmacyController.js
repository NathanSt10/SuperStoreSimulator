const asyncHandler = require("express-async-handler");
const Pharmacy = require("../../models/pharmacyModel");
const Cart = require("../../models/cartModel");

exports.pharmacyGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const pharmacy = await Pharmacy.findAll();
  const cart = await Cart.findAll(memberid);
  res.render("aisles/pharmacy", {
    title: "SuperStore",
    pharmacy: pharmacy,
    cart: cart,
    memberid: memberid,
  });
});
