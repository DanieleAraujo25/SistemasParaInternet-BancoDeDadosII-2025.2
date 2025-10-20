-- ============================================
-- 💾 ATIVIDADE 1 - PRÁTICA DE SQL DDL
-- Disciplina: Banco de Dados II (2025.2)
-- Aluna: Daniela Caldeira Araujo
-- ============================================

-- =========================================================
-- EXERCÍCIO 1: Loja de Roupas
-- =========================================================
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0
);

-- =========================================================
-- EXERCÍCIO 2: Sistema de Biblioteca
-- =========================================================
CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INT,
    isbn VARCHAR(20) UNIQUE NOT NULL
);

-- =========================================================
-- EXERCÍCIO 3: Gestão de Projetos
-- =========================================================
CREATE TABLE projetos (
    id_projeto INT PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL,
    data_inicio DATE,
    data_fim DATE
);

-- =========================================================
-- EXERCÍCIO 4: Academia de Ginástica
-- =========================================================
CREATE TABLE alunos_academia (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(50) UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
);

-- =========================================================
-- EXERCÍCIO 5: Vendas Online
-- =========================================================
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE NOT NULL DEFAULT (CURRENT_DATE),
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- =========================================================
-- EXERCÍCIO 6: Blog de Notícias
-- =========================================================
CREATE TABLE autores (
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE posts (
    id_post INT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    conteudo TEXT NOT NULL,
    data_publicacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

-- =========================================================
-- EXERCÍCIO 7: Sistema Escolar
-- =========================================================
CREATE TABLE alunos_escola (
    matricula VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE disciplinas (
    id_disciplina INT PRIMARY KEY,
    nome_disciplina VARCHAR(50) NOT NULL,
    carga_horaria INT NOT NULL CHECK (carga_horaria >= 10)
);

CREATE TABLE matriculas (
    matricula_aluno VARCHAR(10),
    id_disciplina INT,
    PRIMARY KEY (matricula_aluno, id_disciplina),
    FOREIGN KEY (matricula_aluno) REFERENCES alunos_escola(matricula),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
);

-- =========================================================
-- EXERCÍCIO 8: Clínica Médica
-- =========================================================
CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE
);

CREATE TABLE medicos (
    crm VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

CREATE TABLE consultas (
    id_consulta INT PRIMARY KEY,
    id_paciente INT,
    crm_medico VARCHAR(15),
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (crm_medico) REFERENCES medicos(crm)
);

-- =========================================================
-- EXERCÍCIO 9: Rede Social
-- =========================================================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts_rede (
    id_post INT PRIMARY KEY,
    id_usuario INT,
    conteudo TEXT NOT NULL,
    data_post TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- =========================================================
-- EXERCÍCIO 10: Sistema de RH
-- =========================================================
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL CHECK (salario >= 0),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);
