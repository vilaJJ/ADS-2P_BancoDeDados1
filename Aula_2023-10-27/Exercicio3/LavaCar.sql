-- Criando Banco de Dados
CREATE DATABASE BD_LavaCar;

-- Usando o Banco de Dados
USE BD_LavaCar;

-- Criando as tabelas necessárias
CREATE TABLE Clientes(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Endereco VARCHAR(100) NULL,
	Telefone VARCHAR(20) NOT NULL,
	Email VARCHAR(320) NULL
);

CREATE TABLE Veiculos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Cliente_Codigo INT NOT NULL,
	Marca VARCHAR(30) NOT NULL,
	Modelo VARCHAR(30) NOT NULL,
	Ano YEAR NOT NULL,
	Placa VARCHAR(8) NOT NULL,
	FOREIGN KEY(Cliente_Codigo) REFERENCES Clientes(Codigo)
);

CREATE TABLE Servicos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Servico VARCHAR(30) NOT NULL,
	Preco FLOAT NOT NULL
);

CREATE TABLE Agendamentos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Cliente_Codigo INT NOT NULL,
	Veiculos_Codigo INT NOT NULL,
	Servico_Codigo INT NOT NULL,
	DataAgendamento DATE NOT NULL,
	FOREIGN KEY(Cliente_Codigo) REFERENCES Clientes(Codigo),
	FOREIGN KEY(Veiculos_Codigo) REFERENCES Veiculos(Codigo),
	FOREIGN KEY(Servico_Codigo) REFERENCES Servicos(Codigo)
);

CREATE TABLE TiposPagamento(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Pagamentos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	TipoPagamento_Codigo INT NOT NULL,
	Agendamento_Codigo INT NOT NULL UNIQUE,
	Pago BOOLEAN NOT NULL DEFAULT False,
	FOREIGN KEY(TipoPagamento_Codigo) REFERENCES TiposPagamento(Codigo),
	FOREIGN KEY(Agendamento_Codigo) REFERENCES Agendamentos(Codigo)
);

CREATE TABLE Avaliacoes(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Agendamento_Codigo INT NOT NULL UNIQUE,
	Nota TINYINT NULL,
	Comentario VARCHAR(400) NULL
);

-- Questões

-- 1. Insira no mínimo cinco registros em cada tabela.
INSERT INTO Clientes(Nome, Endereco, Telefone, Email) VALUES
('Juan Felipe Alves Flores', 'Rua ABC, n° 145', '+55 (63) 99230-1210', 'juan.flores@gmail.com'),
('Bárbara Ohana dos Santos Silva', 'Rua DEF, n° 721', '+55 (63) 99013-2147', 'babi.ohana@gmail.com'),
('Maria Eduarda Batista de Sousa', 'Rua HIJ, n° 103', '+55 (63) 99201-2862', 'madu.souza@gmail.com'),
('Jefferson Ribeiro Vasconcelos Caralho', 'Rua 2 Toques, n° 101', '+55 (63) 92069-0420', 'jeff.rvc@gmail.com'),
('Vitor Araújo dos Santos', 'Rua Quinada, n° 404', '+55 (63) 990124-1568', 'vitor.santos@gmail.com');

INSERT INTO Veiculos(Cliente_Codigo, Marca, Modelo, Ano, Placa) VALUES
(4, 'Fiat', 'Marea', 1998, 'MAX-8136'),
(2, 'Toyota', 'Etios Premium', 2019, 'MWZ-8Z65'),
(5, 'Chevrolet', 'Corsa', 2001, 'HLE-2069'),
(3, 'Volkswagen', 'Gol G5', 2010, 'LKZ-5013'),
(1, 'Hyundai', 'HB20-S', 2016, 'KJD-8029');

INSERT INTO Servicos(Servico, Preco) VALUES
('Lavagem simples', '25.00'),
('Enceramento', '60.00'),
('Polimento', '100.00'),
('Aspiração interna', '20.00'),
('Lavagem dos bancos', '35.00');

INSERT INTO TiposPagamento(Nome) VALUES
('Dinheiro'),
('Cartão de Crédito'),
('Cartão de Débito'),
('PIX'),
('Cheque');

INSERT INTO Agendamentos(Cliente_Codigo, Veiculos_Codigo, Servico_Codigo, DataAgendamento) VALUES
(4, 1, 2, '2023-09-10'),
(3, 4, 5, '2023-09-14'),
(5, 3, 1, '2023-09-23'),
(1, 5, 4, '2023-06-28'),
(2, 2, 2, '2023-04-29'),
(1, 5, 3, '2023-03-10'),
(5, 3, 2, '2023-06-15'),
(3, 4, 3, '2023-08-20'),
(2, 2, 5, '2023-05-27'),
(4, 1, 1, '2023-05-22'),
(1, 5, 4, '2023-02-01'),
(5, 3, 2, '2023-11-03'),
(4, 1, 3, '2023-03-20');

INSERT INTO Pagamentos(TipoPagamento_Codigo, Agendamento_Codigo, Pago) VALUES
(4, 1, True),
(5, 2, False),
(1, 3, True),
(2, 4, True),
(2, 5, True),
(3, 6, True),
(1, 7, True),
(1, 8, True),
(1, 9, True),
(2, 10, True),
(4, 11, True),
(3, 12, True),
(2, 13, True);

INSERT INTO Avaliacoes(Agendamento_Codigo, Nota, Comentario) VALUES
(1, 0, 'Queimaram o multimidia do meu carro'),
(2, 9, 'Muito bom'),
(3, 9, 'Excelente'),
(4, 7, null),
(5, 6, null),
(6, 10, 'O melhor da cidade'),
(7, 7, null),
(8, 7, null),
(9, 9, 'Serviço rápido e bem feito'),
(10, 8, null),
(11, 10, null),
(12, 8, 'Atendimento eficaz'),
(13, 7, 'Ótimo custo benefício');

-- 2. Crie uma consulta que liste todos os clientes e seus veículos associados.
SELECT
	V.Codigo AS 'Código',
	V.Placa,
	V.Marca,
	V.Modelo,
	V.Ano,
	C.Nome AS 'Proprietário'
FROM Veiculos AS V
INNER JOIN Clientes AS C
	ON V.Cliente_Codigo = C.Codigo
GROUP BY
	V.Codigo;

-- 3. Atualize o registro de um cliente, alterando seu número de telefone.
UPDATE Clientes SET Telefone = '+55 (63) 99131-8971' WHERE Codigo = 3;

-- 4. Delete um registro de avaliação de um serviço específico.
DELETE FROM Avaliacoes WHERE Codigo = 11;

-- 5. Selecione todos os agendamentos agendados para o próximo mês usando o operador lógico AND.
SELECT
	A.Codigo AS 'Código do Agendamento',
	A.DataAgendamento AS 'Data do Agendamento',
	C.Nome AS 'Nome do Cliente',
	C.Telefone AS 'Contato do Cliente',
	S.Servico AS 'Serviço',
	CONCAT('R$ ', FORMAT(S.Preco, 2)) AS 'Preço',
	V.Marca AS 'Marca do Veículo',
	V.Modelo AS 'Modelo do Veículo',
	V.Ano AS 'Ano do Veículo',
	V.Placa AS 'Placa do Veículo'
FROM Agendamentos AS A
INNER JOIN Clientes AS C
	ON A.Cliente_Codigo = C.Codigo
INNER JOIN Servicos AS S
	ON A.Servico_Codigo = S.Codigo
INNER JOIN Veiculos AS V
	ON C.Codigo = V.Cliente_Codigo
WHERE 
	A.DataAgendamento BETWEEN '2023-11-01' AND '2023-11-30'
GROUP BY 
	A.Codigo;

-- 6. Liste todos os clientes que pagaram mais de R$ 100,00 em serviços. (não tá completa)
SELECT
	C.Codigo AS 'Código',
	C.Nome,
	CONCAT('R$ ', FORMAT(SUM(S.Preco), 2)) AS 'Gasto com Serviços'
FROM Clientes AS C
INNER JOIN Agendamentos AS A
	ON C.Codigo = A.Cliente_Codigo
INNER JOIN Servicos AS S
	ON A.Servico_Codigo = S.Codigo
WHERE
	(
    SELECT 
		SUM(Preco) 
	FROM Servicos AS Se 
	INNER JOIN Agendamentos AS Ag 
		ON Se.Codigo = Ag.Servico_Codigo 
	INNER JOIN Clientes AS Cl 
		ON Ag.Cliente_Codigo = Cl.Codigo 
	WHERE 
		Cl.Codigo = C.Codigo
	) > 100
GROUP BY 
	C.Codigo;

-- 7. Encontre os veículos fabricados antes de 2010.
SELECT
	Placa,
	Marca,
	Modelo,
	Ano
FROM Veiculos
WHERE
	Ano < 2010;

-- 8. Liste todos os serviços com preços maiores que R$ 50,00 usando o operador de igualdade.
SELECT 
	Codigo AS 'Código',
	Servico AS 'Serviço',
	CONCAT('R$ ', FORMAT(Preco, 2)) AS 'Preço'
FROM Servicos
WHERE
	(Preco > 50) = True
ORDER BY
	Codigo;

-- 9. Encontre os agendamentos que foram agendados para veículos de clientes com avaliações igual ou maior que 4.
SELECT
	Ag.Codigo AS 'Código do Agendamento',
	Ag.DataAgendamento AS 'Data Agendada',
	S.Servico AS 'Serviço',
	C.Nome AS 'Cliente',
	CONCAT(V.Marca, ' ', V.Modelo, ' ', V.Ano, ' (', V.Placa, ')') AS 'Veículo',
	Av.Nota AS 'Nota',
	IFNULL(Av.Comentario, 'Avaliação realizada sem comentário') AS 'Comentário'
	FROM Agendamentos AS Ag
INNER JOIN Servicos AS S
	ON Ag.Servico_Codigo = S.Codigo
INNER JOIN Clientes AS C
	ON Ag.Cliente_Codigo = C.Codigo
INNER JOIN Veiculos AS V
	ON Ag.Veiculos_Codigo = V.Codigo
INNER JOIN Avaliacoes AS Av
	ON Ag.Codigo = Av.Agendamento_Codigo
WHERE
	Av.Nota >= 4
GROUP BY
	Ag.Codigo
ORDER BY
	Ag.Codigo ASC;

-- 10. Selecione os clientes que agendaram serviços para mais de um veículo usando o operador lógico OR.
SELECT
	C.Codigo AS 'Código',
	C.Nome AS 'Clientes que agendaram para mais de um veículo'
FROM Clientes AS C
INNER JOIN Veiculos AS V
	ON C.Codigo = V.Cliente_Codigo
INNER JOIN Agendamentos AS A
	ON C.Codigo = A.Cliente_Codigo
WHERE
	(
	SELECT 
		COUNT(DISTINCT Ve.Codigo) 
	FROM Agendamentos AS Ag 
	INNER JOIN Veiculos AS Ve 
		ON Ag.Veiculos_Codigo = Ve.Codigo 
	WHERE 
		Ag.Cliente_Codigo = C.Codigo
	) >= 2
GROUP BY
	C.Codigo;

-- 11. Liste os clientes que pagaram em dinheiro ou com cartão de crédito usando o operador lógico OR.
SELECT
	C.Codigo AS 'Código',
	C.Nome AS 'Clientes que pagaram com dinheiro/cartão de crédito'
FROM Clientes AS C
INNER JOIN Agendamentos AS A
	ON C.Codigo = A.Cliente_Codigo
INNER JOIN Pagamentos AS P
	ON A.Codigo = P.Agendamento_Codigo
INNER JOIN TiposPagamento AS TP
	ON P.TipoPagamento_Codigo = TP.Codigo
WHERE
	TP.Codigo = 1 OR
	TP.Codigo = 2
GROUP BY
	C.Codigo
ORDER BY
	C.Nome ASC;
 
-- 12. Encontre os veículos fabricados entre os anos de 2015 e 2020 usando o operador lógico AND.
SELECT
	Codigo AS 'Código',
	Placa AS 'Placa',
	CONCAT(Marca, ' ', Modelo) AS 'Veículo',
	Ano AS 'Ano de fabricação'
FROM Veiculos
WHERE
	Ano BETWEEN 2015 AND 2020
GROUP BY
	Codigo
ORDER BY
	Marca ASC;

-- 13. Liste os agendamentos feitos para serviços com preços iguais ou menores que R$ 30,00.
SELECT
	Ag.Codigo AS 'Código do Agendamento',
	Ag.DataAgendamento AS 'Data Agendada',
	S.Servico AS 'Serviço',
	CONCAT('R$ ', FORMAT(S.Preco, 2)) AS 'Preço',
	C.Nome AS 'Cliente',
	CONCAT(V.Marca, ' ', V.Modelo, ' ', V.Ano, ' (', V.Placa, ')') AS 'Veículo',
	Av.Nota AS 'Nota',
	IFNULL(Av.Comentario, 'Avaliação realizada sem comentário') AS 'Comentário'
	FROM Agendamentos AS Ag
INNER JOIN Servicos AS S
	ON Ag.Servico_Codigo = S.Codigo
INNER JOIN Clientes AS C
	ON Ag.Cliente_Codigo = C.Codigo
INNER JOIN Veiculos AS V
	ON Ag.Veiculos_Codigo = V.Codigo
INNER JOIN Avaliacoes AS Av
	ON Ag.Codigo = Av.Agendamento_Codigo
WHERE
	S.Preco <= 30
GROUP BY
	Ag.Codigo
ORDER BY
	Ag.Codigo ASC;

-- 14. Encontre os clientes que agendaram serviços para veículos fabricados após 2010 e que pagaram mais de R$ 80,00.
SELECT
	Ag.Codigo AS 'Código do Agendamento',
	Ag.DataAgendamento AS 'Data Agendada',
	S.Servico AS 'Serviço',
	CONCAT('R$ ', FORMAT(S.Preco, 2)) AS 'Preço',
	C.Nome AS 'Cliente',
	CONCAT(V.Marca, ' ', V.Modelo, ' ', V.Ano, ' (', V.Placa, ')') AS 'Veículo',
	Av.Nota AS 'Nota',
	IFNULL(Av.Comentario, 'Avaliação realizada sem comentário') AS 'Comentário'
	FROM Agendamentos AS Ag
INNER JOIN Servicos AS S
	ON Ag.Servico_Codigo = S.Codigo
INNER JOIN Clientes AS C
	ON Ag.Cliente_Codigo = C.Codigo
INNER JOIN Veiculos AS V
	ON Ag.Veiculos_Codigo = V.Codigo
INNER JOIN Avaliacoes AS Av
	ON Ag.Codigo = Av.Agendamento_Codigo
WHERE
	V.Ano > 2010 AND
	S.Preco > 80
GROUP BY
	Ag.Codigo
ORDER BY
	Ag.Codigo ASC;

-- 15. Selecione os veículos com placas que começam com as letras "ABC" ou "XYZ" usando o operador lógico OR.
SELECT
	Codigo AS 'Código',
	Placa AS 'Placa',
	CONCAT(Marca, ' ', Modelo) AS 'Veículo',
	Ano AS 'Ano de fabricação'
FROM Veiculos
WHERE
	Placa LIKE 'ABC%' OR
    Placa LIKE 'XYZ%'
GROUP BY
	Codigo
ORDER BY
	Marca ASC;

-- 16. Liste os agendamentos que foram feitos para serviços com preços menores que R$ 40,00 ou que foram agendados para veículos fabricados antes de 2015 usando o operador lógico OR.
SELECT
	Ag.Codigo AS 'Código do Agendamento',
	Ag.DataAgendamento AS 'Data Agendada',
	S.Servico AS 'Serviço',
	CONCAT('R$ ', FORMAT(S.Preco, 2)) AS 'Preço',
	C.Nome AS 'Cliente',
	CONCAT(V.Marca, ' ', V.Modelo, ' ', V.Ano, ' (', V.Placa, ')') AS 'Veículo',
	Av.Nota AS 'Nota',
	IFNULL(Av.Comentario, 'Avaliação realizada sem comentário') AS 'Comentário'
	FROM Agendamentos AS Ag
INNER JOIN Servicos AS S
	ON Ag.Servico_Codigo = S.Codigo
INNER JOIN Clientes AS C
	ON Ag.Cliente_Codigo = C.Codigo
INNER JOIN Veiculos AS V
	ON Ag.Veiculos_Codigo = V.Codigo
INNER JOIN Avaliacoes AS Av
	ON Ag.Codigo = Av.Agendamento_Codigo
WHERE
	S.Preco < 40 OR
    V.Ano < 2015
GROUP BY
	Ag.Codigo
ORDER BY
	Ag.Codigo ASC;