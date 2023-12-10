/*
Juan Felipe Alves Flores
2023-12-01
*/

/*
Questão 4: Atualização de Registros

Escreva consultas SQL para realizar as seguintes atualizações:
*/

-- (a) Atualize o endereço do cliente com o nome "Maria Silva" para "Avenida das Rosas, 456".
UPDATE Clientes SET Endereco = 'Avenida das Rosas, 456' WHERE Nome = 'Maria Silva';

-- (b) Atualize o status de todos os pedidos do cliente com o ID 101 para "entregue".
UPDATE Pedidos SET Status_Codigo = 4 WHERE Cliente_Codigo = 101;

-- (c) Atualize o preço do produto com o nome "Orquídea" para R$ 30.
UPDATE Produtos SET Preco = 30 WHERE Nome = 'Orquídea';