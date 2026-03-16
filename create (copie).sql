CREATE TABLE Zone (
        id_zone INT NOT NULL,
        type VARCHAR(50),
        CONSTRAINT ID_Zone_P PRIMARY KEY (id_zone)
);

CREATE TABLE Aliment (
        id_aliment INT NOT NULL,
        nom_aliment VARCHAR(50),
        quantite_stocke INT,
        CONSTRAINT ID_Aliment_P PRIMARY KEY (id_aliment)
);

CREATE TABLE Visiteur (
        id_visiteur INT NOT NULL,
        mdp_visiteur VARCHAR(50),
        nom_visiteur VARCHAR(50),
        prenom_visiteur VARCHAR(50),
        CONSTRAINT ID_Visiteur_P PRIMARY KEY (id_visiteur)
);

CREATE TABLE Prestataire (
        id_prestataire INT NOT NULL,
        debut_contrat DATE,
        fin_contrat DATE,
        CONSTRAINT ID_Prestataire_P PRIMARY KEY (id_prestataire)
);

CREATE TABLE Enclos (
        id_enclos INT NOT NULL,
        latitude DECIMAL(9,6),
        longitude DECIMAL(9,6),
        surface INT,
        spécificité VARCHAR(50),
        id_zone INT,
        CONSTRAINT ID_Enclos_P PRIMARY KEY (id_enclos),
        CONSTRAINT fait_partie_FK FOREIGN KEY (id_zone) REFERENCES Zone(id_zone)
);

CREATE TABLE Boutique (
        id_boutique INT NOT NULL,
        type_boutique VARCHAR(50),
        id_zone INT,
        CONSTRAINT ID_Boutique_P PRIMARY KEY (id_boutique),
        CONSTRAINT zone_FK FOREIGN KEY (id_zone) REFERENCES Zone(id_zone)
);

CREATE TABLE Gain (
        id_gain INT NOT NULL,
        date_gain DATE,
        chiffre_affaires INT,
        id_boutique INT,
        CONSTRAINT ID_Gain_P PRIMARY KEY (id_gain),
        CONSTRAINT boutique_FK FOREIGN KEY (id_boutique) REFERENCES Boutique(id_boutique)
);

CREATE TABLE Espece (
        id_espece INT NOT NULL,
        nom_latin VARCHAR(50),
        nom_usuel VARCHAR(50),
        est_menace NUMBER(1) CHECK (est_menace in (0,1)),
        id_zone INT,
        CONSTRAINT ID_Espece_P PRIMARY KEY (id_espece),
        CONSTRAINT appartient_FK FOREIGN KEY (id_zone) REFERENCES Zone(id_zone)
);

CREATE TABLE Réparation (
        id_reparation INT NOT NULL,
        cout_reparation INT,
        date_reparation DATE,
        nature_reparation VARCHAR(50),
        id_enclos INT,
        id_prestataire INT,
        CONSTRAINT ID_Reparation_P PRIMARY KEY (id_reparation),
        CONSTRAINT enclos_FK FOREIGN KEY (id_enclos) REFERENCES Enclos(id_enclos),
        CONSTRAINT prestataire_FK FOREIGN KEY (id_prestataire) REFERENCES Prestataire(id_prestataire)
);

CREATE TABLE Animal (
        id_animal INT NOT NULL,
        nom_animal VARCHAR(50),
        prenom_animal VARCHAR(50),
        date_de_naiss_animal DATE,
        poids INT,
        sexe CHAR(1) CHECK (sexe in ('M', 'F')),
        id_espece INT,
        pere INT,
        mere INT,
        id_enclos INT,
        CONSTRAINT ID_Animal_P PRIMARY KEY (id_animal),
        CONSTRAINT espece_FK FOREIGN KEY (id_espece) REFERENCES Espece(id_espece),
        CONSTRAINT pere_FK FOREIGN KEY (pere) REFERENCES Animal(id_animal),
        CONSTRAINT mere_FK FOREIGN KEY (mere) REFERENCES Animal(id_animal),
        CONSTRAINT habite_FK FOREIGN KEY (id_enclos) REFERENCES Enclos(id_enclos)
);

CREATE TABLE Personnel (
        id_personnel INT NOT NULL,
        mdp VARCHAR(255),
        nom_personnel VARCHAR(50),
        prenom_personnel VARCHAR(50),
        type_personnel_présent VARCHAR(50),
        id_boutique INT,
        remplacant_soingeur INT,
        a_comme_chef INT,
        id_zone INT,
        CONSTRAINT ID_Personnel_P PRIMARY KEY (id_personnel),
        CONSTRAINT boutique_personnel_FK FOREIGN KEY (id_boutique) REFERENCES Boutique(id_boutique),
        CONSTRAINT remplacant_soigneur_FK FOREIGN KEY (remplacant_soingeur) REFERENCES Personnel(id_personnel),
        CONSTRAINT chef_FK FOREIGN KEY (a_comme_chef) REFERENCES Personnel(id_personnel),
        CONSTRAINT zone_gerer_FK FOREIGN KEY (id_zone) REFERENCES Zone(id_zone)
);

CREATE TABLE Soin (
        id_soin INT NOT NULL,
        date_du_soin DATE,
        quantité INT,
        nature_soin VARCHAR(50),
        id_personnel INT,
        CONSTRAINT ID_Soin_P PRIMARY KEY (id_soin),
        CONSTRAINT soigneur_soin_FK FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel)
);

CREATE TABLE Nourriture (
        date_donner DATE NOT NULL,
        quantité INT,
        id_aliment INT,
		id_personnel INT,
		id_animal INT,
		CONSTRAINT soigneur_nourriture_FK FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel),
		CONSTRAINT animal_nourriture_FK FOREIGN KEY (id_animal) REFERENCES Animal(id_animal),
        CONSTRAINT date_donner_P PRIMARY KEY (date_donner, id_aliment,id_animal)
);




CREATE TABLE Contrat (
        id_contrat INT NOT NULL,
        date_debut_contrat DATE,
        date_fin_contrat DATE,
        salaire INT,
        Type_personnel VARCHAR(50),
        id_personnel INT,
        CONSTRAINT ID_Contrat_P PRIMARY KEY (id_contrat),
        CONSTRAINT personnel_FK FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel)
);


CREATE TABLE Remplacement (
        id_remplacement INT NOT NULL,
        date_debut_remplacement DATE,
        date_fin_remplacement DATE,
        id_remplace INT,
        id_remplacant INT,
        CONSTRAINT ID_Remplacement_P PRIMARY KEY (id_remplacement),
        CONSTRAINT remplace_FK FOREIGN KEY (id_remplace) REFERENCES Personnel(id_personnel),
        CONSTRAINT remplacant_FK FOREIGN KEY (id_remplacant) REFERENCES Personnel(id_personnel)
);

CREATE TABLE Parrainage (
        niveau CHAR(1),
        id_visiteur INT,
        id_animal INT,
        CONSTRAINT visiteur_FK FOREIGN KEY (id_visiteur) REFERENCES Visiteur(id_visiteur),
        CONSTRAINT animal_FK FOREIGN KEY (id_animal) REFERENCES Animal(id_animal),
        CONSTRAINT ID_parrainage_P PRIMARY KEY (id_visiteur, id_animal)
);

CREATE TABLE Recoit (
        id_soin INT,
        id_animal INT,
        CONSTRAINT soin_recoit_FK FOREIGN KEY (id_soin) REFERENCES Soin(id_soin),
        CONSTRAINT animal_recoit_FK FOREIGN KEY (id_animal) REFERENCES Animal(id_animal),
        CONSTRAINT ID_recoit_P PRIMARY KEY (id_soin, id_animal)
);


CREATE TABLE Cohabite (
        id_cohabiter INT,
        id_peut_cohabiter INT,
        CONSTRAINT cohabiter_FK FOREIGN KEY (id_cohabiter) REFERENCES Espece(id_espece),
        CONSTRAINT peut_cohabiter_FK FOREIGN KEY (id_peut_cohabiter) REFERENCES Espece(id_espece),
        CONSTRAINT ID_cohabite_P PRIMARY KEY (id_cohabiter, id_peut_cohabiter)
);

CREATE TABLE Specialite (
        id_espece INT,
        id_personnel INT,
        CONSTRAINT espece_specialite_FK FOREIGN KEY (id_espece) REFERENCES Espece(id_espece),
        CONSTRAINT personnel_specialite_FK FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel),
        CONSTRAINT ID_specialite_P PRIMARY KEY (id_espece, id_personnel)
);

CREATE TABLE Travaille (
        id_boutique INT,
        id_personnel INT,
        CONSTRAINT boutique_travaille_FK FOREIGN KEY (id_boutique) REFERENCES Boutique(id_boutique),
        CONSTRAINT personnel_travaille_FK FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel),
        CONSTRAINT ID_travaille_P PRIMARY KEY (id_boutique, id_personnel)
);

CREATE TABLE Repare_enclos (
        id_enclos INT,
        id_personnel INT,
        CONSTRAINT enclos_repare_FK FOREIGN KEY (id_enclos) REFERENCES Enclos(id_enclos),
        CONSTRAINT personnel_repare_FK FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel),
        CONSTRAINT ID_repare_enclos_P PRIMARY KEY (id_enclos, id_personnel)
);

CREATE TABLE nettoie (
        id_zone INT,
        id_personnel INT,
        CONSTRAINT zone_nettoie_FK FOREIGN KEY (id_zone) REFERENCES Zone(id_zone),
        CONSTRAINT personnel_nettoie_FK FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel),
        CONSTRAINT ID_nettoie_P PRIMARY KEY (id_zone, id_personnel)
);







