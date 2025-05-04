const db = require("./db");

class Checkout {
  static async findAll() {
    const [rows] = await db.query("select product, product_quantity, price from checkout where member_id = 1");
    return rows;
  }
//  const query = "CALL new_member_user (INSERT INTO member (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";

}

module.exports = Checkout;