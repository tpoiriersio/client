/* Création de la base de données -------------------------------------------------------------- */
CREATE DATABASE resrel;

/* Ligne de commande à rentrer dans psql pour accéder à la base nouvellement créée -------------- */
\c resrel

/* On importe l'extension uuid pour générer des id complexes pour utilisateur et ressource ------ */
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

/* Tables ressource, type_ressource et categorie_ressource  ------------------------------------ */


CREATE TABLE type_ressource (
    idTypRes INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    libelleTypRes varchar(255) NOT NULL
);

CREATE TABLE categorie_ressource (
  idCatRes INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  libelleCatRes varchar(255) NOT NULL
);

CREATE TABLE ressource (
    idRessource uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    titreRessource varchar(255) NOT NULL,
    illustrationRessource varchar(255),
    messageRessource text NOT NULL,
    dureeRessource int NOT NULL,
    nbFavRessource int DEFAULT 0,
    commentaires uuid [],
    isVerified boolean,
    idAuteur uuid REFERENCES utilisateur (idUser),
    idTypRes int REFERENCES  type_ressource (idTypRes),
    idCatRes int REFERENCES categorie_ressource (idCatRes)
);

/* Tables utilisateur, admin, superardmin, et moderateur  ------------------------------------- */

CREATE TABLE utilisateur (
    idUser uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    emailUser varchar(255) UNIQUE NOT NULL,
    mdpUser varchar(100) NOT NULL,
    nomUser varchar(100) NOT NULL,
    prenomUser varchar(10) NOT NULL,
    telUser varchar(20),
    adresseUser varchar(255),
    paysUser varchar(100) NOT NULL,
    situationUser varchar(100),
    handicapUser boolean,
    isAdmin boolean,
    isSuperAdmin boolean,
    isModerateur boolean
);

/* Tables relation, type_relation et relation_ressource --------------------------------------- */


CREATE TABLE type_relation (
  idTypRel INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  libelleTypRel varchar(255) NOT NULL
);

CREATE TABLE relation (
  idRelation uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  idUser1 uuid REFERENCES utilisateur (idUser) NOT NULL,
  idUser2 uuid REFERENCES utilisateur (idUser) NOT NULL,
  idTypRel INT REFERENCES type_relation (idTypRel) NOT NULL
);

CREATE TABLE ressource_en_cours (
  idRessource uuid REFERENCES ressource (idRessource) ,
  idRelation uuid REFERENCES relation (idRelation) ,
  idLeader uuid REFERENCES utilisateur (idUser),
  idParticipants uuid [],
  dateDebutParticipation DATE DEFAULT CURRENT_DATE,
  dateFinParticipation DATE,
  isExploite boolean,
  commentaires uuid [],
  PRIMARY KEY (idRessource, idRelation, idLeader)
);

/* Tables commentaire et favori ---------------------------------------------------------------- */

CREATE TABLE commentaire (
    idCommentaire uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    contenuCommentaire text NOT NULL,
    dateCommentaire date DEFAULT CURRENT_TIMESTAMP,
    idUser uuid REFERENCES utilisateur (idUser) NOT NULL,
    idRessource uuid REFERENCES ressource (idRessource) NOT NULL
);

CREATE TABLE favori (
  idRessource uuid REFERENCES ressource (idRessource),
  idUser uuid REFERENCES utilisateur (idUser),
  PRIMARY KEY ( idRessource, idUser )
);

/* Ligne de commande pour vérifier que toutes les tables ont été ajoutées  ------------------- */
\dt


