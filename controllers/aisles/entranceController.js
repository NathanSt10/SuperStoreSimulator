const asyncHandler = require("express-async-handler");
const Produce = require("../../models/produceModel");
const Cart = require("../../models/cartModel");

exports.entranceGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const produce = await Produce.findAll();
  const cart = await Cart.findAll(memberid);
  res.render("aisles/entrance", {
    title: "SuperStore",
    produce: produce,
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
  await Cart.addToCart(memberId, productId, quantity);

  res.redirect(`/entrance/${memberId}`);
});
