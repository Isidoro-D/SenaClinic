
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

/* 4. Inserir 3 consultas, sendo 1 para o dentista que cuida de Ortodontia e 2 para o dentista cuja especialidade é Geral.
 O tipo de todas elas será Avaliação. */
 
INSERT INTO tb_consultas (`data`, tipo_consulta, paciente_id, dentista_id)
VALUES 
('2024-06-15 15:35:00', 'Avaliação', 13, 3),
('2024-06-10 10:30:00', 'Avaliação', 15, 4),
('2024-06-12 08:00:00', 'Avaliação', 18, 4);