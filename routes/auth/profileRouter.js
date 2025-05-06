const { Router } = require("express");
const profileController = require("../../controllers/auth/profileController");
const Orders = require("../../models/ordersModel");


const profileRouter = Router();

profileRouter.get("/:id", profileController.getProfilePage);

profileRouter.get("/:id/orders/:orderNumber/details", async (req, res) => {
    const { id, orderNumber } = req.params;
    try {
        const details = await Orders.getOrderDetail(id, orderNumber);
        res.json(details);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: "Failed to fetch order details." });
    }
});


module.exports = profileRouter;