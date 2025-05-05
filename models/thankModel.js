const db = require("./db");

class Thank {
  static async findAll() {
    const [rows] = await db.query("select price from orderdetails where id = 1");
    return rows;
  }
}

module.exports = Thank;