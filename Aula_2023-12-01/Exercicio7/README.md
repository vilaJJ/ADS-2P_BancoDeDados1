# Exercício de Banco de Dados MySQL - Floricultura Online (Exercício 07 - 2° bimestre)

INSTITUTO FEDERAL DO TOCANTINS - CAMPUS ARAGUAÍNA

01 de dezembro de 2023, sexta-feira

Estudante: Juan Felipe Alves Flores

Turma: 2° Período ADS

Professor: Gilvan Viera Moura

Disciplina: Banco de Dados I

---

### Situação Problemática:

Uma floricultura online deseja modernizar seu sistema de gerenciamento de produtos, pedidos e clientes para atender às crescentes demandas de seus clientes e melhorar a eficiência de suas operações. Eles desejam criar um banco de dados para armazenar todas as informações relevantes. Aqui está como a floricultura deveria funcionar:

1. **Cadastro de Produtos**: A floricultura oferece uma variedade de produtos, como flores, plantas, arranjos florais e acessórios. Cada produto possui um nome, descrição, preço, categoria e quantidade disponível em estoque.

2. **Cadastro de Clientes**: Os clientes podem criar contas online fornecendo informações como nome, endereço, endereço de e-mail e número de telefone. Cada cliente deve ter um ID único.

3. **Pedidos**: Os clientes podem navegar pelos produtos, adicioná-los ao carrinho e fazer pedidos. Cada pedido deve estar associado a um cliente específico e conter informações sobre os produtos, a quantidade, o preço total, o endereço de entrega e o status do pedido (pendente, processando, enviado, entregue, cancelado, etc.).

4. **Estoque**: O sistema deve rastrear o estoque de cada produto. Quando um pedido é feito, a quantidade de produtos correspondente deve ser deduzida do estoque.

5. **Pagamento**: Os clientes podem pagar pelos produtos usando métodos de pagamento, como cartões de crédito, débito ou PayPal.

### Exercício

**Questão 1: Criação do Banco de Dados**
- Crie um esquema de banco de dados relacional para atender às necessidades da floricultura online com tabelas para produtos, clientes e pedidos. Certifique-se de incluir os campos relevantes em cada tabela e defina as chaves primárias.

**Questão 2: Inserção de Registros**
- Escreva uma consulta SQL para inserir os seguintes registros no banco de dados:

    (a) Insira um novo produto com o nome "Rosa Vermelha", descrição "Uma rosa vermelha de alta qualidade", preço R$ 20, categoria "Rosas" e quantidade disponível em estoque 50.

    (b) Insira um novo cliente com o nome "Maria Silva", endereço "Rua das Flores, 123", endereço de e-mail "maria@email.com" e número de telefone "(11) 1234-5678".

    (c) Faça um pedido para o cliente Maria Silva, incluindo 3 unidades do produto "Rosa Vermelha", com um preço total de R$ 60 e status "pendente".

    (d) Insira pelo menos dois registros em cada uma das tabelas criadas.

**Questão 3: Exclusão de Registros**
- Escreva consultas SQL para realizar as seguintes exclusões:

    (a) Exclua o cliente com o nome "João Oliveira" do banco de dados.

    (b) Exclua todos os pedidos com o status "cancelado".

    (c) Exclua o produto com o nome "Girassol" do banco de dados.

**Questão 4: Atualização de Registros**
- Escreva consultas SQL para realizar as seguintes atualizações:

    (a) Atualize o endereço do cliente com o nome "Maria Silva" para "Avenida das Rosas, 456".

    (b) Atualize o status de todos os pedidos do cliente com o ID 101 para "entregue".

    (c) Atualize o preço do produto com o nome "Orquídea" para R$ 30.

**Questão 5: Seleção de Dados**
- Escreva consultas SQL para responder às seguintes perguntas:

    (a) Selecione todos os produtos na categoria "Arranjos Florais" com um preço superior a R$ 50.

    (b) Liste todos os clientes que fizeram pedidos nos últimos 30 dias.

    (c) Mostre todos os pedidos com status "pendente" e os produtos associados a cada pedido.

---

Data: 17 de novembro de 2023 (2023-11-17)