--------------------------------------------------------------------    Definicao de Dados/ DDL --------

-- CRIANDO TABELAS

CREATE TABLE professores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE turmas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    semestre VARCHAR(20),
    status VARCHAR(20) CHECK (status IN ('Ativa', 'Inativa')),
    professor_id INT REFERENCES professores(id)
);

CREATE TABLE casos_clinicos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Pendente', 'Aprovado', 'Revisao')),
    data_criacao DATE NOT NULL,
    dificuldade VARCHAR(20),
    turma_id INT REFERENCES turmas(id)
);

-- INSERT PROFESSOR

INSERT INTO professores (nome, email)
VALUES
('Dr. Carlos Mendes', 'carlos@unifsa.edu.br');


--------------------------------------------------------------------    Manipulacao de Dados / DML --------


-- INSERT TURMAS

INSERT INTO turmas (nome, semestre, status, professor_id)
VALUES
('Medicina A', '2026.1', 'Ativa', 1),
('Medicina B', '2026.1', 'Ativa', 1),
('Enfermagem A', '2026.1', 'Ativa', 1),
('Enfermagem B', '2026.1', 'Ativa', 1),
('Odontologia A', '2026.1', 'Ativa', 1),
('Fisioterapia A', '2025.2', 'Inativa', 1),
('Biomedicina A', '2026.1', 'Ativa', 1),
('Farmácia A', '2026.1', 'Ativa', 1);

-- INSERT CASOS 

INSERT INTO casos_clinicos (titulo, status, data_criacao, dificuldade, turma_id)
VALUES
('Insuficiência Cardíaca Congestiva', 'Aprovado', '2026-01-10', 'Alta', 1),
('AVC Isquêmico', 'Pendente', '2026-01-15', 'Alta', 1),
('Sepse Neonatal', 'Revisao', '2026-01-20', 'Média', 2),
('Fratura de Fêmur', 'Aprovado', '2026-01-25', 'Média', 3),

('Diabetes Mellitus Tipo 2', 'Aprovado', '2026-02-02', 'Baixa', 4),
('Asma Infantil', 'Pendente', '2026-02-05', 'Baixa', 5),
('Traumatismo Craniano', 'Revisao', '2026-02-11', 'Alta', 6),
('Pneumonia Bacteriana', 'Aprovado', '2026-02-17', 'Média', 7),

('Doença Renal Crônica', 'Pendente', '2026-03-03', 'Alta', 8),
('Hipertensão Arterial', 'Aprovado', '2026-03-06', 'Baixa', 1),
('Apendicite Aguda', 'Aprovado', '2026-03-09', 'Média', 2),
('Meningite Viral', 'Revisao', '2026-03-14', 'Alta', 3),

('Infarto Agudo do Miocárdio', 'Aprovado', '2026-03-20', 'Alta', 4),
('Anemia Falciforme', 'Pendente', '2026-03-25', 'Média', 5),
('Trombose Venosa Profunda', 'Aprovado', '2026-03-29', 'Média', 6),

('Hepatite B', 'Revisao', '2026-04-02', 'Baixa', 7),
('Bronquiolite', 'Pendente', '2026-04-07', 'Baixa', 8),
('Câncer de Mama', 'Aprovado', '2026-04-11', 'Alta', 1),
('Síndrome Metabólica', 'Aprovado', '2026-04-15', 'Média', 2),

('Lúpus Eritematoso Sistêmico', 'Pendente', '2026-04-19', 'Alta', 3),
('COVID Persistente', 'Revisao', '2026-04-23', 'Média', 4),
('Tuberculose Pulmonar', 'Aprovado', '2026-04-28', 'Alta', 5),

('Artrite Reumatoide', 'Pendente', '2026-05-02', 'Média', 6),
('Choque Séptico', 'Revisao', '2026-05-05', 'Alta', 7),
('Leucemia Aguda', 'Aprovado', '2026-05-08', 'Alta', 8),

('Obesidade Infantil', 'Pendente', '2026-05-10', 'Baixa', 1),
('Miocardite Viral', 'Aprovado', '2026-05-12', 'Alta', 2),
('Insuficiência Respiratória', 'Revisao', '2026-05-14', 'Alta', 3),

('Cetoacidose Diabética', 'Aprovado', '2026-05-16', 'Média', 4),
('Síndrome Nefrótica', 'Pendente', '2026-05-18', 'Média', 5),
('Parada Cardiorrespiratória', 'Aprovado', '2026-05-20', 'Alta', 6),

('Dermatite Atópica', 'Aprovado', '2026-05-22', 'Baixa', 7),
('Convulsão Febril', 'Revisao', '2026-05-24', 'Média', 8),
('Pancreatite Aguda', 'Pendente', '2026-05-26', 'Alta', 1),

('Fibromialgia', 'Aprovado', '2026-05-27', 'Baixa', 2),
('Hemorragia Digestiva Alta', 'Revisao', '2026-05-28', 'Alta', 3),
('Insuficiência Hepática', 'Pendente', '2026-05-29', 'Alta', 4),

('Síndrome de Guillain-Barré', 'Aprovado', '2026-05-30', 'Alta', 5),
('Doença de Crohn', 'Revisao', '2026-05-31', 'Média', 6);

--------------------------------------------------------------------  CONSULTAS / DQL -------------------------

-- TOTAL DE CASOS CRIADOS
SELECT COUNT(*) AS total_casos
FROM casos_clinicos;

-- CASOS PENDENTES
SELECT COUNT(*) AS pendentes
FROM casos_clinicos
WHERE status = 'Pendente';

--TURMAS ATIVAS
SELECT COUNT(*) AS turmas_ativas
FROM turmas
WHERE status = 'Ativa';

--MÉDIA DE CASOS POR TURMA
SELECT AVG(total) AS media
FROM (
    SELECT COUNT(*) AS total
    FROM casos_clinicos
    GROUP BY turma_id
) sub;

-- CASOS POR TURMA(barra)
SELECT t.nome, COUNT(c.id) AS total_casos
FROM turmas t
LEFT JOIN casos_clinicos c ON t.id = c.turma_id
GROUP BY t.nome
ORDER BY total_casos DESC;

-- EVOLUÇÃO TEMPORAL(linha)
SELECT DATE_TRUNC('month', data_criacao) AS mes,
       COUNT(*) AS total
FROM casos_clinicos
GROUP BY mes
ORDER BY mes ASC;

-- CASOS POR DIFICULDADE(barra horizontal)
SELECT dificuldade, COUNT(*) AS total
FROM casos_clinicos
GROUP BY dificuldade
ORDER BY total DESC;

-- CASOS POR STATUS(pizza)
SELECT status, COUNT(*) AS total
FROM casos_clinicos
GROUP BY status
ORDER BY total DESC;