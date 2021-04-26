const express = require("express");

// Import db connection
const db = require("../db");

// create a Router
const router = express.Router();

//import des middlewares d'authorisation
const userAuth = require("../middlewares/userAuth");

//GET ALL VERIFIED Ressources
router.get("/Verified", async (req, res) => {
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
router.get("/NotVerified", userAuth, async (req, res) => {
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

router.post("/isVerified/:id", userAuth, async (req, res) => {
  try {
    if (req.isAdmin || req.isSuperAdmin || req.isModerateur) {
      const result = await db.query(
        `UPDATE ressource SET isVerified='true' WHERE idRessource='${req.body.id}' RETURNING *`
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
    const result = await db.query(
      `INSERT INTO ressource (titreRessource, illustrationRessource, messageRessource, dureeRessource, idAuteur, idTypRes, idCatRes, isVerified ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *`,
      [titre, illustration, message, duree, req.idUser, TypRes, CatRes, false]
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
  const { id } = req.body;
  try {
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

router.post("/comm/:id", userAuth, async (req, res) => {
  try {
    const { contenu, idUser } = req.body;

    const commentaire = await db.query(
      "INSERT INTO commentaire (contenuCommentaire, idUser, idRessource) VALUES ($1, $2, $3) RETURNING *",
      [contenu, idUser, req.params.id]
    );

    const ajoutCommRess = await db.query(
      `INSERT INTO ressource (commentaires) VALUES ($1) WHERE idRessource=$2 RETURNING *`,
      [commentaire.rows[0].idcommentaire, req.params.id]
    );

    res.status(200).json({
      commentaire: commentaire.rows[0],
      ressource: ajoutCommRess.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET ONE Ressource BY ID
router.get("/:id", async (req, res) => {
  try {
    const result = await db.query(
        `SELECT * FROM ressource WHERE idRessource = '${req.params.id}'`
    );
    res.status(200).json({
      status: "success",
      ressource: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// ROUTES Favoris

//POST favori
router.post("/fav/:id", userAuth, async (req, res) => {
  try {
    const result = await db.query(
      `INSERT INTO favori (idRessource,idUser) VALUES ($1,$2) RETURNING *`,
      [req.idUser, req.body.id]
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
router.get("fav/:id", userAuth, async (req, res) => {
  try {
    const result = await db.query(
      `COUNT * FROM favori WHERE idRessource='${req.body.id}'`
    );
  } catch (err) {
    res.status(500).json({ err });
  }
});

//DELETE favori
router.delete("fav/:id", userAuth, async (req, res) => {
  try {
    const result = await db.query(
      `DELETE FROM Favori WHERE idUser=$1 AND idRessource=$2`,
      [req.idUser, req.body.id]
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
