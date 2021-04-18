const express = require("express");
// Import db connection
const db = require("../db");
// create a Router
const router = express.Router();
// import bcrypt pour saler le mot de passe
const bcrypt = require("bcrypt");
// import la fonction jwtGenerator pour créer un token de session utilisateur
const jwtGenerator = require("../utils/jwtGenerator");
//import des middlewares d'authorisation
const validForm = require("../middlewares/validForm");
const userAuth = require("../middlewares/userAuth");

// REGISTER a User
router.post("/inscription", validForm, async (req, res) => {
  try {
    // On destructure req.body pour en faire des variables plus simple à écrire
    const {
      email,
      mdp,
      nom,
      prenom,
      tel,
      adresse,
      pays,
      situation,
      handicap,
    } = req.body;

    //Puis on vérifie si l'utilisateur existe déjà
    const user = await db.query(
      "SELECT * FROM utilisateur WHERE emailUser=$1",
      [email]
    );

    if (user.rows.length !== 0) {
      return res.status(401).send("Utilisateur déjà existant");
    } else {
      //Si c'est un nouvel utilisateur valide, on sale son mot de passe
      const salt = await bcrypt.genSalt(10);
      const saltMdp = await bcrypt.hash(mdp, salt);

      //On peut maintenant enregistrer le nouvel utilisateur avec un mot de passe salé
      const result = await db.query(
        `INSERT INTO utilisateur (
        emailUser,
        mdpUser, 
        nomUser,
        prenomUser,
        telUser,
        adresseUser,
        paysUser, 
        situationUser,
        handicapUser,
        isAdmin,
        isSuperAdmin,
        isModerateur) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, false, false, false) RETURNING *`,
        [email, saltMdp, nom, prenom, tel, adresse, pays, situation, handicap]
      );

      return res.json({ user: result.rows[0].emailuser });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

// LOGIN a User

router.post("/connexion", validForm, async (req, res) => {
  // On destructure req.body pour en faire des variables plus simple à écrire
  const { email, mdp } = req.body;

  try {
    //Puis on vérifie si l'utilisateur existe bien
    const user = await db.query(
      "SELECT * FROM utilisateur WHERE emailUser = $1",
      [email]
    );

    if (user.rows.length === 0) {
      return res.status(401).json("Informations invalides");
    }
    //si oui, on compare le mot de passe entré avec le mot de passe salé dans la bdd
    bcrypt.compare(mdp, user.rows[0].mdpuser, (err, same) => {
    if (same) {
      //si tout est bon on lui génère un token de connexion et on l'envoie côté client
      const jwtToken = jwtGenerator(
        user.rows[0].iduser,
        user.rows[0].isadmin,
        user.rows[0].issuperadmin,
        user.rows[0].ismoderateur
      );
      return res.json({ jwtToken,  });
    } else {
      return res.status(401).json("Informations invalides");
    }
    });
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// GET ALL Users
router.get("/", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM utilisateur");
    res.status(200).json({
      status: "success",
      utilisateurs: result.rows,
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET ONE User BY ID
router.get("/:id", async (req, res) => {
  try {
    const result = await db.query(
      `SELECT * FROM utilisateur WHERE idUser = '${req.params.id}'`
    );
    res.status(200).json({
      status: "success",
      utilisateur: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// UPDATE a User
router.put("/update/:id", userAuth, async (req, res) => {
  try {
    if (req.idUser === req.params.id || req.isAdmin || req.isSuperAdmin) {
      const {
        email,
        //mdp,
        nom,
        prenom,
        tel,
        adresse,
        pays,
        situation,
        //handicap,
      } = req.body;
      const result = await db.query(
        `UPDATE utilisateur SET
            emailUser = $1 nomUser = $2, prenomUser = $3, telUser = $4,
            adresseUser = $5, paysUser = $6, situationUser = $7 WHERE idUser = $8 RETURNING *`,
        [
          email,
          //mdp,
          nom,
          prenom,
          tel,
          adresse,
          pays,
          situation,
          //handicap,
          req.params.id,
        ]
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

//DELETE a user
router.delete("/delete/:id", userAuth, async (req, res) => {
  try {
    if (req.idUser === req.params.id || req.isAdmin || req.isSuperAdmin) {
      const result = await db.query(
        `DELETE FROM utilisateur WHERE idUser = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        result: result.rows,
        message: "Utilisateur supprimé",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

//Admin Fonctions
router.put("/newModo/:id", userAuth, async (req, res) => {
  try {
    if (req.isAdmin || req.isSuperAdmin) {
      const result = await db.query(
        `UPDATE utilisateur SET isModerateur=true, isSuperAdmin=false, isAdmin=false WHERE idUser = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        user: result.rows[0],
        message: "Nouveau Moderateur créé",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

router.put("/noModo/:id", userAuth, async (req, res) => {
  try {
    if (req.isAdmin || req.isSuperAdmin) {
      const result = await db.query(
        `UPDATE utilisateur SET isModerateur=false WHERE idUser = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        user: result.rows[0],
        message: "Cet utilisateur n'est plus Moderateur",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

//SuperAdmin Fonctions
router.put("/newAdmin/:id", userAuth, async (req, res) => {
  try {
    if (req.isSuperAdmin) {
      const result = await db.query(
        `UPDATE utilisateur SET isAdmin=true, isSuperAdmin=false, isModerateur=false WHERE idUser = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        user: result.rows[0],
        message: "Nouvel Admin créé",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

router.put("/noAdmin/:id", userAuth, async (req, res) => {
  try {
    if (req.isSuperAdmin) {
      const result = await db.query(
        `UPDATE utilisateur SET isAdmin=false WHERE idUser = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        user: result.rows[0],
        message: "Cet utilisateur n'est plus Admin",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

router.put("/newSuperAdmin/:id", userAuth, async (req, res) => {
  try {
    if (req.isSuperAdmin) {
      const result = await db.query(
        `UPDATE utilisateur SET isSuperAdmin=true, isAdmin=false, isModerateur=false WHERE idUser = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        user: result.rows[0],
        message: "Nouveau Super Admin créé",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

router.put("/noSuperAdmin/:id", userAuth, async (req, res) => {
  try {
    if (req.isSuperAdmin) {
      const result = await db.query(
        `UPDATE utilisateur SET isSuperAdmin=false WHERE idUser = '${req.params.id}'`
      );
      res.status(200).json({
        status: "success",
        user: result.rows[0],
        message: "Cet utilisateur n'est plus Super Admin",
      });
    } else {
      res.status(401).json({ message: "Non Autorisé" });
    }
  } catch (err) {
    res.status(500).json({ err });
  }
});

// GET ONE User BY EMAIL
router.get("/getId/:email", async (req, res) => {
  try {
    const { email } = req.params;

    const result = await db.query(
        `SELECT * FROM utilisateur WHERE emailUser = '${email}'`
    );
    res.status(200).json({
      status: "success",
      utilisateur: result.rows[0],
    });
  } catch (err) {
    res.status(500).json({ err });
  }
});

// export the Router
module.exports = router;
