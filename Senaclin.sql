

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

DROP TABLE tb_consultas;

/* 1. Adicionar à tabela Paciente um novo atributo, chamado Cidade; */

ALTER TABLE tb_pacientes ADD COLUMN cidade VARCHAR(25) NOT NULL;
