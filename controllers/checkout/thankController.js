const asyncHandler = require("express-async-handler");
const Thank = require("../../models/thankModel");

exports.thankGet = asyncHandler(async (req, res) => {
    const memberid = req.params.id;
    const payment_type = req.body.payment_type;
    const order = await Thank.createOrder(memberid);
    const payment = await Thank.createPayment(memberid, payment_type);
    const thank = await Thank.getMostRecent(memberid);
    const total = await Thank.getTotal(memberid);
    if (!total) total = 0; //handles null values of total
    res.render("checkout/thank", {
      title: "SuperStore",
      thank: thank,
      memberid:memberid,
      order: order,
      payment: payment,
      total: total
    });
  });