const db = require("./db");

class Thank {
  static async findAll(memberId) {
    const query = "SELECT product, price, quantity FROM view_orderdetail WHERE member_id = ? ORDER BY member_order_number DESC";
    const [result] = await db.query(query, [memberId]);
    return result;
  }
}

module.exports = Thank;