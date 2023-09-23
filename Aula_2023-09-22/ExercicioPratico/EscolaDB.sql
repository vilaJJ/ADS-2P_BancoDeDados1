-- Criando banco
CREATE DATABASE IF NOT EXISTS EscolaDB;

-- Usando banco
USE EscolaDB;

-- Criando tabela para Professores
CREATE TABLE IF NOT EXISTS Professores(
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR(320) NOT NULL
);

-- Criando tabela para Departamentos
CREATE TABLE IF NOT EXISTS Departamentos(
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(30) NOT NULL
);

-- Criando tabela para Veiculos
CREATE TABLE IF NOT EXISTS Veiculos(
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Marca VARCHAR(30) NOT NULL,
	Modelo VARCHAR(30) NOT NULL,
	Placa VARCHAR(8) NOT NULL,
	ID_Professor INT NOT NULL,
	ID_Departamento INT NOT NULL,
	FOREIGN KEY (ID_Professor) REFERENCES Professores(ID),
	FOREIGN KEY (ID_Departamento) REFERENCES Departamentos(ID)
);

-- Inserindo dados em Professores
INSERT INTO Professores(Nome, Email) VALUES
	('Bárbara Marques Bianchini Condessa', 'barbara.condessa@ifto.edu.br'),
	('Silvia Fernandes Nunes Ramalho', 'silvia.ramalho@ifto.edu.br'),
	('José Roberto Cruz e Silva', 'jose.silva@ifto.edu.br');

-- Inserindo dados em Departamentos
INSERT INTO Departamentos(Nome) VALUES
	('Informática'),
	('Biotecnologia'),
	('Linguagens');

-- Inserindo dados em Veiculos
INSERT INTO Veiculos(Marca, Modelo, Placa, ID_Professor, ID_Departamento) VALUES
	('Toyota', 'Corolla ALTIS', 'SQL2X23', 3, 1),
	('Mercedes', 'A320', 'LPS8B21', 1, 2),
	('Fiat', 'Toro Endurance', 'JHZ2N83', 2, 3);
    
-- Consultando dados sobre Veiculos
SELECT
	Veiculos.ID,
	Veiculos.Marca,
	Veiculos.Modelo,
	Veiculos.Placa,
	Professores.Nome 'Proprietário',
	Professores.Email 'Email do Proprietário',
	Departamentos.Nome 'Departamento do Proprietário'
FROM Veiculos
INNER JOIN Professores 
	ON Veiculos.ID_Professor = Professores.ID
INNER JOIN Departamentos
	ON Veiculos.ID_Departamento = Departamentos.ID
GROUP BY Veiculos.ID
ORDER BY Veiculos.ID ASC;