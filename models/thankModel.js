const db = require("./db");

class Thank {
  static async findAll() {
    const [rows] = await db.query(`
  SELECT product, price, quantity
  FROM view_orderdetail
  WHERE member_id = 1
  ORDER BY member_order_number DESC
  LIMIT 1
`);
    return rows;
  }
}

module.exports = Thank;