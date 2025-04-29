const db = require("./db");

class Users {
  static async getUser(username) {
    const query = "SELECT password FROM user WHERE username = ?";
    const result = await db.query(query, [username]);
    console.log("result: ", result);
    return [result];
  }
}

module.exports = Users;
