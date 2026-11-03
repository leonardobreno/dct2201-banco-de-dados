-- Povoamento adicional do banco biblioteca
-- Tarefa 03 - Docker e SGBD
-- Pré-requisito: autores de ID 1 a 4 e livros de ID 1 a 5 já cadastrados.
-- Este script adiciona 10 autores e 25 livros.
-- Os IDs dos autores são gerados automaticamente; os livros usam os IDs 5 a 14.

INSERT INTO biblioteca.autores (nome, pais, ano_nascimento) VALUES
('Jorge Amado', 'Brasil', 1912),
('José Saramago', 'Portugal', 1922),
('Agatha Christie', 'Inglaterra', 1890),
('George Orwell', 'Inglaterra', 1903),
('Franz Kafka', 'Áustria-Hungria', 1883),
('Virginia Woolf', 'Inglaterra', 1882),
('Ernest Hemingway', 'Estados Unidos', 1899),
('Mary Shelley', 'Inglaterra', 1797),
('Aldous Huxley', 'Inglaterra', 1894),
('Lima Barreto', 'Brasil', 1881);

INSERT INTO biblioteca.livros
    (titulo, ano_publicacao, preco, autor_id)
VALUES
('Capitães da Areia', 1937, 42.90, 5),
('Gabriela, Cravo e Canela', 1958, 49.90, 5),
('Ensaio sobre a Cegueira', 1995, 54.90, 6),
('O Evangelho Segundo Jesus Cristo', 1991, 59.90, 6),
('Assassinato no Expresso do Oriente', 1934, 39.90, 7),
('E Não Sobrou Nenhum', 1939, 44.90, 7),
('1984', 1949, 45.90, 8),
('A Revolução dos Bichos', 1945, 34.90, 8),
('A Metamorfose', 1915, 29.90, 9),
('O Processo', 1925, 39.90, 9),
('Mrs. Dalloway', 1925, 37.90, 10),
('Ao Farol', 1927, 42.90, 10),
('O Velho e o Mar', 1952, 32.90, 11),
('Por Quem os Sinos Dobram', 1940, 52.90, 11),
('Frankenstein', 1818, 35.90, 12),
('O Último Homem', 1826, 46.90, 12),
('Admirável Mundo Novo', 1932, 48.90, 13),
('A Ilha', 1962, 43.90, 13),
('Triste Fim de Policarpo Quaresma', 1915, 31.90, 14),
('Recordações do Escrivão Isaías Caminha', 1909, 36.90, 14),
('Tenda dos Milagres', 1969, 47.90, 5),
('A Jangada de Pedra', 1986, 51.90, 6),
('O Misterioso Caso de Styles', 1920, 38.90, 7),
('Na Pior em Paris e Londres', 1933, 41.90, 8),
('Carta ao Pai', 1919, 27.90, 9);

-- Conferência: devem existir 14 autores e 30 livros no total.
SELECT COUNT(*) AS total_autores FROM biblioteca.autores;
SELECT COUNT(*) AS total_livros FROM biblioteca.livros;
