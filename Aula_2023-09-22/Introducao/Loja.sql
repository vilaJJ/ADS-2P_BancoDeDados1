-- Exemplo de relacionamento 1:M (um para muitos)

CREATE DATABASE Loja;

USE Loja;

CREATE TABLE Clientes(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(320) NOT NULL
);

CREATE TABLE Vendas(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    DataHorario DATETIME NOT NULL,
    Valor FLOAT NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

INSERT INTO Clientes(Nome, Email) VALUES
	('Juan Felipe Alves Flores', 'juan.flores@mandevilla.dev'),
    ('Bárbara Ohana Santos Silva', 'barbara.ohana@mandevilla.dev');
    
INSERT INTO Vendas(DataHorario, Valor, ID_Cliente) VALUES
	('2023-05-23 23:04:21', 63.92, 1),
    ('2023-08-12 19:48:26', 23.52, 1),
    ('2023-06-03 21:42:15', 56.14, 2),
    ('2023-07-04 13:51:51', 14.34, 2);
    
SELECT
	Clientes.ID,
	Clientes.Nome,
	Clientes.Email,
	Vendas.DataHorario,
	Vendas.Valor
FROM Clientes
INNER JOIN Vendas 
	ON Clientes.ID = Vendas.ID_Cliente
GROUP BY Vendas.ID
ORDER BY Clientes.ID ASC;