const express = require("express");

// Import db connection
const db = require("../db");

// create a Router
const router = express.Router();

//import des middlewares d'authorisation
const userAuth = require("../middlewares/userAuth");

// GET ALL Relations from ONE USER
router.get("/:id", async (req, res) => {
  try {
    const { id } = req.params;

    // On récupère toutes les lignes où il y a une occurence de l'id du User en question
    const result = await db.query(
      `SELECT idUser,prenomUser,nomUser,libelleTypRel FROM utilisateur,relation,type_relation 
      WHERE (utilisateur.idUser = relation.idUser1 OR utilisateur.idUser = relation.idUser2) 
      AND (type_relation.idTypRel = relation.idTypRel)
      AND (idUser1=$1 OR idUser2=$1)
      ORDER BY libelleTypRel`,
      [id]
    );

    const relations = result.rows.filter((relation) => id != relation.iduser);
    res.status(200).json({
      relations: relations,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET Conjoint from ONE USER
router.get("/conjoint/:id", async (req, res) => {
  try {
    const { id } = req.params;

    // On récupère toutes les lignes où il y a une occurence de l'id du User en question
    const result = await db.query(
      `SELECT idUser,prenomUser,nomUser,libelleTypRel FROM utilisateur,relation,type_relation 
      WHERE (utilisateur.idUser = relation.idUser1 OR utilisateur.idUser = relation.idUser2) 
      AND (type_relation.idTypRel = relation.idTypRel)
      AND (idUser1=$1 OR idUser2=$1)
      AND libelleTypRel = 'Conjoint'
      ORDER BY libelleTypRel`,
      [id]
    );

    const relations = result.rows.filter((relation) => id != relation.iduser);
    res.status(200).json({
      relations: relations,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET Famille from ONE USER
router.get("/famille/:id", async (req, res) => {
  try {
    const { id } = req.params;

    // On récupère toutes les lignes où il y a une occurence de l'id du User en question
    const result = await db.query(
      `SELECT idUser,prenomUser,nomUser,libelleTypRel FROM utilisateur,relation,type_relation 
      WHERE (utilisateur.idUser = relation.idUser1 OR utilisateur.idUser = relation.idUser2) 
      AND (type_relation.idTypRel = relation.idTypRel)
      AND (idUser1=$1 OR idUser2=$1)
      AND libelleTypRel = 'Famille'
      ORDER BY libelleTypRel`,
      [id]
    );

    const relations = result.rows.filter((relation) => id != relation.iduser);
    res.status(200).json({
      relations: relations,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET Ami from ONE USER
router.get("/Ami/:id", async (req, res) => {
  try {
    const { id } = req.params;

    // On récupère toutes les lignes où il y a une occurence de l'id du User en question
    const result = await db.query(
      `SELECT idUser,prenomUser,nomUser,libelleTypRel FROM utilisateur,relation,type_relation 
      WHERE (utilisateur.idUser = relation.idUser1 OR utilisateur.idUser = relation.idUser2) 
      AND (type_relation.idTypRel = relation.idTypRel)
      AND (idUser1=$1 OR idUser2=$1)
      AND libelleTypRel = 'Ami'
      ORDER BY libelleTypRel`,
      [id]
    );

    const relations = result.rows.filter((relation) => id != relation.iduser);
    res.status(200).json({
      relations: relations,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET Collegue from ONE USER
router.get("/Collegue/:id", async (req, res) => {
  try {
    const { id } = req.params;

    // On récupère toutes les lignes où il y a une occurence de l'id du User en question
    const result = await db.query(
      `SELECT idUser,prenomUser,nomUser,libelleTypRel FROM utilisateur,relation,type_relation 
      WHERE (utilisateur.idUser = relation.idUser1 OR utilisateur.idUser = relation.idUser2) 
      AND (type_relation.idTypRel = relation.idTypRel)
      AND (idUser1=$1 OR idUser2=$1)
      AND libelleTypRel = 'Collegue'
      ORDER BY libelleTypRel`,
      [id]
    );

    const relations = result.rows.filter((relation) => id != relation.iduser);
    res.status(200).json({
      relations: relations,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

//POST Relation from USER
router.post("/create", userAuth, async (req, res) => {
  try {
    if (req.idUser) {
      const result = await db.query(
          `INSERT INTO relation (idUser1, idUser2, idTypRel) VALUES ($1, $2, $3) RETURNING *`,
          [req.idUser, req.body.idUser2, req.body.idTypRel]
      );
      res.status(200).json({
        status: "success",
        result: result.rows[0],
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

//DELETE Relation from USER
router.delete("/delete/:id1/:id2", userAuth, async (req, res) => {
  try {
    if (
      req.idUser === req.params.id1 ||
      req.idUser === req.params.id2 ||
      req.isAdmin ||
      req.isSuperAdmin
    ) {
      const result = await db.query(
        `DELETE FROM relation WHERE idUser1 = '${req.params.id1}' AND idUser2 = '${req.params.id2}' 
          OR idUser1 = '${req.params.id2}' AND idUser2 = '${req.params.id1}' `
      );
      res.status(200).json({
        status: "success",
        result: result.rows,
        message: "Relation supprimée",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

// export the Router
module.exports = router;
