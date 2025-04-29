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
    let { first_name, last_name } = req.body;
    const [[member]] = await Member.getMember(id);
    console.log("member: ", member)
    // console.log("Last", member[1])
    if(first_name == "") {
        first_name = member.first_name
    }
    if(last_name == "") {
        last_name = member.last_name
    }
    await Member.updateMember(id, first_name, last_name);
    const members = await Member.findAll();
    res.redirect("/office");
  });
