

CREATE TABLE tb_pacientes (
paciente_id INT AUTO_INCREMENT PRIMARY KEY,
nome_paciente VARCHAR(100) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
tipo_logradouro VARCHAR(25) NOT NULL,
nomeLogradouro VARCHAR(60) NOT NULL,
numero INT NOT NULL,
complemento VARCHAR(25),
telefone_paciente INT NOT NULL
);

ALTER TABLE tb_pacientes ADD COLUMN tipo_contato VARCHAR(25) NOT NULL;

CREATE TABLE tb_dentista (
dentista_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cro CHAR(8) NOT NULL UNIQUE,
especialidade VARCHAR(25) DEFAULT 'Geral',
telefone_dentista CHAR(11) NOT NULL,
tipo_contato VARCHAR(25) NOT NULL,
CONSTRAINT chk_especialidade CHECK (especialidade = 'Ortodontia' or especialidade ='Periodontia' or especialidade ='Implantodontia' OR especialidade = 'Geral')
);

DROP TABLE tb_dentista;

CREATE TABLE tb_consultas (
consulta_id INT AUTO_INCREMENT PRIMARY KEY,
`data` DATETIME NOT NULL,
tipo_consulta VARCHAR(25),
paciente_id INT,
dentista_id INT,
FOREIGN KEY (paciente_id)
REFERENCES tb_pacientes(paciente_id),
FOREIGN KEY (dentista_id)
REFERENCES tb_dentista(dentista_id)
);

ALTER TABLE tb_consultas ADD COLUMN observacao VARCHAR(200);    

DROP TABLE tb_consultas;

/* 1. Adicionar à tabela Paciente um novo atributo, chamado Cidade; */

ALTER TABLE tb_pacientes ADD COLUMN cidade VARCHAR(25) NOT NULL;

/* 5. Atualizar todos os dados, exceto nome e cro, do dentista que cuida de implantodontia, mudando sua especialidade para Geral; */

UPDATE tb_dentista SET 
especialidade = 'Geral',
telefone_dentista = 1334674858,
tipo_contato = 'Telefone Fixo'
WHERE dentista_id = 2;


/* 6. Atualizar a data e hora de uma consulta marcada com um dentista cuja especialidade é Geral */

UPDATE tb_consultas SET 
`data` = '2024-07-15 12:20:00'
WHERE consulta_id = 3;

/* 7. Atualizar a consulta do dentista de especialidade ortodontia, mudando o tipo de consulta para Tratamento e inserindo uma observação do dentista com o seguinte texto:
 “Tratamento será realizado em 10 consultas. Prioridade: Moderada. Remédio aplicado: Ponstan, caso sinta dores” */
 
UPDATE tb_consultas SET 
tipo_consulta = 'Tratamento',
observacao = '“Tratamento será realizado em 10 consultas. Prioridade: Moderada. Remédio aplicado: Ponstan, caso sinta dores”'
WHERE consulta_id = 1;

/* 8. Selecionar nome e telefone de todos os pacientes que residem em Santos, em ordem alfabética */

SELECT nome_paciente AS 'Pacientes',  telefone_paciente AS 'Contato' FROM tb_pacientes WHERE cidade = 'Santos' ORDER BY nome_paciente ASC;


/* 9. Selecionar o nome dos dentistas, a datas da consulta, o nome do paciente e seu telefone, APENAS dos dentistas que possuem consultas */

SELECT D.nome AS 'Dentista', C.`data` AS 'Data e Horas', P.nome_paciente AS 'Pacientes', P.telefone_paciente AS 'Contato do Paciente'  FROM tb_dentista AS D 
INNER JOIN tb_consultas AS C ON D.dentista_id = C.dentista_id
INNER JOIN tb_pacientes AS P ON P.paciente_id = C.paciente_id;

/* 10. Selecionar o nome do dentista, a data da consulta e o tipo da consulta, MESMO quando os dentistas não possuam consultas */

SELECT D.nome AS 'Dentista', C.`data` AS 'Data e Horas', C.tipo_consulta AS 'Consulta' FROM tb_dentista AS D 
LEFT JOIN tb_consultas AS C ON D.dentista_id = C.dentista_id;

/* 11. Criar uma query que exiba a quantidade de dentistas que a clínica possui, agrupando-os por especialidade,
 ordenando pelo nome da especialidade de A-Z. Para isto, você utilizará o comando group by do sql. */

SELECT especialidade AS 'Especialidade', COUNT(dentista_id) AS 'Qtd. Dentista' FROM tb_dentista GROUP BY especialidade ASC;

/* 12. Criar uma query que mostre a quantidade de consultas que a clínica possui em determinado período do ano. 
Escolher um mês que retorne ao menos uma consulta, e incluir o mês como filtro. */

SELECT MONTH(`data`) AS 'Mês', COUNT(consulta_id) AS 'Quantidade' FROM tb_consultas WHERE MONTH(`data`) = 7;

/* 13. Criar uma query que traga todos os tipos de consulta, agrupadas pela quantidade. */

SELECT tipo_consulta, COUNT(consulta_id) FROM tb_consultas GROUP BY tipo_consulta;

/* 14. Criar uma query que traga o número de pacientes que a clínica possui. */

SELECT COUNT(paciente_id) AS 'Qtd. Pacientes' FROM tb_pacientes;

/* 15. Criar uma query que traga todas as consultas da especialidade implantodontia.
Deve vir na query o nome do dentista, o cro, a data da consulta e o nome do paciente, ordenados da data mais atual para a mais antiga. */

SELECT D.nome AS 'Dentista', D.cro AS 'CRO', C.`data` AS 'Data e Hora', P.nome_paciente AS 'Paciente' FROM tb_dentista AS D 
INNER JOIN tb_consultas AS C ON D.dentista_id = C.dentista_id
INNER JOIN tb_pacientes AS P ON P.paciente_id = C.paciente_id
WHERE especialidade = 'Implantodontia'
ORDER BY C.`data` ASC

/* 16. Crie uma procedure similar ao exercício 15, porém a especialidade deve ser passada como parâmetro. Execute a procedure para testar. */

CREATE PROCEDURE ps_consultaimplantodontia
(IN especialidadeBuscada VARCHAR(25))
SELECT D.nome AS 'Dentista', D.cro AS 'CRO', C.`data` AS 'Data e Hora', P.nome_paciente AS 'Paciente' FROM tb_dentista AS D 
INNER JOIN tb_consultas AS C ON D.dentista_id = C.dentista_id
INNER JOIN tb_pacientes AS P ON P.paciente_id = C.paciente_id
WHERE especialidade = especialidadeBuscada
ORDER BY C.`data` ASC;

CALL ps_consultaimplantodontia('Geral')

DROP PROCEDURE ps_consultaimplantodontia