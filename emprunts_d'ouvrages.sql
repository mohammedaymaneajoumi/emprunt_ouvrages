    CREATE TABLE ouvrage (
    code_ouvrage INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titre VARCHAR(30) NOT NULL,
    nom_auteur VARCHAR(30) NOT NULL,
    image_couverture VARCHAR(225) NOT NULL,
    etat VARCHAR(225) NOT NULL,
    type VARCHAR(20) NOT NULL,
    date_edition date NOT NULL,
    date_achat date NOT NULL,
    nombre_pages VARCHAR(5) 
    );

    CREATE TABLE bibliothecaire(
    code_bibliothecaire INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL 
    );

CREATE TABLE adherent(
    code_adherent INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(25) NOT NULL,
    prenom VARCHAR(25) NOT NULL,
    adresse VARCHAR(225) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telephone VARCHAR(10) NOT NULL,
    CIN VARCHAR(8) NOT NULL,
    date_de_naissance VARCHAR(12) NOT NULL,
    type VARCHAR(20) NOT NULL,
    date_inscription date NOT NULL,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    penalite VARCHAR(1) NOT NULL,
    code_bibliothecaire INT NOT NULL,
    FOREIGN KEY (code_bibliothecaire) REFERENCES bibliothecaire(code_bibliothecaire)
);

    CREATE TABLE reservation  (
    code_reservation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_reservation date NOT NULL,
    code_adherent INT NOT NULL,
    FOREIGN KEY (code_adherent) REFERENCES Adherent(code_adherent)
    );

    CREATE TABLE emprunt (
    code_emprunt INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_emprunt date NOT NULL,
    date_retour date NOT NULL,
    code_reservation INT NOT NULL,
    code_ouvrage INT NOT NULL,
    code_bibliothecaire_emprunt INT NOT NULL,
    code_bibliothecaire_retour INT NOT NULL,
    FOREIGN KEY (code_reservation) REFERENCES reservation(code_reservation),
    FOREIGN KEY (code_ouvrage) REFERENCES ouvrage(code_ouvrage),
    FOREIGN KEY (code_bibliothecaire_emprunt) REFERENCES bibliothecaire(code_bibliothecaire),
    FOREIGN KEY (code_bibliothecaire_retour) REFERENCES bibliothecaire(code_bibliothecaire)
    );