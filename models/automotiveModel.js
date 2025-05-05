const db = require("./db");

class Automotive {
  static async findAll() {
    const [rows] = await db.query("select `name`, price, quantity, brand, category from aisle_view where department = 12");
    return rows;
  }

  static async addToCart() {
    const query = "INSERT INTO members (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";
    const [result] = await db.query(query, [first_name, last_name, email, phone_number, membership_tier]);
    console.log(result);
    return result.insertId;
  }

}

module.exports = Automotive;