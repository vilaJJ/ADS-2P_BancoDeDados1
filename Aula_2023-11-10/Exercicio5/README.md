# Exercício de Banco de Dados MySQL - Sistema de Gerenciamento de Serviço do Streaming de Vídeo (Exercício 05 - 2° bimestre)

<p>INSTITUTO FEDERAL DO TOCANTINS - CAMPUS ARAGUAÍNA</p>
<p>10 de novembro de 2023, sexta-feira</p>
<p>Estudante: Juan Felipe Alves Flores</p>
<p>Turma: 2° Período ADS</p>
<p>Professor: Gilvan Viera Moura</p>
<p>Disciplina: Banco de Dados I</p>

<hr></hr>

<p>Observação: O trabalho poderá ser desenvolvido em dupla, cada um deverá realiza sua entrega no ambiente google sala de aula, quando trabalho for desenvolvido em dupla o mesmo deverá conter nome da dupla.

 Só será aceito arquivo no formato (*.sql) com todos arquivo geração solução do problemas.</p>

<hr></hr>

### Situação Problemática: Sistema de Locadora Online

<p>
Você foi contratado para desenvolver um sistema de locadora online chamado "StreamFlix". O StreamFlix permitirá que os usuários se inscrevam, naveguem pelo catálogo de filmes e séries disponíveis, adicionem itens à sua lista de reprodução, classifiquem os conteúdos e acompanhem seu histórico de visualização. 

Além disso, o sistema deve armazenar informações sobre os usuários, os títulos disponíveis e suas interações com a plataforma.

</p>

### Requisitos do Banco de Dados

<p>

1. Deve haver uma tabela para armazenar informações dos usuários, incluindo nome, email, senha (armazenada de forma segura, por exemplo, com hash) e data de registro.

2. Deve haver uma tabela para armazenar informações sobre os títulos disponíveis na locadora, como título, descrição, ano de lançamento, classificação etária e gênero.

3. Os usuários devem ser capazes de criar listas de reprodução, portanto, deve haver uma tabela que relacione os usuários com os títulos que eles adicionaram às suas listas de reprodução.

4. Deve haver uma tabela para registrar o histórico de visualização dos usuários, incluindo o título visualizado e a data da visualização.

5. Os usuários devem ser capazes de classificar os títulos, portanto, deve haver uma tabela para armazenar as classificações dos títulos.

6. Certifique-se de usar chaves estrangeiras quando necessário para manter a integridade referencial do banco de dados, vinculando as tabelas adequadamente.

</p>

<hr></hr>

### Consultas para Prática:

<p>

_Certifique-se de que eles tenham inserido pelo menos 5 registros em cada tabela antes de começar a praticar as consultas._

</p>

1. Selecione todos os usuários registrados.

2. Selecione todos os títulos disponíveis que foram lançados após 2020.

3. Encontre o título com a classificação etária mais alta.

4. Encontre o título com a classificação etária mais baixa.

5. Selecione todos os usuários que se registraram após 1º de janeiro de 2023.

6. Selecione todos os títulos com classificação etária igual a 'PG-13' ou 'R'.

7. Encontre o título mais antigo disponível.

8. Selecione todos os títulos adicionados à lista de reprodução do usuário com ID igual a 3.

9. Selecione todos os títulos visualizados pelo usuário com ID igual a 2.

10. Atualize a classificação do título com ID igual a 1 para 4 estrelas.

11. Atualize o nome do usuário com ID igual a 5 para 'Novo Nome'.

12. Selecione todos os títulos com classificação igual ou superior a 4 estrelas que foram lançados entre 2020 e 2022 ou têm uma classificação etária de 'R'.

<hr></hr>

<p>

**Observação: O trabalho poderá ser desenvolvido em dupla, cada um deverá realiza sua entrega no ambiente google sala de aula, quando trabalho for desenvolvido em dupla o mesmo deverá conter nome da dupla. _Só será aceito arquivo no formato (*.sql) com todos arquivo geração solução do problemas._**

</p>

<p>Data: 10 de novembro de 2023 (2023-11-10)<p>
