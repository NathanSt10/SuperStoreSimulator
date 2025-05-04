const db = require("./db");

class Cart {
  static async findAll() {
    const [rows] = await db.query("select product, product_quantity from view_bag where member_id = 1");
    return rows;
  }
//  const query = "CALL new_member_user (INSERT INTO member (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";

  static async addToCart() {
    const query = "INSERT INTO members (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";
    const [result] = await db.query(query, [first_name, last_name, email, phone_number, membership_tier]);
    console.log(result);
    return result.insertId;
  }

}

module.exports = Cart;