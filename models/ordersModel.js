const db = require("./db");

class Orders {
  static async getOrders(memberId) {
    const [rows] = await db.execute(
      `SELECT member_order_number, cost FROM view_orders WHERE member_id = ?`,
      [memberId]
    );
    return rows;
  }

  static async getOrderDetail(memberId, orderNumber) {
    const [rows] = await db.execute(
      `SELECT member_order_number, product, quantity, price FROM view_orderdetail WHERE member_id = ? AND member_order_number = ?`,
      [memberId, orderNumber]
    );
    return rows;
  }
}

module.exports = Orders;
