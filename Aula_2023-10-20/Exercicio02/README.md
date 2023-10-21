# Exercício de Banco de Dados MySQL - Sistema de Gerenciamento de Lanchonete (Exercício 02 - 2° bimestre)

<p>INSTITUTO FEDERAL DO TOCANTINS - CAMPUS ARAGUAÍNA</p>
<p>20 de outubro de 2023, sexta-feira</p>
<p>Estudante: Juan Felipe Alves Flores</p>
<p>Turma: 2° Período ADS</p>
<p>Professor: Gilvan Viera Moura</p>
<p>Disciplina: Banco de Dados I</p>

<hr></hr>

### Situação Problemática: Sistema de Gerenciamento de Lanchonete

<p>
Imaginem que vocês estão trabalhando como desenvolvedores de banco de dados em um projeto para criar um sistema de gerenciamento de lanchonete. O sistema precisa armazenar informações essenciais, como itens do menu, pedidos dos clientes, detalhes dos clientes, informações sobre os funcionários e o estoque de ingredientes. Este sistema é fundamental para manter a lanchonete funcionando sem problemas.
</p>

<hr></hr>

### Estrutura do Banco de Dados:

<p>

#### 1. Tabela: Menu
- Campos: 
    - id_menu (Chave Primária) 
    - nome_item
    - preço

</p>

<p>

#### 2. Tabela: Pedidos
- Campos: 
    - id_pedido (Chave Primária)
    - id_cliente (Chave Estrangeira)
    - id_item_menu (Chave Estrangeira)
    - quantidade
    - data_pedido
</p>

<p>

#### 3. Tabela: Clientes
- Campos: 
    - id_cliente (Chave Primária)
    - nome
    - telefone
    - email
</p>

<p>

#### 4. Tabela: Funcionários
- Campos: 
    - id_funcionario (Chave Primária)
    - nome
    - cargo
    - data_admissao

</p>

<p>

#### 5. Tabela: Estoque
- Campos: 
    - id_estoque (Chave Primária)
    - id_item_menu (Chave Estrangeira)
    - quantidade_disponivel
    - data_entrada
</p>

<hr></hr>

### Inserção de Registros (Exemplo):

<p>Tabela: Menu</p>

| id_menu     | nome_item       | preço |
|-------------|-----------------|-------|
| 1           | Hambúrguer      | 8.99  |
| 2           | Batata Frita    | 3.49  |
| 3           | Refrigerante    | 1.99  |
| 4           | Pizza           | 10.99 |
| 5           | Sundae          | 4.99  |

<p>(Continuar com inserções nas outras tabelas)</p>

<hr></hr>

### Questões de Consulta (Exemplos):
1. Recupere todos os itens do menu que possuem um preço inferior a 5.00.
2. Liste os pedidos feitos em uma data específica.
3. Encontre todos os clientes cujos nomes contenham a palavra "pizza".
4. Recupere os pedidos feitos por um cliente específico.
5. Selecione o nome e o cargo de todos os funcionários contratados após uma determinada data.
6. Localize os itens do menu com preço superior a 7.00 e com quantidade disponível em estoque.
7. Liste os clientes que fizeram pedidos de hambúrguer ou sundae.
8. Recupere os pedidos feitos por clientes com um número de telefone específico.
9. Encontre os itens do menu com uma quantidade disponível inferior a 10 unidades.
10. Liste os clientes que fizeram pedidos de pizza e batata frita na mesma transação.

<hr></hr>

<p>Data: 20 de outubro de 2023 (2023-10-20)<p>