/*
Juan Felipe Alves Flores
2023-12-09
*/

/*
Questão 5: Seleção de Dados

Escreva consultas SQL para responder às seguintes perguntas:
*/

-- (a) Selecione todos os produtos na categoria "Arranjos Florais" com um preço superior a R$ 50.
SELECT 
    P.Codigo AS 'Código',
    PC.Nome AS 'Categoria',
    P.Nome AS 'Nome',
    P.Descricao AS 'Descrição',
    CONCAT('R$ ', FORMAT(P.Preco, 2)) AS 'Preço'
FROM Produtos P
INNER JOIN ProdutosCategoria PC
    ON P.Categoria_Codigo = PC.Codigo
WHERE 
    PC.Nome = 'Arranjos Florais' AND
    Preco > 50;

-- (b) Liste todos os clientes que fizeram pedidos nos últimos 30 dias.
SELECT 
    C.Codigo AS 'Código',
    C.Nome AS 'Nome',
    DATE_FORMAT(P.DataPedido, '%d/%m/%Y %H:%i:%s') AS 'Última Compra',
    C.Endereco AS 'Endereço',
    C.EnderecoEmail AS 'Endereço de Email',
    C.NumeroTelefone AS 'Número de Telefone'
FROM Clientes C
INNER JOIN Pedidos P
ON C.Codigo = P.Cliente_Codigo
WHERE
    P.DataPedido = (SELECT MAX(DataPedido) FROM Pedidos Pe WHERE Pe.Cliente_Codigo = C.Codigo) AND
    P.DataPedido BETWEEN ADDDATE(NOW(), -30) AND NOW()
ORDER BY
    C.Codigo;

-- (c) Mostre todos os pedidos com status "pendente" e os produtos associados a cada pedido.
SELECT 
    P.Codigo AS 'Código do Pedido',
    DATE_FORMAT(P.DataPedido, '%d/%m/%Y %H:%i:%s') AS 'Data do Pedido',
    C.Nome AS 'Cliente',
    SP.Nome AS 'Status do Pedido',
    Pr.Nome AS 'Produto',
    IP.Quantidade AS 'Quantidade',
    CONCAT('R$ ', FORMAT(Pr.Preco, 2)) AS 'Preço'
FROM Pedidos P 
INNER JOIN ItensPedido IP
    ON P.Codigo = IP.Pedido_Codigo
INNER JOIN Clientes C
    ON P.Cliente_Codigo = C.Codigo
INNER JOIN StatusPedido SP
    ON P.Status_Codigo = SP.Codigo
INNER JOIN Produtos Pr
    ON IP.Produto_Codigo = Pr.Codigo
WHERE
    SP.Codigo != 1
GROUP BY 
    IP.Codigo;