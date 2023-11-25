/* Exercício 6 - 
Exercício de Banco de Dados MySQL - Agência de Turismo (Exercício 06 - 2° bimestre)

INSTITUTO FEDERAL DO TOCANTINS - CAMPUS ARAGUAÍNA
17 de novembro de 2023, sexta-feira
Estudante: Juan Felipe Alves Flores
Turma: 2° Período ADS
Professor: Gilvan Viera Moura
Disciplina: Banco de Dados I
*/

-- 6. Insira pelo menos cinco registros em cada uma das tabelas criadas na Parte 1. Certifique-se de incluir informações relevantes, como nomes de hotéis, cidades, restaurantes, pontos turísticos, fundadores de museus, etc.

-- Inserções

-- Estados
INSERT INTO Estados(Nome, Sigla) VALUES
('Tocantins', 'TO'),
('Pará', 'PA'),
('Maranhão', 'MA'),
('Goiás', 'GO'),
('Bahia', 'BA');

-- Cidades
INSERT INTO Cidades(Estado_Codigo, Nome) VALUES
(1, 'Araguaína'),
(2, 'Belém'),
(3, 'São Luís'),
(4, 'Caldas Novas'),
(5, 'Xique-Xique');

-- PontosTuristicos
INSERT INTO PontosTuristicos(Cidade_Codigo, Nome, Endereco, PatrimonioHistorico) VALUES
(1, 'Estátua da Liberdade', 'Rua dos Triângulos, n° 15, Bairro São João', true),
(2, 'Canhões de Tacacá', 'Rua das Ferroviárias, n° 418, St. Novo', true),
(3, 'O Português', 'Rua da Maçonária, n° 101, St. Abel Ferreira', false),
(4, 'Esquenta', 'Rua dos Péquis, n° 824, Lot. Alvorada', false),
(5, 'You Never Walk Alone', 'Rua dos Vermelhos, n° 6, St. Liverpool', false);

INSERT INTO Museus(Cidade_Codigo, Nome, Endereco, CapacidadeMaxima, PatrimonioHistorico) VALUES
(1, 'Museu da Cultura Local', 'Rua dos Triângulos, n° 15, Bairro São João', 30, true),
(2, 'Museu da Música Local', 'Rua das Ferroviárias, n° 418, St. Novo', 60, true),
(3, 'Museu do Trabalho Local', 'Rua da Maçonária, n° 101, St. Abel Ferreira', 25, false),
(4, 'Museu da Mineração Local', 'Rua dos Péquis, n° 824, Lot. Alvorada', 50, true),
(5, 'Museu do Xiquismo', 'Rua dos Vermelhos, n° 6, St. Liverpool', 35, false);

INSERT INTO FundadoresMuseus(Museu_Codigo, CidadeNatal_Codigo, Nome, DataNascimento) VALUES
(1, 3, 'Alberto Torres', '1957-12-14'),
(2, 5, 'Carlos de Andrade Silva', '1928-10-21'),
(3, 3, 'Virginia Fontes Belletti', '1945-05-30'),
(4, 4, 'Pedro Alves de Barbarcena', '1941-02-28'),
(5, 1, 'Oswaldo Heleno Silva', '1956-07-05');

INSERT INTO Hoteis(Cidade_Codigo, Nome, EnderecoFisico, Telefone) VALUES
(1, 'Hotel de Araguaína', 'Rua dos Triângulos, n° 15, Bairro São João', '+55 (63) 99102-5721'),
(2, 'Hotel Tacacá', 'Rua das Ferroviárias, n° 418, St. Novo', '+55 (36) 99215-1421'),
(3, 'Hotel Capim-Dourado', 'Rua da Maçonária, n° 101, St. Abel Ferreira', '+55 (41) 99215-1324'),
(4, 'Hotel Pallace', 'Rua dos Péquis, n° 824, Lot. Alvorada', '+55 (78) 99048-1044'),
(5, 'Hotel Xique-Xique', 'Rua dos Vermelhos, n° 6, St. Liverpool', '+55 (15) 99214-2108');

INSERT INTO HoteisQuartos(Hotel_Codigo, Identificacao, Andar) VALUES
(1, '102-B', 2),
(2, '190-A', 1),
(3, '058-B', 0),
(4, '458-C', 2),
(5, '105-B', 1);

INSERT INTO ReservasHoteis(HotelQuarto_Codigo, ProprietarioReserva, DataCheckIn) VALUES
(1, 'Pedro Victor de Almeida Lopes', '2023-11-25'),
(2, 'Maria Helena da Silva Cruz', '2023-12-01'),
(3, 'Eduardo Henrique Vegetti Luz', '2023-12-05'),
(4, 'Juliana Moreira Ferreira', '2023-12-09'),
(5, 'João Paulo Prado Condessa', '2023-12-11');

INSERT INTO Restaurantes(Cidade_Codigo, Nome, EnderecoFisico, Telefone) VALUES
(1, 'Restaurante de Araguaína', 'Rua dos Triângulos, n° 15, Bairro São João', '+55 (63) 99102-5721'),
(2, 'Restaurante Tacacá', 'Rua das Ferroviárias, n° 418, St. Novo', '+55 (36) 99215-1421'),
(3, 'Restaurante Capim-Dourado', 'Rua da Maçonária, n° 101, St. Abel Ferreira', '+55 (41) 99215-1324'),
(4, 'Restaurante Pallace', 'Rua dos Péquis, n° 824, Lot. Alvorada', '+55 (78) 99048-1044'),
(5, 'Restaurante Xique-Xique', 'Rua dos Vermelhos, n° 6, St. Liverpool', '+55 (15) 99214-2108');

INSERT INTO RestaurantesMenu(Restaurante_Codigo, Nome, Valor) VALUES
(1, 'Chambaril', 39.99),
(2, 'Tacacá', 28.79),
(3, 'Péqui', 24.49),
(4, 'Strogonoff de frango', 58.99),
(5, 'Baião de Três', 19.99);

INSERT INTO RestaurantesMesas(Restaurante_Codigo, Numero, QuantidadeCadeiras) VALUES
(1, 24, 4),
(2, 10, 6),
(3, 09, 8),
(4, 48, 4),
(5, 13, 2);

INSERT INTO ReservasRestaurantes(MesaRestaurante_Codigo, ProprietarioReserva, DataReservada) VALUES
(1, 'Pedro Victor de Almeida Lopes', '2023-11-25'),
(2, 'Maria Helena da Silva Cruz', '2023-12-01'),
(3, 'Eduardo Henrique Vegetti Luz', '2023-12-05'),
(4, 'Juliana Moreira Ferreira', '2023-12-09'),
(5, 'João Paulo Prado Condessa', '2023-12-11');

INSERT INTO CasasShow(Restaurante_Codigo, Nome, EnderecoFisico, Telefone, CapacidadeMaxima) VALUES
(1, '7Lounge', 'Rua dos Triângulos, n° 15, Bairro São João', '+55 (63) 99102-5721', 75),
(2, 'TelNight', 'Rua das Ferroviárias, n° 418, St. Novo', '+55 (36) 99215-1421', 100),
(3, 'Midsommar', 'Rua da Maçonária, n° 101, St. Abel Ferreira', '+55 (41) 99215-1324', 50),
(4, 'Haylander', 'Rua dos Péquis, n° 824, Lot. Alvorada', '+55 (78) 99048-1044', 60),
(5, 'FatalSeven', 'Rua dos Vermelhos, n° 6, St. Liverpool', '+55 (15) 99214-2108', 200);

INSERT INTO Atracoes(CasaShow_Codigo, Nome, ApenasMaioresIdade, DataAtracao) VALUES
(1, 'Manu Batidão', true, '2023-11-25 23:00:00'),
(2, 'Dudão AK Trovão', true, '2023-11-28 20:00:00'),
(3, 'Maurilene', false, '2023-11-30 19:00:00'),
(4, 'Pink Roses', false, '2023-12-04 19:00:00'),
(5, 'O Embaixador', true, '2023-12-09 02:00:00')