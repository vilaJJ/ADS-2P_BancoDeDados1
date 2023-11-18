-- Criando banco de dados
CREATE DATABASE AgenciaTurismo;

-- Usando banco de dados
USE AgenciaTurismo;

-- Criando tabelas
/*
(X) -> Estados
(X) -> Cidades
(X) -> PontosTuristicos
( ) -> Museus
( ) -> FundadoresMuseus
( ) -> CasasShow
( ) -> Atracoes 
( ) -> Hoteis
( ) -> HoteisPlanos
( ) -> HoteisQuartos
( ) -> Restaurantes
( ) -> RestaurantesMenu
( ) -> RestaurantesMesas
( ) -> ReservasHoteis
( ) -> ReservasRestaurantes
*/
-- Tabela responsável por salvar o nome e sigla dos estados (UF).
CREATE TABLE Estados(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(25) NOT NULL UNIQUE,
	Sigla CHAR(2) NOT NULL UNIQUE
);

-- Tabela responsável por salvar o nome das cidades, e os estados (UF) que pertencem
CREATE TABLE Cidades(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Estado_Codigo INT NOT NULL,
	Nome VARCHAR(40) NOT NULL,
	FOREIGN KEY(Estado_Codigo) REFERENCES Estados(Codigo)
);

-- Tabela responsável por salvar os pontos turísticos, com a informação de endereço e se é um patrimônio histórico
CREATE TABLE PontosTuristicos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Cidade_Codigo INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Endereco VARCHAR(100) NOT NULL,
	PatrimonioHistorico BOOLEAN NOT NULL DEFAULT false,
	FOREIGN KEY(Cidade_Codigo) REFERENCES Cidades(Codigo)
);

CREATE TABLE Museus(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Cidade_Codigo INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Endereco VARCHAR(100) NOT NULL,
	CapacidadeMaxima INT NOT NULL,
	PatrimonioHistorico BOOLEAN NOT NULL DEFAULT false,
	FOREIGN KEY(Cidade_Codigo) REFERENCES Cidades(Codigo)
);