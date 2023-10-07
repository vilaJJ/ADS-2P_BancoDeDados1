-- 1. Crie um banco de dados chamado "PetParadiseDB" no MySQL.
CREATE DATABASE PetParadiseDB;

USE PetParadiseDB;

-- 2. Crie as seguintes tabelas no banco de dados:
-- Tabela "Clientes" com campos: `ID`, `Nome`, `Endereço`, `Telefone`.
CREATE TABLE Clientes(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Endereco VARCHAR(300),
	Telefone VARCHAR(20)
);

-- Tabela "Animais" com campos: `ID`, `Nome`, `Espécie`, `Idade`, `ID_Cliente` (chave estrangeira referenciando a tabela Clientes).
CREATE TABLE Animais(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Especie VARCHAR(30) NOT NULL,
	Idade INTEGER NOT NULL,
	ID_Cliente INTEGER NOT NULL,
	FOREIGN KEY(ID_Cliente) REFERENCES Clientes(ID)
);

-- Tabela "Produtos" com campos: `ID`, `Nome`, `Descrição`, `Preço`.
CREATE TABLE Produtos(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Descricao VARCHAR(200),
	Preco FLOAT NOT NULL
);

-- Tabela "Agendamento" com campos: `ID`, `ID_Cliente` (chave estrangeira referenciando a tabela Clientes), `Data`, `Hora`, `Serviço`.
CREATE TABLE Agendamento(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	ID_Cliente INTEGER NOT NULL,
	Data DATE NOT NULL,
	Hora TIME NOT NULL,
	Servico VARCHAR(100) NOT NULL,
	FOREIGN KEY(ID_Cliente) REFERENCES Clientes(ID)
);

-- Tabela "Vendas" com campos: `ID`, `ID_Cliente` (chave estrangeira referenciando a tabela Clientes), `Data`, `Total`.
CREATE TABLE Vendas(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	ID_Cliente INTEGER NOT NULL,
	Data DATE NOT NULL,
	Total FLOAT NOT NULL,
	FOREIGN KEY(ID_Cliente) REFERENCES Clientes(ID)
);

-- 3. Insira pelo menos 5 registros em cada uma das tabelas.
INSERT INTO Clientes(Nome, Endereco, Telefone) 
	VALUES
	('Beatriz Coelho dos Santos', 'Rua das Palmeiras, 213', '+55 (63) 99124-6402'),
	('Jefferson Ribiero Vasconcelos Cunha', 'Rua dos Levantadores, 156', '+55 (63) 99214-6412'),
	('Maria Eduarda Batista Souza', 'Rua dos Médicos, 896', '+55 (63) 99478-1246'),
	('Bárbara Ohana Santos Silva', 'Rua dos Padeiros, 182', '+55 (63) 99103-4103'),
	('Juan Felipe Alves Flores', 'Rua das Macaxeiras, 143', '+55 (63) 99234-7880');

INSERT INTO Animais(Nome, Especie, Idade, ID_Cliente)
	VALUES
	('Bart', 'Ashera', 2, 2),
	('Ferdinand', 'Bulldog', 5, 3),
	('Nina', 'Pitbull', 6, 1),
	('Nami', 'OP', 1, 4),
	('Linda', 'Basset', 4, 5);

INSERT INTO Produtos(Nome, Descricao, Preco)
	VALUES
	('Shampoo c/ Condicionador - Cereja', '500ml - Ideal para matar carrapichos', 14.90),
	('Petisco de Carne Seca', '200g - Usado para adestramento', 21.90),
	('Coleira peitoral - Tamanho Médio', 'Cor preta', 15.99),
	('Caixa de areia - 10 litros', 'Cor vermelha', 24.59),
	('Cortador de unha', 'Cor rosa', 17.99);

INSERT INTO Agendamento(ID_Cliente, Data, Hora, Servico)
	VALUES
	(4, '2023-10-11', '11:00:00', 'Podagem'),
	(3, '2023-10-12', '17:00:00', 'Lavagem completa'),
	(1, '2023-10-15', '09:00:00', 'Tratamento nas unhas'),
	(5, '2023-10-18', '10:00:00', 'Ensaio fotográfico'),
	(2, '2023-10-19', '14:00:00', 'Transporte');
    
INSERT INTO Vendas(ID_Cliente, Data, Total)
	VALUES
	(2, '2023-10-02', 54.63),
	(1, '2023-10-06', 29.98),
	(5, '2023-10-09', 17.98),
	(3, '2023-10-10', 71.45),
	(4, '2023-10-11', 23.72);

-- 4. Realize as seguintes consultas SQL (uma tabela por consulta):
-- Liste todos os clientes.
SELECT * FROM Clientes;

-- Liste todos os animais de estimação.
SELECT * FROM Animais;

-- Liste todos os produtos disponíveis.
SELECT * FROM Produtos;

-- Liste todos os agendamentos.
SELECT * FROM Agendamento;

-- Liste todas as vendas.
SELECT * FROM Vendas;

-- 5. Realize as seguintes operações de atualização no banco de dados:
-- Atualize o endereço de um cliente específico.
UPDATE Clientes SET Endereco = 'Rua dos Centrais, 747' WHERE ID = 5;

-- Atualize o preço de um produto específico.
UPDATE Produtos SET Preco = 12.99 WHERE ID = 1;

-- Exclua um agendamento específico.
DELETE FROM Agendamento WHERE ID = 2;