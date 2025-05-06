const db = require("./db");

class Thank {
  static async getMostRecent(memberId) {
    const query = `select product, quantity, price from super_store_sim_db.view_orderdetail where member_id = ?
and member_order_number = (select max(member_order_number) from view_orderdetail where member_id = ?)`;
    const [result] = await db.query(query, [memberId, memberId]);
    return result;
  }

  static async createOrder(memberId){
    const query = "call bag_to_order(?)";
    const [result] = await db.query(query, [memberId]);
    return result;
  }

  static async createPayment(memberId, payType){
    const query = "call create_payment(?,?)";
    const [result] = await db.query(query, [memberId, payType]);
    return result;
  }

}

module.exports = Thank;