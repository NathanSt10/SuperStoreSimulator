const db = require("./db");

class Deli {
  static async findAll() {
    const [rows] = await db.query("select `name`, price, quantity, brand, category from aisle_view where department = 10");
    return rows;
  }

  static async addToCart(memberId, productId, quantity) {
    const query = "CALL add_to_bag(?, ?, ?)";
    const [result] = await db.query(query, [memberId, productId, quantity]);
    console.log(result);
    return result;
  }

}

module.exports = Deli;