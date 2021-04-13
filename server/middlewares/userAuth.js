const jwt = require("jsonwebtoken");
require("dotenv").config();

module.exports = (req, res, next) => {
  try {
    const jwtToken = req.header("jwtToken");

    if (!jwtToken) {
      return res.status(403).json("Non autorisé");
    }
    jwt.verify(jwtToken, process.env.JWTSECRET, (err, decodedToken) => {
      req.idUser = decodedToken.idUser;
      req.isAdmin = decodedToken.isAdmin;
      req.isSuperAdmin = decodedToken.isSuperAdmin;
      req.isModerateur = decodedToken.isModerateur;
      next();
    });
  } catch (err) {
    console.log({ err });
    return res.status(403).json("token invalide");
  }
};
