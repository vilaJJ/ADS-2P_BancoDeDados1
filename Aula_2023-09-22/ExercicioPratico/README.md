# Exercício de Banco de Dados MySQL - Cadastro de Veículos de uma Escola

<p>INSTITUTO FEDERAL DO TOCANTINS - CAMPUS ARAGUAÍNA</p>
<p>22 de setembro de 2023, sexta-feira</p>
<p>Estudante: Juan Felipe Alves Flores</p>
<p>Turma: 2° Período ADS</p>
<p>Professor: Gilvan Viera Moura</p>
<p>Disciplina: Banco de Dados I</p>

<hr></hr>

### Objetivo:

<p>
Criar um banco de dados que permita cadastrar veículos pertencentes a uma escola e vinculá-los a professores e departamentos.
</p>

<hr></hr>

### Instruções:

<p>

1. Criação das Tabelas: Crie três tabelas com as seguintes especificações:

</p>

- professores:
    - id (chave primária)
    - nome
    - email

- departamentos:
    - id (chave primária)
    - nome

- veiculos:
    - id (chave primária)
    - marca
    - modelo
    - placa
    - id_professor (chave estrangeira para a tabela de professores)
    - id_departamento (chave estrangeira para a tabela de departamentos)

<p>

2. Relacionamento:    Estabeleça um relacionamento de um para muitos entre:
- Professores e Veículos
- Departamentos e Veículos
</p>

<p>

3. Inserção de Dados:  
   Insira três registros em cada tabela, de acordo com a realidade da sua escola. Por exemplo, você pode inserir três professores, três departamentos e três veículos associando-os.
</p>
<p>

4. Entrega:  
   Gere o script SQL de criação das tabelas, estabelecimento de relacionamentos e inserção dos registros. Submeta este script no Google Sala de Aula na atividade correspondente.
</p>

<hr></hr>

### Critérios de Avaliação:

- Correção na criação das tabelas e seus atributos.
- Correção na definição dos relacionamentos.
- Adequação e correção na inserção dos registros.
- Organização e clareza do script SQL.

<hr></hr>

<p>Data: 22 de setembro de 2023 (2023-09-22)<p>