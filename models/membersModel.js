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
}

module.exports = Members;