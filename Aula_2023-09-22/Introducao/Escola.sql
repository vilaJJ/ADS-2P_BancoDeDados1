-- Exemplo de relacionamento 1:1 (um para um)

CREATE DATABASE Escola;

USE Escola;

CREATE TABLE Estudantes(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Idade INT NOT NULL
);

CREATE TABLE DetalhesEstudantes(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(320) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    ID_Estudante INT NOT NULL,
    FOREIGN KEY (ID_Estudante) REFERENCES Estudantes(ID)
);

INSERT INTO Estudantes(Nome, Idade) VALUES
	('Juan Felipe Alves Flores', 19),
    ('Bárbara Ohana Santos Silva', 18);
    
INSERT INTO DetalhesEstudantes(Email, Telefone, ID_Estudante) VALUES
	('juan.flores@estudante.ifto.edu.br', '+55 (63) 99236-5024', 1),
    ('barbara.ohana@estudante.facit-to.edu.br', '+55 (63) 99201-4852', 2);
    
SELECT
	Estudantes.ID,
	Estudantes.Nome,
	Estudantes.Idade,
	DetalhesEstudantes.Email,
	DetalhesEstudantes.Telefone
FROM Estudantes
INNER JOIN DetalhesEstudantes 
	ON Estudantes.ID = DetalhesEstudantes.ID_Estudante
ORDER BY Estudantes.ID ASC;