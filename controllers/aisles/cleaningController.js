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

  res.redirect(`/cleaning/${memberId}`);
});
