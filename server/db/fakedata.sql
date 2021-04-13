INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser, isAdmin, isSuperAdmin, isModerateur) VALUES
('poiriertheoo@gmail.com', '0550002D', 'POIRIER', 'Théo', '0786849087', '73 rue Isabey', 'France', '', false, true, false, false);

INSERT INTO utilisateur (emailUser, mdpUser, nomUser, prenomUser, telUser, adresseUser, paysUser, situationUser, handicapUser, isAdmin, isSuperAdmin, isModerateur) VALUES
('kirutxn@gmail.com', 'kirtuxn', 'TXN', 'KIRU', '0666666666', '667 rue de la Secte', 'France', '', false, false, true, false);

/* insertion des types de relation --------------------------------- */
INSERT INTO type_relation (libelleTypRel) VALUES('Soi');
INSERT INTO type_relation (libelleTypRel) VALUES('Conjoint');
INSERT INTO type_relation (libelleTypRel) VALUES('Famille');
INSERT INTO type_relation (libelleTypRel) VALUES('Ami');
INSERT INTO type_relation (libelleTypRel) VALUES('Inconnu');
INSERT INTO type_relation (libelleTypRel) VALUES('Collegue');

/* insertion des relations  ---------------------------------------- */
INSERT INTO relation (idUser1,idUser2,idTypRel) 
VALUES (( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='kirutxn@gmail.com'),
        ( SELECT idUser 
        FROM utilisateur 
        WHERE emailUser='poiriertheoo@gmail.com'),
        ( SELECT idTypRel
        FROM type_relation
        WHERE libelleTypRel='Collegue'));

