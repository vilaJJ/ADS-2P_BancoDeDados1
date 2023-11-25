-- Criando tabelas

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

-- Tabela responsável por salvar os museus das cidades, com a informação de endereço, capacidade máxima, e se é um patrimônio histórico
CREATE TABLE Museus(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Cidade_Codigo INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Endereco VARCHAR(100) NOT NULL,
	CapacidadeMaxima INT NOT NULL,
	PatrimonioHistorico BOOLEAN NOT NULL DEFAULT false,
	FOREIGN KEY(Cidade_Codigo) REFERENCES Cidades(Codigo)
);

-- Tabela responsável por salvar os fundadores de museus das cidades, com respectivas informações pessoais
CREATE TABLE FundadoresMuseus(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Museu_Codigo INT NOT NULL,
	CidadeNatal_Codigo INT NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	DataNascimento DATE NOT NULL,
	FOREIGN KEY(Museu_Codigo) REFERENCES Museus(Codigo),
	FOREIGN KEY(CidadeNatal_Codigo) REFERENCES Cidades(Codigo)
);

-- Tabela responsável por salvar os hotéis, com a informação de endereço e telefone
CREATE TABLE Hoteis(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Cidade_Codigo INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	EnderecoFisico VARCHAR(100) NOT NULL,
	Telefone VARCHAR(20) NOT NULL,
	FOREIGN KEY(Cidade_Codigo) REFERENCES Cidades(Codigo)
);

-- Tabela responsável por salvar os quartos dos hotéis, com a sua identificação e andar
CREATE TABLE HoteisQuartos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Hotel_Codigo INT NOT NULL,
	Identificacao CHAR(5) NOT NULL,
	Andar INT NOT NULL,
	FOREIGN KEY(Hotel_Codigo) REFERENCES Hoteis(Codigo)
);

-- Tabela responsável por salvar as reservas nos hoteis, com o nome de quem reservou e a data de Check-In
CREATE TABLE ReservasHoteis(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	HotelQuarto_Codigo INT NOT NULL,
	ProprietarioReserva VARCHAR(100) NOT NULL,
	DataCheckIn DATE NOT NULL,
	FOREIGN KEY(HotelQuarto_Codigo) REFERENCES HoteisQuartos(Codigo)
);

-- Tabela responsável por salvar as informações de restaurantes, e sua localização e contatos
CREATE TABLE Restaurantes(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Cidade_Codigo INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	EnderecoFisico VARCHAR(100) NOT NULL,
	Telefone VARCHAR(20) NOT NULL,
	FOREIGN KEY(Cidade_Codigo) REFERENCES Cidades(Codigo)
);

-- Tabela responsável por salvar os itens de cada restaurante, junto com o seu valor
CREATE TABLE RestaurantesMenu(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Restaurante_Codigo INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Valor DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY(Restaurante_Codigo) REFERENCES Restaurantes(Codigo)
);

-- Tabela responsável por salvar informações das mesas dos restaurantes, e a quantidade de cadeiras
CREATE TABLE RestaurantesMesas(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Restaurante_Codigo INT NOT NULL,
	Numero INT NOT NULL,
	QuantidadeCadeiras INT NOT NULL,
	FOREIGN KEY(Restaurante_Codigo) REFERENCES Restaurantes(Codigo)
);

-- Tabela responsável por salvar as reservas nos restaurantes, com o nome de quem reservou, e a data marcada
CREATE TABLE ReservasRestaurantes(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	MesaRestaurante_Codigo INT NOT NULL,
	ProprietarioReserva VARCHAR(100) NOT NULL,
	DataReservada DATETIME NOT NULL,
	FOREIGN KEY(MesaRestaurante_Codigo) REFERENCES RestaurantesMesas(Codigo)
);

-- Tabela responsável por salvar as informações de casas de show, com informações de localização, contato e capacidade máxima
CREATE TABLE CasasShow(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Restaurante_Codigo INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	EnderecoFisico VARCHAR(100) NOT NULL,
	Telefone VARCHAR(20) NOT NULL,
	CapacidadeMaxima INT NOT NULL,
	FOREIGN KEY(Restaurante_Codigo) REFERENCES Restaurantes(Codigo)
);

-- Tabela responsável por salvar as informações de atrações, restrição de maioridade e a data.
CREATE TABLE Atracoes(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	CasaShow_Codigo INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	ApenasMaioresIdade BOOLEAN NOT NULL DEFAULT 1,
	DataAtracao DATETIME NOT NULL,
	FOREIGN KEY(CasaShow_Codigo) REFERENCES CasasShow(Codigo)
);
