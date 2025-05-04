const db = require("./db");

class Members {
  static async findAll() {
    const [rows] = await db.query("SELECT * FROM members");
    return rows;
  }
//  const query = "CALL new_member_user (INSERT INTO member (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";

  static async addMemberProcedure(first_name, last_name, email, phone_number, membership_tier) {
    const query = "INSERT INTO members (first_name, last_name, email, phone_number, membership) VALUES (?, ?, ?, ?, ?)";
    const [result] = await db.query(query, [first_name, last_name, email, phone_number, membership_tier]);
    console.log(result);
    return result.insertId;
  }

  static async updateMember(id, email, phone_number) {
    const query = "UPDATE members SET email = ?, phone_number = ? WHERE id = ?";
    const [result] = await db.query(query, [email, phone_number, id]);
    return result.insertId;
  }

  static async deleteMember(id) {
    const query = "DELETE from `members` WHERE id = ?";
    const [result] = await db.query(query, [id]);
    return result.insertId;
  }

  static async getMember(id) {
    const query = "SELECT email, phone_number FROM members WHERE id = ?";
    const [result] = await db.query(query, [id]);
    return [result];
  }
}

module.exports = Members;