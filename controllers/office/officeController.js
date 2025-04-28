const asyncHandler = require("express-async-handler");
const Member = require("../../models/membersModel");

exports.officeWelcomeGet = asyncHandler(async (req, res) => {
    const members = await Member.findAll();
    res.render("office", {
      title: "SuperStore",
      members: members
    });
  });