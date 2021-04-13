module.exports = function (req, res, next) {
  const { email, nom, prenom, mdp } = req.body;

  function validEmail(userEmail) {
    return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(userEmail);
  }

  // function validMdp(userMdp) {
  //   return / (?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/.test(
  //     userMdp
  //    );
  // }

  if (req.path === "/inscription") {
    console.log(!email.length);
    if (![email, nom, prenom, mdp].every(Boolean)) {
      return res
        .status(401)
        .json("Des champs obligatoires ne sont pas remplis");
    } else if (!validEmail(email)) {
      return res.status(401).json("Email invalide");
      //   } else if (!validMdp(mdp)) {
      //     return res
      //       .status(401)
      //       .json(
      //         "Le mot de passe doit : contenir au moins 8 caractères, avoir au moins 1 majuscule, 1 minuscule, 1 nombre et 1 caractère spécial "
      //       );
    }
  } else if (req.path === "/connexion") {
    if (![email, mdp].every(Boolean)) {
      return res
        .status(401)
        .json("Des champs obligatoires ne sont pas remplis");
    } else if (!validEmail(email)) {
      return res.status(401).json("Email invalide");
    }
  }

  next();
};
