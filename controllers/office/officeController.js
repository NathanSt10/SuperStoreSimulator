const asyncHandler = require("express-async-handler");
const Member = require("../../models/membersModel");

exports.officeWelcomeGet = asyncHandler(async (req, res) => {
    const members = await Member.findAll();
    res.render("office", {
      title: "SuperStore",
      members: members
    });
  });

// Update a member
//.put('/members/:id', (req, res) => {
exports.officeUpdate = asyncHandler(async (req, res) => {
    const { id } = req.params;
    const { first_name, last_name } = req.body;
    const { old_first_name, old_last_name} = Member.getMember(id);
    if(first_name == null) {
        first_name = old_first_name
    }
    if(last_name == null) {
        last_name = old_last_name
    }
    Member.updateMember(id, first_name, last_name);
    const members = await Member.findAll();
    res.redirect("office", {
        title: "SuperStore",
        members: members
      });
  });
