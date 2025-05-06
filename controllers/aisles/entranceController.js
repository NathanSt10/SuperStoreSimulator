const asyncHandler = require("express-async-handler");
const Produce = require("../../models/produceModel");
const Cart = require("../../models/cartModel");
const db = require('../../config/db.js');// may need to change

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
  const [results] = await db.query(
    'SELECT p.id FROM product p INNER JOIN aisle_view a ON p.name = a.name WHERE a.name = ?',
    [productName]
  );

  if (!results.length) {
    // No matching product found
    return res.status(404).send('Product not found');
  }

  const productId = results[0].id;

  // 2. Now call the stored procedure with the valid productId
  await db.query('CALL add_to_bag(?, ?, ?)', [memberId, productId, quantity]);

  res.redirect(`/entrance/${memberId}`);
});
