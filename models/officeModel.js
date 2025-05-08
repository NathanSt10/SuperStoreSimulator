const db = require("./db");

class Products{
    static async restock(quantity){
        const query = "call restock_product(?)";
        const [result] = await db.query(query, [quantity]);
        return result;
    }
}

module.exports = Products;