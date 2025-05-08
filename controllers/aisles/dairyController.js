const asyncHandler = require("express-async-handler");
const Dairy = require("../../models/dairyModel");
const Cart = require("../../models/cartModel");

exports.dairyGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const dairy = await Dairy.findAll();
  const cart = await Cart.findAll(memberid);
  res.render("aisles/dairy", {
    title: "SuperStore",
    dairy: dairy,
    cart: cart,
    memberid: memberid,
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

  res.redirect(`/dairy/${memberId}`);
});

exports.removeItem = asyncHandler(async (req, res) => {
  const memberId = req.params.id;
  const productName = req.body.productName;
  const [results] = await Cart.findProduct(productName);
  const productId = results[0].id;
  await Cart.removeFromCart(memberId, productId);
  res.redirect(`/dairy/${memberId}`);
});