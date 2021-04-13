const jwt = require("jsonwebtoken");
require("dotenv").config();

function jwtGenereator(idUser, isAdmin, isSuperAdmin, isModerateur) {
  const payload = {
    idUser: idUser,
    isAdmin: isAdmin,
    isSuperAdmin: isSuperAdmin,
    isModerateur: isModerateur,
  };

  return jwt.sign(payload, process.env.JWTSECRET, { expiresIn: "3h" });
}

module.exports = jwtGenereator;
