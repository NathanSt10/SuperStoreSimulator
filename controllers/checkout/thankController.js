const asyncHandler = require("express-async-handler");
const Thank = require("../../models/thankModel");

exports.thankGet = asyncHandler(async (req, res) => {
    const thank = await Thank.findAll();
    res.render("checkout/thank", {
      title: "SuperStore",
      thank: thank
    });
  });