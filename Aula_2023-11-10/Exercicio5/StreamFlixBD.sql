-- Criando banco
CREATE DATABASE StreamFlixBD;

-- Utilizando banco
USE StreamFlixBD;

-- Criando tabelas
CREATE TABLE Generos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE ClassificacoesEtarias(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(20) NOT NULL UNIQUE,
	IdadeMinima TINYINT NULL
);

CREATE TABLE Usuarios(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR(320) NOT NULL UNIQUE,
	Senha CHAR(32) NOT NULL,
	DataCadastro DATETIME NOT NULL
);

CREATE TABLE Titulos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	ClassificacaoEtaria_Codigo INT NOT NULL,
	Genero_Codigo INT NOT NULL,
	Nome VARCHAR(50) NOT NULL UNIQUE,
	Descricao TEXT NOT NULL,
	AnoLancamento YEAR NOT NULL,
	FOREIGN KEY(ClassificacaoEtaria_Codigo) REFERENCES ClassificacoesEtarias(Codigo),
	FOREIGN KEY(Genero_Codigo) REFERENCES Generos(Codigo)
);

CREATE TABLE HistoricoVisualizacao(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Usuario_Codigo INT NOT NULL,
	Titulo_Codigo INT NOT NULL,
	DataVisualizacao DATETIME NOT NULL,
	FOREIGN KEY(Usuario_Codigo) REFERENCES Usuarios(Codigo),
	FOREIGN KEY(Titulo_Codigo) REFERENCES Titulos(Codigo)
);

CREATE TABLE ListasReproducao(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Usuario_Codigo INT NOT NULL,
	Titulo_Codigo INT NOT NULL,
	DataAdicao DATETIME NOT NULL,
	DataVisualizacao DATETIME NULL,
	FOREIGN KEY(Usuario_Codigo) REFERENCES Usuarios(Codigo),
	FOREIGN KEY(Titulo_Codigo) REFERENCES Titulos(Codigo)
);

CREATE TABLE ClassificacoesTitulos(
	Codigo INT PRIMARY KEY AUTO_INCREMENT,
	Usuario_Codigo INT NOT NULL,
	Titulo_Codigo INT NOT NULL,
	Estrelas TINYINT NOT NULL,
	Comentario TEXT NULL,
	FOREIGN KEY(Usuario_Codigo) REFERENCES Usuarios(Codigo),
	FOREIGN KEY(Titulo_Codigo) REFERENCES Titulos(Codigo)
);

-- Inserindo valores nas tabelas
INSERT INTO Generos(Nome) VALUES
('Ação'),
('Aventura'),
('Romance'),
('Terror'),
('Comédia');

INSERT INTO ClassificacoesEtarias(Nome, IdadeMinima) VALUES
('G', null),
('PG', null),
('PG-13', 13),
('R', null),
('NC-17', 18);

INSERT INTO Usuarios(Nome, Email, Senha, DataCadastro) VALUES
('Juan Felipe Alves Flores', 'juan.flores@gmail.com', '2498c4834f479ee78342d9a02eddc54e', '2023-04-21 14:12:43'),
('Bárbara Ohana Santos Silva', 'babi.ohana@gmail.com', 'b1435883df3b678ab82da8f87827e07e', '2023-06-03 21:46:10'),
('Maria Eduarda Batista de Souza', 'madu.bastusa@gmail.com', 'c9bcfb776f8d63e42769a15f45aff41b', '2023-07-02 09:51:35'),
('Jefferson Ribeiro Vasconcelos Caralho', 'jeff.rvc@gmail.com', '9ef12fbe5d1a83d74e36bac2b64c2037', '2023-08-09 17:25:01'),
('Vitor Araújo dos Santos', 'toddyn.as@gmail.com', 'f07283536be014ba8c0c68aa1f15f683', '2023-09-11 11:20:41');

INSERT INTO Titulos(ClassificacaoEtaria_Codigo, Genero_Codigo, Nome, Descricao, AnoLancamento) VALUES
(2, 2, 'Interestelar', 'As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar.', 2014),
(3, 4, "Five Nights at Freddy's - O Pesadelo Sem Fim", "No Freddy Fazbear's Pizza, robôs animados fazem a festa das crianças durante o dia. Mas, quando chega a noite, eles se transformam em assassinos psicopatas.", 2023),
(4, 1, 'Em Ritmo de Fuga', 'O talentoso motorista de fuga Baby confia nas batidas de sua própria trilha sonora para ser o melhor que existe. A música silencia um zumbido que o perturba desde um acidente na infância. Após conhecer a mulher dos seus sonhos, ele reconhece uma oportunidade de se livrar do estilo de vida questionável e recomeçar do zero. Obrigado a trabalhar para um chefão do crime, Baby lida com a música ao mesmo tempo em que um golpe fadado ao fracasso ameaça sua vida, seu amor e sua liberdade.', 2017),
(1, 5, 'Minha Mãe É uma Peça', 'Dona Hermínia é uma senhora de meia-idade, divorciada do marido, que a trocou por uma mulher mais jovem. Hiperativa, ela não larga o pé de seus filhos Marcelina e Juliano. Um dia, após descobrir que eles a consideram chata, ela resolve sair de casa sem avisar ninguém, deixando todos preocupados. Dona Hermínia decide visitar a querida tia Zélia para desabafar suas tristezas atuais e recordar os bons tempos do passado.', 2013),
(5, 3, 'Cinquenta Tons de Cinza', 'A estudante de literatura Anastasia Steele, de 21 anos, entrevista o jovem bilionário Christian Grey, como um favor a sua colega de quarto Kate Kavanagh. Ela vê nele um homem atraente e brilhante, e ele fica igualmente fascinado por ela. Embora seja sexualmente inexperiente, Anastasia mergulha de cabeça nessa relação e descobre os prazeres do sadomasoquismo, tornando-se o objeto de submissão do enigmático Grey.', 2015);

INSERT INTO HistoricoVisualizacao(Usuario_Codigo, Titulo_Codigo, DataVisualizacao) VALUES
(3, 2, '2023-10-10 14:13:51'),
(5, 1, '2023-09-23 22:14:23'),
(1, 3, '2023-05-14 21:10:26'),
(4, 5, '2023-09-01 16:13:52'),
(2, 4, '2023-06-09 02:04:42'),
(4, 1, '2023-08-15 23:49:24'),
(1, 5, '2023-07-02 21:14:35'),
(2, 3, '2023-10-15 20:54:46'),
(5, 4, '2023-11-04 12:42:15'),
(3, 2, '2023-11-07 13:54:03');

INSERT INTO ListasReproducao(Usuario_Codigo, Titulo_Codigo, DataAdicao, DataVisualizacao) VALUES
(3, 4, '2023-09-15 21:46:14', '2023-09-26 21:41:03'),
(3, 2, '2023-09-15 21:46:35', '2023-10-01 01:42:32'),
(3, 1, '2023-09-21 14:13:41', null),
(1, 5, '2023-10-14 23:54:41', '2023-10-16 20:45:31'),
(1, 1, '2023-10-14 23:55:02', null);

INSERT INTO ClassificacoesTitulos(Usuario_Codigo, Titulo_Codigo, Estrelas, Comentario) VALUES
(3, 2, 5, 'Gostei de verdade do filme, muitos não gostaram pois não entenderam a história ou não sentiram a emoção que o filme quis passar, tem alguns defeitos claramente, como por exemplo, faltou um pouco mais de suspense em questão dos Animatronics e a cena final poderia ser mais parecido com o jogo, seria uma sensação bem mais nostalgica e impactante. Gostei muito desse lance de sonhos que o protagonista tem com as almas dos Animatronics mostrando basicamente o passado e todo dia tentando tirar dúvidas com eles sobre o sequestro do irmão. Filme nota 10/10 para min, apenas tem pequenos defeitos como todo filme baseado em jogo, mas como foi o primeiro filme do scott, acho que nos próximos 2 que ele irá fazer, ele possa aprender com os erros'),
(5, 1, 5, 'Esse é o melhor filme de ficção científica já criado na industrial cinematográfica. Assim, me fez ser fascinado pelo estudo de buracos negros estelares e supermassivos e outras áreas da física moderna. Nesse sentido, a história pode começar um pouco tímida mas garanto que ocorre um crescendo para chegar em partes muito envolventes, emocionantes e surpreendentes. Com isso, a trilha sonora desse filme é impecável e a ajuda do físico teórico Kip Thorne nos dados do roteiro e pós produção dos efeitos visuais fazem tirar o fôlego do público. Contudo, o filme Interestelar deve ser lembrado como uma obra prima da ficção científica, pois trabalhar com dados da física moderna de forma primorosa envolta de uma história emocionante e cheia de incertezas sobre a vida e o futuro da nossa espécie é o que faz o filme ser reconhecido mundialmente. Logo, será que um dia nós humanos realizaremos as viagens interestelares, manipularemos forças universais como a gravidade  ou compreenderemos o propósito dos buracos negros no universo. Portanto, são tantos questionamentos e abordagens que o filme explora que só reforça que nós humanos somos seres tão pequenos dentro de um planeta perfeito e tão desrespeitado por nós, localizado em uma galáxia dentre tantas outras formando o nosso universo infinito.'),
(5, 4, 5, 'Um dos melhores filmes de Paulo Gustavo e da trilogia Minha Mãe É Uma Peça!!! Que saudades do grande humorista e da Dona Hermínia!!!'),
(1, 3, 2, 'Achei deplorável! A história tinha potência entretanto não foi bem aproveitada. Não há desenvolvimento sobre nenhum dos tópicos da trama, sem contar com o final decepcionante. A falta de um antagonista durante grande parte da obra dificulta o envolvimento do expectador. Não recomendo, parece um filme que acaba sem fim.'),
(1, 5, 1, 'Um dos lançamentos mais badalados dos últimos tempos não justifica expectativa criada. Não há pornografia e nem mesmo erotismo. Se o roteiro de Cinquenta Tons de Cinza fosse visualizado por um cineasta do porte de um Bernardo Bertolucci teríamos um resultado no mínimo instigante, mas este não é o caso da diretora Sam Taylor. Sendo assim, o resultado é um filme ruim mesmo. Baseado em literatura lixo na mesma linha de Crepúsculo.');

