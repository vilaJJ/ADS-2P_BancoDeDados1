-- Criando base de dados
CREATE DATABASE LanchoneteMandevilla;

-- Usando base de dados
USE LanchoneteMandevilla;

-- Criando tabelas:
CREATE TABLE Menu(
	id_menu INT PRIMARY KEY AUTO_INCREMENT,
	nome_item VARCHAR(50) NOT NULL,
	preco FLOAT NOT NULL
);

CREATE TABLE Clientes(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(20) NULL DEFAULT 'Não cadastrado',
	email VARCHAR(320) NULL DEFAULT 'Não cadastrado'
);

CREATE TABLE Funcionarios(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	cargo VARCHAR(30) NOT NULL,
	data_admissao DATE NOT NULL
);

CREATE TABLE Estoque(
	id_estoque INT PRIMARY KEY AUTO_INCREMENT,
	id_item_menu INT NOT NULL UNIQUE,
	quantidade_disponivel INT NOT NULL,
	data_entrada DATE NOT NULL,
	FOREIGN KEY(id_item_menu) REFERENCES Menu(id_menu)
);

CREATE TABLE Pedidos(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	id_item_menu INT NOT NULL,
	quantidade INT NOT NULL,
	data_pedido DATE NOT NULL,
	FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
	FOREIGN KEY(id_item_menu) REFERENCES Menu(id_menu)
);

-- Inserções
INSERT INTO Menu(nome_item, preco) VALUES
	('Hambúrguer', 8.99),
	('Batata Frita', 3.49),
	('Refrigerante', 1.99),
	('Pizza', 10.99),
	('Sundae', 4.99),
	('Suco Natural', 8.49),
	('Sanduíche', 6.99),
	('Milk-Shake', 11.99);

INSERT INTO Clientes(nome, telefone, email) VALUES
	('Sara Ghabrielly', '+55 (63) 99034-4679', 'sara.ghabi@gmail.com'),
	('Bárbara Ohana', '+55 (63) 99102-4212', 'barbara.ohana@gmail.com'),
	('Maria Eduarda', '+55 (63) 99203-4533', 'maria.eduarda@gmail.com');

INSERT INTO Funcionarios(nome, cargo, data_admissao) VALUES
	('Juan Felipe', 'Cozinheiro', '2023-01-02'),
	('Jefferson Ribeiro', 'Garçom', '2023-08-09');

INSERT INTO Estoque(id_item_menu, quantidade_disponivel, data_entrada) VALUES
	(1, 12, '2023-07-03'),
	(2, 5, '2023-07-21'),
	(3, 3, '2023-07-11'),
	(4, 15, '2023-07-07'),
	(5, 0, '2023-07-02'),
	(6, 8, '2023-07-25'),
	(7, 0, '2023-07-26'),
	(8, 2, '2023-07-02');

INSERT INTO Pedidos(id_cliente, id_item_menu, quantidade, data_pedido) VALUES
	(2, 6, 2, '2023-08-15'),
	(1, 4, 1, '2023-09-01'),
	(3, 2, 3, '2023-08-07'),
	(2, 5, 6, '2023-08-09'),
	(2, 7, 4, '2023-07-15'),
	(1, 8, 2, '2023-08-09'),
	(3, 1, 1, '2023-09-19'),
	(1, 3, 2, '2023-10-10'),
	(2, 2, 4, '2023-09-23'),
	(1, 5, 3, '2023-08-09'),
	(1, 7, 1, '2023-09-17'),
	(2, 1, 1, '2023-10-17'),
	(3, 6, 2, '2023-09-29');

-- Questões de Consulta (Exemplos):
-- 1. Recupere todos os itens do menu que possuem um preço inferior a 5.00.
SELECT 
	id_menu AS 'ID',
	nome_item AS 'Nome',
	preco AS 'Preço (R$)'
FROM Menu 
WHERE 
	preco < 5;

-- 2. Liste os pedidos feitos em uma data específica.
SELECT
	Pedidos.id_pedido AS 'Código do Pedido',
	Pedidos.data_pedido AS 'Data do Pedido',
	Clientes.nome AS 'Nome do Cliente',
	Menu.nome_item AS 'Produto',
	Pedidos.quantidade AS 'Quantidade'
FROM Pedidos
INNER JOIN Clientes 
	ON Pedidos.id_cliente = Clientes.id_cliente
INNER JOIN Menu 
	ON Pedidos.id_item_menu = Menu.id_menu
WHERE 
	Pedidos.data_pedido = '2023-08-09';

-- 3. Encontre todos os clientes cujos nomes contenham a palavra "pizza".
SELECT
	id_cliente AS 'ID',
	nome AS 'Nome',
	telefone AS 'Número de Telefone',
	email AS 'Endereço de Email'
FROM Clientes 
WHERE 
	nome LIKE '%pizza%';

-- 4. Recupere os pedidos feitos por um cliente específico.
SELECT
	Pedidos.id_pedido AS 'Código do Pedido',
	Pedidos.data_pedido AS 'Data do Pedido',
	Clientes.nome AS 'Nome do Cliente',
	Menu.nome_item AS 'Produto',
	Pedidos.quantidade AS 'Quantidade'
FROM Pedidos
INNER JOIN Clientes 
	ON Pedidos.id_cliente = Clientes.id_cliente
INNER JOIN Menu 
	ON Pedidos.id_item_menu = Menu.id_menu
WHERE 
	Clientes.id_cliente = 2;

-- 5. Selecione o nome e o cargo de todos os funcionários contratados após uma determinada data.
SELECT
	nome AS 'Nome do funcionário',
	cargo 'Cargo'
FROM Funcionarios
WHERE
	data_admissao > '2023-06-06';

-- 6. Localize os itens do menu com preço superior a 7.00 e com quantidade disponível em estoque.
SELECT
	Menu.id_menu AS 'ID do Item',
	Menu.nome_item AS 'Nome',
	Menu.preco AS 'Preço (R$)',
	Estoque.quantidade_disponivel AS 'Quantidade disponível'
FROM Menu
INNER JOIN Estoque
	ON Menu.id_menu = Estoque.id_item_menu
WHERE
	Menu.preco > 7 AND
	Estoque.quantidade_disponivel > 0;

-- 7. Liste os clientes que fizeram pedidos de hambúrguer ou sundae.
SELECT
	Pedidos.id_pedido AS 'Código do Pedido',
	Pedidos.data_pedido AS 'Data do Pedido',
	Clientes.nome AS 'Nome do Cliente',
	Menu.nome_item AS 'Produto',
	Pedidos.quantidade AS 'Quantidade'
FROM Pedidos
INNER JOIN Clientes 
	ON Pedidos.id_cliente = Clientes.id_cliente
INNER JOIN Menu 
	ON Pedidos.id_item_menu = Menu.id_menu
WHERE 
	Pedidos.id_item_menu = 1 OR
	Pedidos.id_item_menu = 5;

-- 8. Recupere os pedidos feitos por clientes com um número de telefone específico.
SELECT
	Pedidos.id_pedido AS 'Código do Pedido',
	Pedidos.data_pedido AS 'Data do Pedido',
	Clientes.nome AS 'Nome do Cliente',
	Clientes.telefone AS 'N° Telefone do Cliente',
	Menu.nome_item AS 'Produto',
	Pedidos.quantidade AS 'Quantidade'
FROM Pedidos
INNER JOIN Clientes 
	ON Pedidos.id_cliente = Clientes.id_cliente
INNER JOIN Menu 
	ON Pedidos.id_item_menu = Menu.id_menu
WHERE 
	Clientes.telefone = '+55 (63) 99203-4533';

-- 9. Encontre os itens do menu com uma quantidade disponível inferior a 10 unidades.
SELECT
	Menu.id_menu AS 'ID do Item',
	Menu.nome_item AS 'Nome',
	Menu.preco AS 'Preço (R$)',
	Estoque.quantidade_disponivel AS 'Quantidade disponível'
FROM Menu
INNER JOIN Estoque
	ON Menu.id_menu = Estoque.id_item_menu
WHERE
	Estoque.quantidade_disponivel < 10;

-- 10. Liste os clientes que fizeram pedidos de pizza e batata frita na mesma transação.
SELECT
	Pedidos.id_pedido AS 'Código do Pedido',
	Pedidos.data_pedido AS 'Data do Pedido',
	Clientes.nome AS 'Nome do Cliente',
	Menu.nome_item AS 'Produto',
	Pedidos.quantidade AS 'Quantidade'
FROM Pedidos
INNER JOIN Clientes 
	ON Pedidos.id_cliente = Clientes.id_cliente
INNER JOIN Menu 
	ON Pedidos.id_item_menu = Menu.id_menu
WHERE 
	Pedidos.id_item_menu = 4 AND
	Pedidos.id_item_menu = 2;