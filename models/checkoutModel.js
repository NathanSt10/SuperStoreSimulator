const db = require("./db");

class Checkout {
  static async findAll(memberId) {
    const query = "select product, product_quantity, price from checkout where member_id = ?";
    const [result] = await db.query(query, memberId)
    return result;
  }

  static async isAdmin(memberId) {
    const query = "select admin_rights from users where member_id = ?";
    const [result] = await db.query(query, memberId);
    // console.log("isAdmin: ", result);
    return result;
  }
}

module.exports = Checkout;