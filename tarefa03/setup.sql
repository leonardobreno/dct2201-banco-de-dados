
-- Tarefa 03 - Docker e Administração de SGBD
-- Script de configuração do banco biblioteca

-- 1. Recriação do banco
DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE biblioteca;

-- 2. Criação das tabelas
CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    ano_nascimento INT
) ENGINE=InnoDB;

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    preco DECIMAL(10,2),
    autor_id INT,
    CONSTRAINT fk_livros_autores
        FOREIGN KEY (autor_id) REFERENCES autores(id)
) ENGINE=InnoDB;

CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT,
    data_emprestimo DATE,
    devolvido BOOLEAN,
    CONSTRAINT fk_emprestimos_livros
        FOREIGN KEY (livro_id) REFERENCES livros(id)
) ENGINE=InnoDB;

-- 3. Usuários da aplicação
CREATE USER IF NOT EXISTS 'app_biblioteca'@'%'
IDENTIFIED BY 'AppBiblioteca2026!';

CREATE USER IF NOT EXISTS 'consulta'@'%'
IDENTIFIED BY 'Consulta2026!';

-- 4. Permissões
GRANT SELECT, INSERT, UPDATE, DELETE
ON biblioteca.* TO 'app_biblioteca'@'%';

GRANT SELECT
ON biblioteca.* TO 'consulta'@'%';

-- 5. Dados iniciais dos autores
INSERT INTO autores (id, nome, pais, ano_nascimento) VALUES
(1, 'Machado de Assis', 'Brasil', 1839),
(2, 'Clarice Lispector', 'Ucrânia', 1920),
(3, 'Gabriel García Márquez', 'Colômbia', 1927),
(4, 'Jane Austen', 'Inglaterra', 1775),
(5, 'Jorge Amado', 'Brasil', 1912),
(6, 'José Saramago', 'Portugal', 1922),
(7, 'Agatha Christie', 'Inglaterra', 1890),
(8, 'George Orwell', 'Inglaterra', 1903),
(9, 'Franz Kafka', 'Áustria-Hungria', 1883),
(10, 'Virginia Woolf', 'Inglaterra', 1882),
(11, 'Ernest Hemingway', 'Estados Unidos', 1899),
(12, 'Mary Shelley', 'Inglaterra', 1797),
(13, 'Aldous Huxley', 'Inglaterra', 1894),
(14, 'Lima Barreto', 'Brasil', 1881);

-- 6. Dados iniciais dos livros
INSERT INTO livros (id, titulo, ano_publicacao, preco, autor_id) VALUES
(1, 'Dom Casmurro', 1899, 39.90, 1),
(2, 'Memórias Póstumas de Brás Cubas', 1881, 45.00, 1),
(3, 'A Hora da Estrela', 1977, 32.50, 2),
(4, 'Cem Anos de Solidão', 1967, 59.90, 3),
(5, 'Orgulho e Preconceito', 1813, 29.90, 4),
(6, 'Capitães da Areia', 1937, 42.90, 5),
(7, 'Gabriela, Cravo e Canela', 1958, 49.90, 5),
(8, 'Ensaio sobre a Cegueira', 1995, 54.90, 6),
(9, 'O Evangelho Segundo Jesus Cristo', 1991, 59.90, 6),
(10, 'Assassinato no Expresso do Oriente', 1934, 39.90, 7),
(11, 'E Não Sobrou Nenhum', 1939, 44.90, 7),
(12, '1984', 1949, 45.90, 8),
(13, 'A Revolução dos Bichos', 1945, 34.90, 8),
(14, 'A Metamorfose', 1915, 29.90, 9),
(15, 'O Processo', 1925, 39.90, 9),
(16, 'Mrs. Dalloway', 1925, 37.90, 10),
(17, 'Ao Farol', 1927, 42.90, 10),
(18, 'O Velho e o Mar', 1952, 32.90, 11),
(19, 'Por Quem os Sinos Dobram', 1940, 52.90, 11),
(20, 'Frankenstein', 1818, 35.90, 12),
(21, 'O Último Homem', 1826, 46.90, 12),
(22, 'Admirável Mundo Novo', 1932, 48.90, 13),
(23, 'A Ilha', 1962, 43.90, 13),
(24, 'Triste Fim de Policarpo Quaresma', 1915, 31.90, 14),
(25, 'Recordações do Escrivão Isaías Caminha', 1909, 36.90, 14),
(26, 'Tenda dos Milagres', 1969, 47.90, 5),
(27, 'A Jangada de Pedra', 1986, 51.90, 6),
(28, 'O Misterioso Caso de Styles', 1920, 38.90, 7),
(29, 'Na Pior em Paris e Londres', 1933, 41.90, 8),
(30, 'Carta ao Pai', 1919, 27.90, 9);

-- 7. Empréstimos
INSERT INTO emprestimos
    (id, livro_id, data_emprestimo, devolvido)
VALUES
(1, 1, '2026-10-01', FALSE),
(2, 2, '2026-10-05', FALSE),
(3, 3, '2026-10-10', TRUE);

-- 8. Conferência
SELECT COUNT(*) AS total_autores FROM autores;
SELECT COUNT(*) AS total_livros FROM livros;
SELECT COUNT(*) AS total_emprestimos FROM emprestimos;
