const asyncHandler = require("express-async-handler");
const Pharmacy = require("../../models/pharmacyModel");
const Cart = require("../../models/cartModel");

exports.pharmacyGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const pharmacy = await Pharmacy.findAll();
  const cart = await Cart.findAll(memberid);
  const [totalItems] = await Cart.totalItems(memberid);
  res.render("aisles/pharmacy", {
    title: "SuperStore",
    pharmacy: pharmacy,
    cart: cart,
    memberid: memberid,
    totalItems: totalItems.total
  });
});

exports.addItem = asyncHandler(async (req, res) => {
  const memberId = req.params.id;
  const productName = req.body.productName;
  const quantity = 1;
  console.log('Submitted productName:', productName);

  // 1. Get product_id from the database
  const [results] = await Cart.findProduct(productName);

  const productId = results[0].id;

  // 2. Now call the stored procedure with the valid productId
  await Cart.addToCart(memberId, productId, quantity)

  res.redirect(`/pharmacy/${memberId}`);
});

exports.removeItem = asyncHandler(async (req, res) => {
  const memberId = req.params.id;
  const productName = req.body.productName;
  const [results] = await Cart.findProduct(productName);
  const productId = results[0].id;
  await Cart.removeFromCart(memberId, productId);
  res.redirect(`/pharmacy/${memberId}`);
});