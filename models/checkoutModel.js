const db = require("./db");

class Checkout {
  static async findAll(memberId) {
    const query = "select product, product_quantity, price from checkout where member_id = ?";
    const [result] = await db.query(query, memberId)
    return result;
  }
//  const query = "CALL new_member_user (INSERT INTO member (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";

}

module.exports = Checkout;