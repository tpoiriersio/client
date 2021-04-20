const express = require("express");

// Import db connection
const db = require("../db");

// create a Router
const router = express.Router();

//import des middlewares d'authorisation
const userAuth = require("../middlewares/userAuth");

// GET ALL Relations Types
router.get("/", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM type_relation");
    res.status(200).json({
      status: "success",
      relationTypes: result.rows,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET ONE Relation Type BY ID
router.get("/:id", async (req, res) => {
  try {
    const result = await db.query(
      `SELECT * FROM type_relation WHERE idTypRel = '${req.params.id}'`
    );
    res.status(200).json({
      status: "success",
      relationType: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// POST a Relation Type
router.post("/", async (req, res) => {
  try {
    const result = await db.query(
      `INSERT INTO type_relation (libelleTypRel) VALUES ($1) RETURNING *`,
      [req.body.name]
    );

    res.status(201).json({
      status: "success",
      relationType: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// UPDATE a Relation Type BY ID
router.put("/:id", async (req, res) => {
  try {
    const result = await db.query(
      `UPDATE type_relation SET libelleTypRel= $1 WHERE idTypRel= $2`,
      [req.body.name, req.params.id]
    );
    res.status(200).json({
      status: "success",
      relationType: result.rows[0],
    });
  } catch (err) {
    console.log(err);
    res.status(500).json({ err });
  }
});

//DELETE a Relation Type BY ID
router.delete("/:id", async (req, res) => {
  try {
    const result = await db.query(
      `DELETE FROM type_relation WHERE idTypRel = '${req.params.id}'`
    );
    res.status(200).json({
      status: "success",
      relationType: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// export the Router
module.exports = router;
