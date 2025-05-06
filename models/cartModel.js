const db = require("./db");

class Cart {
  static async findAll(memberId) {
    const query = "select product, product_quantity from view_bag where member_id = ?";
    const [result] = await db.query(query, [memberId]);
    return result;
  }
//  const query = "CALL new_member_user (INSERT INTO member (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";

static async addToCart(memberId, productId, quantity) {
  const query = "CALL add_to_bag(?, ?, ?)";
  const [result] = await db.query(query, [memberId, productId, quantity]);
  console.log(result);
  return result;
}

}

module.exports = Cart;