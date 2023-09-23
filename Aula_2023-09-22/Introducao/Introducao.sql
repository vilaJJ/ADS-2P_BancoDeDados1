-- Criar o banco de dados 'Teste', caso não exista
CREATE DATABASE IF NOT EXISTS MeuBanco;

-- Usar o banco de dados 'MeuBanco'
USE MeuBanco;

-- Cria a tabela 'Teste', caso não exista

CREATE TABLE IF NOT EXISTS Teste(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(20)
);

-- Consulta todas as colunas e linhas da tabela 'Teste'
SELECT * FROM Teste;

-- Inserir registros
INSERT INTO Teste(Nome, Telefone) VALUES
	('Juan Felipe Alves Flores', '+55 (63) 99324-7036'),
	('Bárbara Ohana Santos Silva', '+55 (63) 99156-8201');