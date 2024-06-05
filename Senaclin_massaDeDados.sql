
/* 2. Inserir 6 pacientes de forma implícita, sendo 3 de Santos, 1 de Guarujá e 2 de São Vicente; */

INSERT INTO tb_pacientes (nome_paciente, cpf, tipo_logradouro, nomeLogradouro, numero, complemento, telefone_paciente, tipo_contato, cidade)
VALUES 
('Mirela', 12345678911, 'Rua', 'Capitão casca', 48, 'Casa 2', 13998761234, 'Celular', 'Guarujá'),
('Carlos', 12345678912, 'Avenida', 'Castelo Blanco', 455,' ', 11996345872, 'Celular', 'Santos'),
('Matias', 12345678913, 'Praça', 'Árvore da Sé', 9, 'Apto. 45', 1335789514, 'Telefone fixo', 'Santos'),
('Josy', 12345678914, 'Rua', 'Monte Byakou', 55,' ', 13951357462, 'Celular', 'São Vicente'),
('Abel', 12345678915, 'Avenida', 'Mascarenha de Moraes', 4688,' ', 13986451235, 'Celular', 'Santos'),
('Lorrayne', 12345678916, 'Rua', 'Marquês Coutin', 66, 'Fundos', 1335469845, 'Telefone Fixo', 'São Vicente');

/* 3. Inserir 4 dentistas de forma explícita, sendo 1 de cada especialidade; */

INSERT INTO tb_dentista (nome, especialidade, cro, telefone_dentista, tipo_contato)
VALUES 
('Tatiane', 'Periodontia', '123456SP', 13996521466, 'Celular'),
('Guilherme', 'Implantodontia', '654321SP', 13995123546, 'Celular'),
('Matthew', 'Ortodontia' ,'369258SP', 13974532158, 'Celular');

INSERT INTO tb_dentista (nome, cro, telefone_dentista, tipo_contato)
VALUES
('Ana', '147258SP', 13992321475, 'Celular');