-- compte le nombre d'animaux d'une espece
SELECT e.nom_usuel, COUNT(a.id_animal) AS nombre_animaux
FROM Espece e
LEFT JOIN Animal a ON e.id_espece = a.id_espece
GROUP BY e.nom_usuel;


