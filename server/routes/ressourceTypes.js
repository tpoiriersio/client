const express = require("express");

// Import db connection
const db = require("../db");

// create a Router
const router = express.Router();

//import des middlewares d'authorisation
const userAuth = require("../middlewares/userAuth");

// GET ALL Ressource Types
router.get("/", async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM type_ressource');
    res.status(200).json({
      status: "success",
      ressourceType: result.rows,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET ONE Ressource Type BY ID
router.get("/:id", async (req, res) => {
  try {
    const result = await db.query(
        `SELECT * FROM type_ressource WHERE idTypRes = '${req.params.id}'`
    );
    res.status(200).json({
      status: "success",
      ressourceType: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

module.exports = router;
