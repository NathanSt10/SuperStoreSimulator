const asyncHandler = require("express-async-handler");
const Produce = require("../../models/produceModel");

exports.entranceGet = asyncHandler(async (req, res) => {
    const produce = await Produce.findAll();
    res.render("entrance", {
      title: "SuperStore",
      produce: produce
    });
  });