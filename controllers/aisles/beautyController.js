const asyncHandler = require("express-async-handler");
const Beauty = require("../../models/beautyModel");
const Cart = require("../../models/cartModel");

exports.beautyGet = asyncHandler(async (req, res) => {
  const memberid = req.params.id;
  const beauty = await Beauty.findAll();
  const cart = await Cart.findAll(memberid);
  res.render("aisles/beauty", {
    title: "SuperStore",
    beauty: beauty,
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

  res.redirect(`/beauty/${memberId}`);
});
