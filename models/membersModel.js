const db = require("./db");

class Members {
  static async findAll() {
    const [rows] = await db.query("SELECT * FROM member");
    return rows;
  }
//  const query = "CALL new_member_user (INSERT INTO member (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";

  static async addMemberProcedure(first_name, last_name, email, phone_number, membership_tier, username, password) {
    const query = "CALL new_member_user (?, ?, ?, ?, ?, ?, ?)";
    const [result] = await db.query(query, [first_name, last_name, email, phone_number, membership_tier, username, password]);
    console.log(result);
    return result.insertId;
  }

  static async updateMember(id, first_name, last_name) {
    const query = "UPDATE member SET first_name = ?, last_name = ? WHERE id = ?";
    const [result] = await db.query(query, [first_name, last_name, id]);
    return result.insertId;
  }

  static async getMember(id) {
    const query = "SELECT first_name, last_name FROM member WHERE id = ?";
    const [result] = await db.query(query, [id]);
    console.log("result: ", result);
    return [result];
  }

}

module.exports = Members;