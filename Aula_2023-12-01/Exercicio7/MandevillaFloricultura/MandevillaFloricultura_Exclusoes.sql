/*
Juan Felipe Alves Flores
2023-12-01
*/

/*
Questão 3: Exclusão de Registros
Escreva consultas SQL para realizar as seguintes exclusões:
*/

-- (a) Exclua o cliente com o nome "João Oliveira" do banco de dados.
DELETE FROM Clientes WHERE Nome = 'João Oliveira';

-- (b) Exclua todos os pedidos com o status "cancelado".
DELETE FROM ItensPedido WHERE Pedido_Codigo IN(SELECT Codigo FROM Pedidos WHERE Status_Codigo = 5);
DELETE FROM Pedidos WHERE Status_Codigo = 5;

-- (c) Exclua o produto com o nome "Girassol" do banco de dados.
DELETE FROM Estoque WHERE Produto_Codigo IN(SELECT Codigo FROM Produtos WHERE Nome = 'Girassol');
DELETE FROM Produtos WHERE Nome = 'Girassol';