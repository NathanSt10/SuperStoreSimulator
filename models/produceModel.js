const db = require("./db");

class Produce {
  static async findAll() {
    const [rows] = await db.query("select `name`, price, quantity, brand, category from aisle_view where department = 1");
    return rows;
  }
//  const query = "CALL new_member_user (INSERT INTO member (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";

static async addToCart(memberId, productId, quantity) {
  const query = "CALL add_to_bag(?, ?, ?)";
  const [result] = await db.query(query, [memberId, productId, quantity]);
  console.log(result);
  return result;
}

}

module.exports = Produce;