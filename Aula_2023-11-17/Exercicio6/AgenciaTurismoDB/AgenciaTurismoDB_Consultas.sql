/* Exercício 6 - 
Exercício de Banco de Dados MySQL - Agência de Turismo (Exercício 06 - 2° bimestre)

INSTITUTO FEDERAL DO TOCANTINS - CAMPUS ARAGUAÍNA
17 de novembro de 2023, sexta-feira
Estudante: Juan Felipe Alves Flores
Turma: 2° Período ADS
Professor: Gilvan Viera Moura
Disciplina: Banco de Dados I
*/

-- Consultas

-- 7. Pelo menos duas seleções simples que recuperam todos os registros de uma tabela específica.
SELECT * FROM Estados;
SELECT * FROM Cidades;

-- 8. Pelo menos duas seleções com filtragem, utilizando a cláusula WHERE, para recuperar registros com base em critérios específicos.
SELECT * FROM Cidades WHERE Estado_Codigo = 1;
SELECT * FROM Museus WHERE PatrimonioHistorico = true;

-- 9. Pelo menos dois exemplos de uso dos operadores de comparação (por exemplo, Menor que, Maior que) em uma consulta.
SELECT * FROM RestaurantesMesas WHERE Numero > 10 AND QuantidadeCadeiras < 5;

-- 10. Pelo menos dois exemplos de uso de operadores lógicos (AND e OR) em uma consulta para filtrar registros com base em múltiplos critérios.
SELECT
    A.Nome AS 'Atração',
    DATE_FORMAT(A.DataAtracao, '%d/%m/%Y %H:%i:%s') AS 'Data e Hora',
    A.ApenasMaioresIdade AS 'Apenas 18+',
    C.Nome AS 'Casa de Show',
    C.EnderecoFisico AS 'Localização'
FROM Atracoes A
INNER JOIN CasasShow C
    ON A.CasaShow_Codigo = C.Codigo
WHERE 
    A.ApenasMaioresIdade = true AND
    (C.CapacidadeMaxima > 70 OR A.DataAtracao >= '2023-12-01');

-- 11. Qualquer outra operação ou funcionalidade que você considere relevante para demonstrar o funcionamento do banco de dados.
SELECT
    M.Nome AS 'Museu',
    FM.Nome AS 'Fundador(a)',
    DATE_FORMAT(FM.DataNascimento, '%d/%m/%Y') AS 'Data de Nascimento'
FROM Museus M
INNER JOIN FundadoresMuseus FM
    ON M.Codigo = FM.Museu_Codigo
WHERE
    YEAR(FM.DataNascimento) < 1960 AND
    M.PatrimonioHistorico = true;
