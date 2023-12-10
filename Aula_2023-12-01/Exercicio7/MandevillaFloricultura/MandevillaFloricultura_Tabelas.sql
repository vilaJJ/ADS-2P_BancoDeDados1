/*
Juan Felipe Alves Flores
2023-12-01
*/

-- Criando tabelas

CREATE TABLE ProdutosCategoria(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL
);

CREATE TABLE Produtos(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Categoria_Codigo INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Descricao TEXT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(Categoria_Codigo) REFERENCES ProdutosCategoria(Codigo)
);

CREATE TABLE Estoque(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Produto_Codigo INT NOT NULL UNIQUE,
    Quantidade DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(Produto_Codigo) REFERENCES Produtos(Codigo)
);

CREATE TABLE Clientes(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(200) NULL,
    EnderecoEmail VARCHAR(320) NULL,
    NumeroTelefone VARCHAR(20) NULL
);

CREATE TABLE StatusPedido(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Pedidos(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_Codigo INT NOT NULL,
    Status_Codigo INT NOT NULL,
    DataPedido DATETIME NOT NULL,
    QuantidadeItens INT NOT NULL,
    PrecoTotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(Cliente_Codigo) REFERENCES Clientes(Codigo),
    FOREIGN KEY(Status_Codigo) REFERENCES StatusPedido(Codigo)
);

CREATE TABLE ItensPedido(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Pedido_Codigo INT NOT NULL,
    Produto_Codigo INT NOT NULL,
    Quantidade INT NOT NULL,
    FOREIGN KEY(Pedido_Codigo) REFERENCES Pedidos(Codigo),
    FOREIGN KEY(Produto_Codigo) REFERENCES Produtos(Codigo)
);

CREATE TABLE TiposPagamento(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL
);

CREATE TABLE Pagamentos(
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    TiposPagamento_Codigo INT NOT NULL,
    Pedido_Codigo INT NOT NULL UNIQUE,
    Pagamento DATETIME NULL,
    FOREIGN KEY(TiposPagamento_Codigo) REFERENCES TiposPagamento(Codigo),
    FOREIGN KEY(Pedido_Codigo) REFERENCES Pedidos(Codigo)
);