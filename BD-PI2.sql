-- ===========================================
-- ESQUEMA DE BANCO DE DADOS: SISTEMA ESCOLAR
-- ===========================================


CREATE TABLE aluno (
    matricula VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE responsavel (
    id_usuario VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE professor (
    id_usuario VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE turma (
    cod_turma VARCHAR(20) PRIMARY KEY
);

CREATE TABLE disciplina (
    cod_disciplina VARCHAR(20) PRIMARY KEY,
    grade_curricular VARCHAR(200) NOT NULL
);

CREATE TABLE tarefa (
    id_tarefa SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    cod_disciplina VARCHAR(20) NOT NULL,
    FOREIGN KEY (cod_disciplina) REFERENCES disciplina(cod_disciplina)
);

CREATE TABLE comunicacao (
    id_comunicacao SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    conteudo TEXT NOT NULL,
    id_professor VARCHAR(20),
    cod_disciplina VARCHAR(20),
    cod_turma VARCHAR(20),
    FOREIGN KEY (id_professor) REFERENCES professor(id_usuario),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplina(cod_disciplina),
    FOREIGN KEY (cod_turma) REFERENCES turma(cod_turma)
);

CREATE TABLE aluno_turma (
    matricula VARCHAR(20) NOT NULL,
    cod_turma VARCHAR(20) NOT NULL,
    PRIMARY KEY (matricula, cod_turma),
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
    FOREIGN KEY (cod_turma) REFERENCES turma(cod_turma)
);

CREATE TABLE aluno_disciplina (
    matricula VARCHAR(20) NOT NULL,
    cod_disciplina VARCHAR(20) NOT NULL,
    PRIMARY KEY (matricula, cod_disciplina),
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplina(cod_disciplina)
);

CREATE TABLE responsavel_aluno (
    id_usuario VARCHAR(20) NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_usuario, matricula),
    FOREIGN KEY (id_usuario) REFERENCES responsavel(id_usuario),
    FOREIGN KEY (matricula) REFERENCES aluno(matricula)
);

CREATE TABLE professor_disciplina (
    id_usuario VARCHAR(20) NOT NULL,
    cod_disciplina VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_usuario, cod_disciplina),
    FOREIGN KEY (id_usuario) REFERENCES professor(id_usuario),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplina(cod_disciplina)
);

CREATE TABLE turma_disciplina (
    cod_turma VARCHAR(20) NOT NULL,
    cod_disciplina VARCHAR(20) NOT NULL,
    PRIMARY KEY (cod_turma, cod_disciplina),
    FOREIGN KEY (cod_turma) REFERENCES turma(cod_turma),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplina(cod_disciplina)
);

CREATE TABLE nota (
    id_nota SERIAL PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL,
    cod_disciplina VARCHAR(20) NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplina(cod_disciplina)
);

CREATE TABLE frequencia (
    id_frequencia SERIAL PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL,
    cod_disciplina VARCHAR(20) NOT NULL,
    freq DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplina(cod_disciplina)
);