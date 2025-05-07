const asyncHandler = require("express-async-handler");
const Thank = require("../../models/thankModel");

exports.thankGet = asyncHandler(async (req, res) => {
    const memberid = req.params.id;
    const anything = await Thank.createOrder(memberid);
    const thank = await Thank.getMostRecent(memberid);
    res.render("checkout/thank", {
      title: "SuperStore",
      thank: thank,
      memberid:memberid,
      anything: anything
    });
  });