INSERT INTO Zone VALUES (1,'Savane');
INSERT INTO Zone VALUES (2,'Jungle');
INSERT INTO Zone VALUES (3,'Zone Aquatique');
INSERT INTO Zone VALUES (4,'Montagne');

INSERT INTO Aliment VALUES (1,'Viande',500);
INSERT INTO Aliment VALUES (2,'Poisson',300);
INSERT INTO Aliment VALUES (3,'Herbe',800);
INSERT INTO Aliment VALUES (4,'Fruits',200);
INSERT INTO Aliment VALUES (5,'Bambou',150);

INSERT INTO Visiteur VALUES (1,'mdp123','Martin','Lucas');
INSERT INTO Visiteur VALUES (2,'mdp456','Durand','Emma');
INSERT INTO Visiteur VALUES (3,'mdp789','Petit','Noah');
INSERT INTO Visiteur VALUES (4,'azerty','Moreau','Lea');
INSERT INTO Visiteur VALUES (5,'qwerty','Simon','Louis');

INSERT INTO Prestataire VALUES (1,DATE '2023-01-01',DATE '2026-01-01');
INSERT INTO Prestataire VALUES (2,DATE '2024-06-01',DATE '2027-06-01');
INSERT INTO Prestataire VALUES (3,DATE '2022-03-01',DATE '2025-03-01');

INSERT INTO Enclos VALUES (1,48.856600,2.352200,500,'Grand enclos',1);
INSERT INTO Enclos VALUES (2,48.857000,2.353000,300,'Enclos arboré',2);
INSERT INTO Enclos VALUES (3,48.858000,2.354000,400,'Bassin',3);
INSERT INTO Enclos VALUES (4,48.859000,2.355000,250,'Zone rocheuse',4);

INSERT INTO Boutique VALUES (1,'Souvenirs',1);
INSERT INTO Boutique VALUES (2,'Restaurant',2);
INSERT INTO Boutique VALUES (3,'Glaces',3);

INSERT INTO Gain VALUES (1,DATE '2025-01-10',2000,1);
INSERT INTO Gain VALUES (2,DATE '2025-01-11',3500,2);
INSERT INTO Gain VALUES (3,DATE '2025-01-12',1200,3);

INSERT INTO Espece VALUES (1,'Panthera leo','Lion',1,1);
INSERT INTO Espece VALUES (2,'Elephas maximus','Elephant',0,1);
INSERT INTO Espece VALUES (3,'Gorilla gorilla','Gorille',1,2);
INSERT INTO Espece VALUES (4,'Delphinus delphis','Dauphin',0,3);
INSERT INTO Espece VALUES (5,'Ailuropoda melanoleuca','Panda',1,2);

INSERT INTO Personnel VALUES (1,'mdp1','Dupont','Jean','Veterinaire',NULL,NULL,NULL,NULL);
INSERT INTO Personnel VALUES (2,'mdp2','Bernard','Alice','Soigneur',NULL,NULL,NULL,NULL);
INSERT INTO Personnel VALUES (3,'mdp3','Robert','Paul','Gerant',1,NULL,NULL,NULL);
INSERT INTO Personnel VALUES (4,'mdp4','Garcia','Marie','Soigneur',NULL,NULL,NULL,NULL);
INSERT INTO Personnel VALUES (5,'mdp5','Petit','Lucas','Agent entretien',NULL,NULL,NULL,NULL);
INSERT INTO Personnel VALUES (6,'mdp5','Timothée','Roulin','Soigneur en chef',NULL,NULL,NULL,1);
INSERT INTO Personnel VALUES (7,'$2y$10$bIsWpRbtwQ.LPoLxIqqMqOl8fp64uvpI7B7p78C7JOG5.v084WvEO','admin','admin','admin',NULL,NULL,NULL,NULL);
INSERT INTO Personnel VALUES (8,'mdp6','Abel','Foure','Vendeur',NULL,NULL,NULL,NULL);
INSERT INTO Personnel VALUES (9,'mdp7','Aymerick','Bailleul','Vendeur',NULL,NULL,NULL,NULL);

INSERT INTO Animal VALUES (1,'Lion','Simba',DATE '2015-05-10',190,'M',1,NULL,NULL,1);
INSERT INTO Animal VALUES (2,'Lion','Nala',DATE '2016-07-15',130,'F',1,NULL,NULL,1);
INSERT INTO Animal VALUES (3,'Elephant','Dumbo',DATE '2018-03-12',500,'M',2,NULL,NULL,1);
INSERT INTO Animal VALUES (4,'Lion','Kion',DATE '2021-02-10',90,'M',1,1,2,1);
INSERT INTO Animal VALUES (5,'Gorille','Koko',DATE '2017-09-01',160,'F',3,NULL,NULL,2);
INSERT INTO Animal VALUES (6,'Dauphin','Flipper',DATE '2019-06-21',120,'M',4,NULL,NULL,3);
INSERT INTO Animal VALUES (7,'Panda','Bao',DATE '2020-04-05',100,'M',5,NULL,NULL,2);

INSERT INTO Réparation VALUES (1,1500,DATE '2024-10-10','Cloture cassee',1,1);
INSERT INTO Réparation VALUES (2,800,DATE '2025-01-05','Nettoyage bassin',3,2);
INSERT INTO Réparation VALUES (3,600,DATE '2025-02-01','Reparation portail',2,3);

INSERT INTO Soin VALUES (1,DATE '2025-02-10',1,'Vaccin',1);
INSERT INTO Soin VALUES (2,DATE '2025-02-15',2,'Examen',1);
INSERT INTO Soin VALUES (3,DATE '2025-03-01',1,'Analyse sang',1);
	
INSERT INTO Nourriture VALUES (DATE '2025-01-01', 1, 10, 1, 2);
INSERT INTO Nourriture VALUES (DATE '2025-01-02', 3, 40, 2, 2);
INSERT INTO Nourriture VALUES (DATE '2025-01-03', 1, 8, 1, 4);

INSERT INTO Contrat VALUES (1,DATE '2023-01-01',DATE '2026-01-01',3000,'Veterinaire',1);
INSERT INTO Contrat VALUES (2,DATE '2024-01-01',DATE '2027-01-01',2200,'Soigneur',2);
INSERT INTO Contrat VALUES (3,DATE '2024-01-01',DATE '2026-01-01',1800,'Vendeur',3);
INSERT INTO Contrat VALUES (4,DATE '2024-02-01',DATE '2027-02-01',2100,'Soigneur',4);

INSERT INTO Recoit VALUES (1,1);
INSERT INTO Recoit VALUES (1,2);
INSERT INTO Recoit VALUES (2,3);
INSERT INTO Recoit VALUES (3,5);

INSERT INTO Parrainage VALUES ('A',1,1);
INSERT INTO Parrainage VALUES ('B',2,3);
INSERT INTO Parrainage VALUES ('C',3,6);
INSERT INTO Parrainage VALUES ('A',4,7);

INSERT INTO Cohabite VALUES (1,2);
INSERT INTO Cohabite VALUES (2,1);
INSERT INTO Cohabite VALUES (3,5);

INSERT INTO Specialite VALUES (1,1);
INSERT INTO Specialite VALUES (3,1);
INSERT INTO Specialite VALUES (5,1);

INSERT INTO Travaille VALUES (1,7);
INSERT INTO Travaille VALUES (2,7);
INSERT INTO Travaille VALUES (3,7);
INSERT INTO Travaille VALUES (2,8);

INSERT INTO Repare_enclos VALUES (1,2);
INSERT INTO Repare_enclos VALUES (2,4);

INSERT INTO nettoie VALUES (1,5);
INSERT INTO nettoie VALUES (2,5);
INSERT INTO nettoie VALUES (3,5);

INSERT INTO Remplacement VALUES (1,DATE '2025-02-01',DATE '2025-02-10',2,4);
