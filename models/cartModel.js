const db = require("./db");

class Cart {
  static async findAll(memberId) {
    const query = "select product, product_quantity from view_bag where member_id = ?";
    const [result] = await db.query(query, [memberId]);
    return result;
  }

  static async findProduct(productName) {
    const [results] = await db.query(
      'SELECT id FROM aisle_view where `name` = ?',
      [productName]
    );
    return [results];
  }

  static async addToCart(memberId, productId, quantity) {
    await db.query('CALL add_to_bag(?, ?, ?)', [memberId, productId, quantity]);
  }

  static async removeFromCart(memberId, productId){
    const query = "delete from bagcontents where member_id = ? and product_id = ?"
    const [results] = await db.query(query, [memberId, productid]);
  }

}

module.exports = Cart;