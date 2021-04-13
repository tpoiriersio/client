const express = require("express");

// Import db connection
const db = require("../db");

// create a Router
const router = express.Router();

//import des middlewares d'authorisation
const userAuth = require("../middlewares/userAuth");

//GET ALL VERIFIED Ressources
router.get("/isVerified", async (req, res) => {
  try {
    const result = await db.query(
      "SELECT * FROM ressource WHERE isVerified=true"
    );
    res.status(200).json({
      status: "success",
      ressources: result.rows,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

//GET ALL NON VERIFIED Ressources
router.get("/isNotVerified", userAuth, async (req, res) => {
  try {
    if (req.isAdmin || req.isSuperAdmin || req.isModerateur) {
      const result = await db.query(
        "SELECT * FROM ressource WHERE isVerified=false"
      );
      res.status(200).json({
        status: "success",
        ressources: result.rows,
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

// POST Ressource
router.post("/create", userAuth, async (req, res) => {
  const { titre, illustration, message, duree, TypRes, CatRes } = req.body;
  try {
    const idTypRes = await db.query(
      `SELECT idTypRes FROM type_ressource WHERE libelleTypRes=$1`,
      [TypRes]
    );
    const idCatRes = await db.query(
      `SELECT idCatRes FROM categorie_ressource WHERE idCatRes=$1`,
      [CatRes]
    );
    const result = await db.query(
      `INSERT INTO ressource (titreRessource, illustrationRessource, messageRessource, dureeRessource, idAuteur, idTypRes, idCatRes ) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`,
      [titre, illustration, message, duree, req.idUser, idTypRes, idCatRes]
    );

    res.status(200).json({
      status: "success",
      ressource: result.rows[0],
    });
  } catch (err) {
    console.log(err);
    res.status(500).json({ err });
  }
});

//UPDATE A Ressource
router.put("/update", userAuth, async (req, res) => {
  const { id, titre, illustration, message, duree, TypRes, CatRes } = req.body;
  try {
    const idTypRes = await db.query(
      `SELECT idTypRes FROM type_ressource WHERE libelleTypRes=$1`,
      [TypRes]
    );
    const idCatRes = await db.query(
      `SELECT idCatRes FROM categorie_ressource WHERE idCatRes=$1`,
      [CatRes]
    );

    const ressource = await db.query(
      `SELECT * from ressource where idRessource=$1`,
      [id]
    );

    if (
      req.idUser === ressource.rows[0].idauteur ||
      req.isAdmin ||
      req.isSuperAdmin ||
      req.isModerateur
    ) {
      const result = await db.query(
        `UPDATE ressource SET
            titreRessource = $1, illustrationRessource = $2, messageRessource = $3, dureeRessource = $4, idTypRes = $5,
            idCatRes = $6, isVerified = false RETURNING *`,
        [titre, illustration, message, duree, idTypRes, idCatRes]
      );

      res.status(200).json({
        status: "success",
        utilisateur: result.rows[0],
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    console.log(err);
    res.status(500).json({ err });
  }
});

//DELETE Ressource
router.delete("/delete/:id", userAuth, async (req, res) => {
  try {
    if (
      req.idUser === ressource.rows[0].idauteur ||
      req.isAdmin ||
      req.isSuperAdmin ||
      req.isModerateur
    ) {
      const result = await db.query(
        `DELETE FROM ressource WHERE idRessource = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        message: "Ressource supprimée",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

module.exports = router;
