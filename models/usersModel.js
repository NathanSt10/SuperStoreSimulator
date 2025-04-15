const db = require("./db");

class Users {
  static async findAll() {
    const [rows] = await db.query("SELECT * FROM users");
    return rows;
  }
}

module.exports = Users;
