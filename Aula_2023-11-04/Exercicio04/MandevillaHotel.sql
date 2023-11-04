-- Criando banco de dados
CREATE DATABASE MandevillaHotelDB;

-- Acessando banco de dados
USE MandevillaHotelDB;

-- Tabelas
CREATE TABLE Hoteis(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(30) NOT NULL,
	Endereco VARCHAR(100) NOT NULL,
	QuantidadeQuartos INT NOT NULL
);

CREATE TABLE TipoQuarto(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(20) NOT NULL
);

CREATE TABLE Quartos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	TipoQuarto_Codigo INT NOT NULL,
	Hotel_Codigo INT NOT NULL,
	Numero INT NOT NULL,
	Preco DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY(TipoQuarto_Codigo) REFERENCES TipoQuarto(Codigo)
);

CREATE TABLE Clientes(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100) NOT NULL,
	Endereco VARCHAR(100) NULL,
	Telefone VARCHAR(20) NOT NULL,
	EnderecoEmail VARCHAR(320) NULL
);

CREATE TABLE Reservas(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Hotel_Codigo INT NOT NULL,
	Quarto_Codigo INT NOT NULL,
	Cliente_Codigo INT NOT NULL,
	CheckIn DATETIME NOT NULL,
	CheckOut DATETIME NOT NULL,
	QuantidadeHospedes INT NOT NULL,
	FOREIGN KEY(Hotel_Codigo) REFERENCES Hoteis(Codigo),
	FOREIGN KEY(Quarto_Codigo) REFERENCES Quartos(Codigo),
	FOREIGN KEY(Cliente_Codigo) REFERENCES Clientes(Codigo)
);

CREATE TABLE Cargos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(30) NOT NULL
);

CREATE TABLE Funcionarios(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Hotel_Codigo INT NOT NULL,
	Cargo_Codigo INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	DataContratacao DATE NOT NULL,
	FOREIGN KEY(Hotel_Codigo) REFERENCES Hoteis(Codigo),
	FOREIGN KEY(Cargo_Codigo) REFERENCES Cargos(Codigo)
);

CREATE TABLE Servicos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Hotel_Codigo INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	FOREIGN KEY(Hotel_Codigo) REFERENCES Hoteis(Codigo)
);

CREATE TABLE TiposPagamento(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(30) NOT NULL
);

CREATE TABLE Pagamentos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Reserva_Codigo INT NOT NULL UNIQUE,
	TipoPagamento_Codigo INT NOT NULL,
	DataPagamento DATETIME NOT NULL,
	FOREIGN KEY(Reserva_Codigo) REFERENCES Reservas(Codigo),
	FOREIGN KEY(TipoPagamento_Codigo) REFERENCES TiposPagamento(Codigo)
);

CREATE TABLE Avaliacoes(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Reserva_Codigo INT NOT NULL UNIQUE,
	Nota TINYINT NOT NULL,
	Comentario VARCHAR(400) NULL,
	FOREIGN KEY(Reserva_Codigo) REFERENCES Reservas(Codigo)
);

-- Inserções
INSERT INTO Hoteis (Nome, Endereco, QuantidadeQuartos) VALUES
('Vista Boa', 'Rua das Macieiras, n° 421, Setor Global', 45),
('Jalapão Palace', 'Av. Siqueira Campos, n° 201, St. Asa Sul', 110),
('Bico do Papagaio', 'Rua das Mandiocas, n° 723, St. Centro', 35),
('Via Lago Palace', 'Av. Filadélfia, n° 100, St. Filadélfia', 150),
('Campo Dourado', 'Av. AB14, n° 404, St. Oeste', 105);

INSERT INTO TipoQuarto (Nome) VALUES
('Simples'),
('Suite'),
('Luxo'),
('Super Luxo'),
('Presidencial');

INSERT INTO Quartos (TipoQuarto_Codigo, Hotel_Codigo, Numero, Preco) VALUES
(1, 4, 401, 160.00),
(2, 3, 202, 210.00),
(3, 1, 103, 320.00),
(4, 5, 125, 550.00),
(5, 2, 104, 650.00),
(1, 4, 136, 150.00),
(2, 1, 205, 260.00),
(3, 2, 208, 365.00),
(4, 5, 145, 470.00),
(5, 3, 309, 500.00);

INSERT INTO Clientes (Nome, Endereco, Telefone, EnderecoEmail) VALUES
('Juan Felipe Alves Flores', 'Rua Central, n° 313, St. Centro, Araguaína - TO', '+55 (63) 99201-4561', 'juan.flores@gmail.com'),
('Bárbara Ohana Santos Silva', 'Rua dos Delegados, n° 201, St. Judiciário, Araguaína - TO', '+55 (63) 99201-1649', 'barbara.silva@gmail.com'),
('Jefferson Ribeiro Vasconcelos Caralho', 'Rua dos Levantadores, n° 101, St. Dois Toques, Palmas - TO', '+55 (63) 99246-1014', 'jefferson.caralho@gmail.com'),
('Maria Eduarda Batista Souza', 'Rua dos Vendedores, n° 630, St. Paraíba, Porto Nacional - TO', '+55 (63) 99130-1842', 'maria.souza@gmail.com'),
('Vitor Araújo dos Santos', 'Rua dos Pipoqueiros, n° 401, St. Oposto, Araguatins - TO', '+55 (63) 99102-4891', 'vitor.santos@gmail.com');

INSERT INTO Reservas (Hotel_Codigo, Quarto_Codigo, Cliente_Codigo, CheckIn, CheckOut, QuantidadeHospedes) VALUES
(4, 1, 2, '2023-10-18 21:42:27', '2023-10-23 13:47:19', 4),
(3, 2, 3, '2023-10-29 12:37:08', '2023-11-02 10:32:59', 5),
(1, 3, 4, '2023-09-16 17:38:48', '2023-09-18 14:51:12', 3),
(5, 4, 5, '2023-09-22 01:35:55', '2023-09-25 10:32:42', 2),
(2, 5, 1, '2023-09-09 23:20:34', '2023-09-14 14:42:47', 4),
(4, 1, 3, '2023-09-25 07:12:00', '2023-09-27 09:01:47', 5),
(1, 2, 4, '2023-10-30 20:29:19', '2023-11-03 18:49:51', 6),
(2, 3, 2, '2023-09-15 04:53:42', '2023-09-20 10:13:52', 3),
(5, 4, 5, '2023-09-26 06:25:14', '2023-09-30 11:20:45', 2),
(3, 5, 1, '2023-09-07 14:21:32', '2023-09-10 12:54:23', 4);

INSERT INTO Cargos (Nome) VALUES
('Recepcionista'),
('Guarda'),
('Camareiro'),
('Faxineiro'),
('Cozinheiro');

INSERT INTO Funcionarios (Hotel_Codigo, Cargo_Codigo, Nome, DataContratacao) VALUES
(1, 5, 'Kevin Matheus Queiroz Santana', '2008-12-20'),
(2, 3, 'Vinicius Rodrigues Zerbini', '2021-09-11'),
(3, 2, 'Eduardo Henrique Vieira Sousa', '2016-08-24'),
(4, 1, 'Ana Clara Fernandes', '2023-03-07'),
(5, 4, 'João Arthur Borges Rodrigues', '2020-02-28');

INSERT INTO Servicos (Hotel_Codigo, Nome) VALUES
(1, 'Piscina'),
(3, 'Hidromassagem'),
(2, 'Lavanderia'),
(5, 'Almoço'),
(4, 'Estacionamento privado'),
(2, 'Elevador privado'),
(5, 'Adega'),
(3, 'Playground'),
(4, 'TV fechada'),
(1, 'Rede Wi-Fi privada');

INSERT INTO TiposPagamento (Nome) VALUES
('Dinheiro'),
('PIX'),
('Cartão de crédito'),
('Cartão de débito'),
('Transferência bancária');

INSERT INTO Pagamentos (Reserva_Codigo, TipoPagamento_Codigo, DataPagamento) VALUES
(1, 4, '2023-10-18 21:44:16'),
(2, 2, '2023-11-02 10:30:41'),
(3, 1, '2023-09-10 16:42:26'),
(4, 3, '2023-09-22 01:33:20'),
(5, 2, '2023-09-14 14:29:51'),
(6, 5, '2023-09-25 07:11:45'),
(7, 1, '2023-11-02 19:42:02'),
(8, 5, '2023-09-15 04:49:10'),
(9, 3, '2023-09-26 06:21:46'),
(10, 4, '2023-08-30 15:28:29');

INSERT INTO Avaliacoes (Reserva_Codigo, Nota, Comentario) VALUES
(2, 7, 'Muito confortável.'),
(3, 10, 'Perfeito.'),
(5, 3, 'Chuveiro quente não funciona.'),
(7, 2, 'Péssima comida.'),
(8, 9, 'Quarto maravilhoso, só faltou ter mais opções no cardápio.'),
(9, 8, 'Bom serviço, apenas o café da manhã que atrasou em alguns dias.');

-- Questões
-- 1. Liste todos os hotéis que têm mais de 100 quartos.
SELECT 
Codigo AS 'Código',
Nome AS 'Nome',
Endereco AS 'Endereço',
QuantidadeQuartos AS 'Quantidade de Quartos'
FROM Hoteis 
WHERE 
	QuantidadeQuartos > 100;

-- 2. Encontre todas as reservas feitas por um cliente específico pelo nome.
SELECT
	R.Codigo AS 'Código da Reserva',
	H.Nome AS 'Nome do Hotel',
	Q.Numero AS 'Número do quarto',
	C.Nome AS 'Nome do Cliente',
	R.CheckIn AS 'Check-in',
	R.CheckOut AS 'Check-out'
FROM Reservas AS R
INNER JOIN Hoteis AS H
	ON R.Hotel_Codigo = H.Codigo
INNER JOIN Quartos AS Q
	ON R.Quarto_Codigo = Q.Codigo
INNER JOIN Clientes AS C
	ON R.Cliente_Codigo = C.Codigo
WHERE 
	C.Nome LIKE '%Juan%'
ORDER BY
	R.Codigo ASC;
    
-- 3. Liste os quartos disponíveis em um hotel específico durante um período de datas.
SELECT
	Q.Codigo AS 'Código do Quarto',
	H.Nome AS 'Nome do Hotel',
	H.Endereco AS 'Endereço do Hotel',
	Q.Numero AS 'Número do Quarto',
	TQ.Nome AS 'Tipo de Quarto'
FROM Quartos AS Q
INNER JOIN Hoteis AS H
	ON Q.Hotel_Codigo = H.Codigo
INNER JOIN TipoQuarto AS TQ
	ON Q.TipoQuarto_Codigo = TQ.Codigo
INNER JOIN Reservas AS R
	ON Q.Codigo = R.Quarto_Codigo
WHERE 
	('2023-10-20' > R.CheckIn AND '2023-10-22' < R.CheckOut) = False;

-- 4. Atualize o preço de todos os quartos de luxo para um novo valor.
UPDATE Quartos
	SET Preco = 350
WHERE TipoQuarto_Codigo = 
(
	SELECT Codigo 
	FROM TipoQuarto AS TQ 
	WHERE TQ.Codigo = 3
);

-- 10. Encontre todas as avaliações com uma classificação igual ou superior a 4.
SELECT
	A.Codigo AS 'Código da Avaliação',
	H.Nome AS 'Nome do Hotel',
	C.Nome AS 'Nome do Cliente',
	R.CheckIn AS 'Check-in',
	R.CheckOut AS 'Check-out',
	A.Nota AS 'Nota do Cliente',
	A.Comentario AS 'Comentário do Cliente'
FROM Avaliacoes AS A
INNER JOIN Reservas AS R
	ON A.Reserva_Codigo = R.Codigo
INNER JOIN Hoteis AS H
	ON R.Hotel_Codigo = H.Codigo
INNER JOIN Clientes AS C
	ON R.Cliente_Codigo = C.Codigo
WHERE
	A.Nota >= 4
ORDER BY
	R.Codigo;

-- 11. Atualize o endereço de um cliente específico.
UPDATE Clientes
	SET Endereco = 'Rua das Madeiradas, n° 750, St. Anhaguera, Araguaína - TO'
WHERE Codigo = 4;