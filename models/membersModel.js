const db = require("./db");

class Members {
  static async findAll() {
    const [rows] = await db.query("SELECT * FROM member");
    return rows;
  }

  static async addMember(first_name, last_name, email, phone_number, membership_tier) {
    const points = 350;
    const query = "INSERT INTO member (first_name, last_name, email, phone_number, membership, points) VALUES (?, ?, ?, ?, ?, ?)";
    const [result] = await db.query(query, [first_name, last_name, email, phone_number, membership_tier, points]);
    console.log(result);
    return result.insertId;
  }

  static async updateMember(id, first_name, last_name) {
    const query = "UPDATE member SET first_name = ?, last_name = ? WHERE id = ?";
    const [result] = await db.query(query, [first_name, last_name, id]);
    console.log(result);
    return result.insertId;
  }

  static async getMember(id) {
    const query = "SELECT first_name, last_name FROM member WHERE id = ?";
    const [result] = await db.query(query, [id]);
    console.log(result);
    return result.insertId;
  }

}

module.exports = Members;