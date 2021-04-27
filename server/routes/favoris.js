const express = require("express");

// Import db connection
const db = require("../db");

// create a Router
const router = express.Router();

//import des middlewares d'authorisation
const userAuth = require("../middlewares/userAuth");

// ROUTES Favoris

//GET ALL favori
router.get("/", async (req, res) => {
  try {
    const result = await db.query(
        "SELECT * FROM favori"
    );
    res.status(200).json({
      status: "success",
      favoris: result.rows,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

//GET favori FROM user
router.get("/user/:id", async (req, res) => {
  try {
    const result = await db.query(
        `SELECT * FROM favori WHERE idUser = '${req.params.id}'`
    );
    res.status(200).json({
      status: "success",
      favoris: result.rows,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

//POST favori
router.post("/:id", userAuth, async (req, res) => {
  try {
    const result = await db.query(
      `INSERT INTO favori (idRessource,idUser) VALUES ($1,$2) RETURNING *`,
      [req.body.id, req.idUser]
    );
    res.status(201).json({
      status: "success",
      favori: result,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

//COUNT favori
/*router.get("fav/:id", userAuth, async (req, res) => {
  try {
    const result = await db.query(
      `COUNT * FROM favori WHERE idRessource='${req.body.id}'`
    );
  } catch (err) {
    res.status(500).json({ err });
  }
});*/

//DELETE favori
router.delete("/:id", userAuth, async (req, res) => {
  try {
    const result = await db.query(
      `DELETE FROM Favori WHERE idUser=$1 AND idRessource=$2`,
      [req.idUser, req.params.id]
    );
    res.status(204).json({
      status: "success",
      message: "Favori Supprimé",
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

module.exports = router;
