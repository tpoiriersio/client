const express = require("express");

// Import db connection
const db = require("../db");

// create a Router
const router = express.Router();

//import des middlewares d'authorisation
const userAuth = require("../middlewares/userAuth");

// GET ALL Ressource Categories
router.get("/", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM categorie_ressource");
    res.status(200).json({
      status: "success",
      ressourceCategories: result.rows,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET ONE Ressource Category BY ID
router.get("/:id", async (req, res) => {
  try {
    const result = await db.query(
      `SELECT * FROM categorie_ressource WHERE idCatRes = '${req.params.id}'`
    );
    res.status(200).json({
      status: "success",
      ressourceCategory: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// POST a Ressource Category
router.post("/", userAuth, async (req, res) => {
  try {
    if (req.isAdmin || req.isSuperAdmin) {
      const result = await db.query(
        `INSERT INTO categorie_ressource (libelleCatRes) VALUES ($1) RETURNING *`,
        [req.body.name]
      );

      res.status(201).json({
        status: "success",
        ressourceCategory: result.rows[0],
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

// UPDATE a Ressource Category BY ID
router.put("/update/:id", userAuth, async (req, res) => {
  try {
    if (req.isAdmin || req.isSuperAdmin) {
      const result = await db.query(
        `UPDATE categorie_ressource SET libelleCatRes= $1 WHERE idCatRes= $2`,
        [req.body.name, req.params.id]
      );
      res.status(200).json({
        status: "success",
        ressourceCategory: result.rows[0],
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    console.log(err);
    res.status(500).json({ err });
  }
});

//DELETE a Ressource Category BY ID
router.delete("/delete/:id", userAuth, async (req, res) => {
  try {
    if (req.isAdmin || req.isSuperAdmin) {
      const result = await db.query(
        `DELETE FROM categorie_ressource WHERE idCatRes = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        ressourceCategory: result.rows[0],
        message: "Catégorie de ressource supprimée",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET ONE Ressource Type BY ID
router.get("/type/:id", async (req, res) => {
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
