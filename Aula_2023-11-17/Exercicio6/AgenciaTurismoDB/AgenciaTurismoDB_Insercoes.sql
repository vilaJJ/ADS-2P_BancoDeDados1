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