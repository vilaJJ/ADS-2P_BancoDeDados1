/*
Juan Felipe Alves Flores
2023-12-01
*/

-- Inserindo dados

INSERT INTO ProdutosCategoria(Nome) VALUES
('Girassóis'),
('Rosas');

INSERT INTO StatusPedido(Nome) VALUES
('Pendente'),
('Processando'),
('Enviado'),
('Entregue'),
('Cancelado');

/*
(a) Insira um novo produto com o nome "Rosa Vermelha", 
descrição "Uma rosa vermelha de alta qualidade", preço R$ 20, 
categoria "Rosas" e quantidade disponível em estoque 50.
*/

INSERT INTO Produtos(Categoria_Codigo, Nome, Descricao, Preco) VALUES
(2, 'Rosa Vermelha', 'Uma rosa vermelha de alta qualidade', 20);

INSERT INTO Estoque(Produto_Codigo, Quantidade) VALUES
(1, 50);

/*
(b) Insira um novo cliente com o nome "Maria Silva", 
endereço "Rua das Flores, 123", endereço de e-mail "maria@email.com" 
e número de telefone "(11) 1234-5678".
*/

INSERT INTO Clientes(Nome, Endereco, EnderecoEmail, NumeroTelefone) VALUES
('Maria Silva', 'Rua das Flores, 123', 'maria@gmail.com', '+55 (11) 91234-5678');

/*
(c) Faça um pedido para o cliente Maria Silva, 
incluindo 3 unidades do produto "Rosa Vermelha", 
com um preço total de R$ 60 e status "pendente".
*/

INSERT INTO Pedidos(Cliente_Codigo, Status_Codigo, DataPedido, QuantidadeItens, PrecoTotal) VALUES
(1, 1, '2023-11-26 12:41:22', 3, 60);
INSERT INTO ItensPedido(Pedido_Codigo, Produto_Codigo, Quantidade) VALUES 
(1, 1, 3);
UPDATE Estoque SET Quantidade = Quantidade - 3 WHERE Produto_Codigo = 1;

/*
(d) Insira pelo menos dois registros em cada uma das tabelas criadas.
*/

INSERT INTO ProdutosCategoria(Nome) VALUES
('Cactos'),
('Orquídeas'),
('Arranjos Florais');

INSERT INTO Produtos(Categoria_Codigo, Nome, Descricao, Preco) VALUES
(1, 'Girassóis de Van Gogh', 'Incrivéis girassóis do lendário Van Gogh', 50),
(2, 'Rosa charmosa', 'Uma fragância excepcional', 65);

INSERT INTO Estoque(Produto_Codigo, Quantidade) VALUES
(2, 150),
(3, 100);

INSERT INTO Clientes(Nome, Endereco, EnderecoEmail, NumeroTelefone) VALUES
('Juan Felipe Alves Flores', 'Rua das Mandevillas, 549', 'juan.flores@gmail.com', '+55 (63) 99016-4890'),
('Bárbara Ohana Santos Silva', 'Rua da Liberdade, 164', 'babi.ohana@gmail.com', '+55 (63) 99103-8921');

INSERT INTO StatusPedido(Nome) VALUES
('Extraviado'),
('Danificado');

INSERT INTO Pedidos(Cliente_Codigo, Status_Codigo, DataPedido, QuantidadeItens, PrecoTotal) VALUES
(2, 3, '2023-12-03 09:02:41', 5, 250),
(3, 2, '2023-10-22 17:52:32', 4, 260);

INSERT INTO ItensPedido(Pedido_Codigo, Produto_Codigo, Quantidade) VALUES
(2, 2, 5),
(3, 3, 4);

UPDATE Estoque SET Quantidade = Quantidade - 5 WHERE Produto_Codigo = 2;
UPDATE Estoque SET Quantidade = Quantidade - 4 WHERE Produto_Codigo = 3;

INSERT INTO TiposPagamento(Nome) VALUES
('Dinheiro'),
('Pix');

INSERT INTO Pagamentos(TiposPagamento_Codigo, Pedido_Codigo, Pagamento) VALUES
(1, 1, null),
(1, 2, '2023-12-01 21:40:12'),
(1, 3, '2023-12-01 21:47:48');