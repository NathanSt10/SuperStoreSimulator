const db = require("./db");

class Users {
  static async getUser(username) {
    const query = "SELECT password FROM users WHERE username = ?";
    const result = await db.query(query, [username]);
    return [result];
  }

  static async setPassword(memberID, password) {
    const query = "UPDATE users SET password = ? WHERE member_id = ?";
    const result = await db.query(query, [password, memberID]);
    return result;
  }
}

module.exports = Users;
