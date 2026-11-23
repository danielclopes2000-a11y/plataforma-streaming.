
-- PLATAFORMA DE STREAMING
-- CENARIO 3

PRAGMA foreign_keys = ON;

-- 1. TABELA DE USUARIOS

CREATE TABLE Usuarios (
    id_usuario INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

-- 2. TABELA DE CATEGORIAS

CREATE TABLE Categorias (
    id_categoria INTEGER PRIMARY KEY,
    nome_categoria TEXT NOT NULL UNIQUE
);

-- 3. TABELA DE FILMES

CREATE TABLE Filmes (
    id_filme INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    sinopse TEXT,
    id_categoria INTEGER,
    FOREIGN KEY (id_categoria)
    REFERENCES Categorias(id_categoria)
);

-- 4. TABELA DE VISUALIZACOES

CREATE TABLE Visualizacoes (
    id_visualizacao INTEGER PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_filme INTEGER NOT NULL,
    data_visualizacao TEXT,
    FOREIGN KEY (id_usuario)
    REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_filme)
    REFERENCES Filmes(id_filme)
);

-- 5. INSERINDO 12 USUARIOS

INSERT INTO Usuarios VALUES
(1,'Daniel','daniel@email.com'),
(2,'Mariana','mariana@email.com'),
(3,'Pedro','pedro@email.com'),
(4,'Ana','ana@email.com'),
(5,'Lucas','lucas@email.com'),
(6,'Beatriz','beatriz@email.com'),
(7,'Gabriel','gabriel@email.com'),
(8,'Julia','julia@email.com'),
(9,'Rafael','rafael@email.com'),
(10,'Camila','camila@email.com'),
(11,'Felipe','felipe@email.com'),
(12,'Laura','laura@email.com');

-- 6. INSERINDO CATEGORIAS

INSERT INTO Categorias VALUES
(1,'Acao'),
(2,'Comedia'),
(3,'Romance'),
(4,'Ficcao Cientifica'),
(5,'Fantasia'),
(6,'Aventura'),
(7,'Animacao');

-- 7. INSERINDO 12 FILMES

INSERT INTO Filmes VALUES
(1,'Velozes e Furiosos','Filme de carros e velocidade',1),
(2,'As Branquelas','Comedia de disfarces',2),
(3,'Titanic','Historia de amor em um navio',3),
(4,'Interestelar','Viagem pelo espaco',4),
(5,'Harry Potter','Jovem estudante de magia',5),
(6,'Jogos Vorazes','Competicao de sobrevivencia',6),
(7,'Avatar','Mundo de seres azuis',4),
(8,'O Diario da Princesa','Jovem descobre ser princesa',2),
(9,'A Culpa e das Estrelas','Historia de dois jovens',3),
(10,'Jurassic Park','Parque de dinossauros',6),
(11,'O Rei Leao','Historia de um jovem leao',7),
(12,'Homem-Aranha','Heroi que protege a cidade',1);

-- 8. INSERINDO 12 VISUALIZACOES

INSERT INTO Visualizacoes VALUES
(1,1,1,'2026-11-23'),
(2,2,2,'2026-11-23'),
(3,3,3,'2026-11-23'),
(4,4,4,'2026-11-23'),
(5,5,5,'2026-11-23'),
(6,6,6,'2026-11-23'),
(7,7,7,'2026-11-23'),
(8,8,8,'2026-11-23'),
(9,9,9,'2026-11-23'),
(10,10,10,'2026-11-23'),
(11,11,11,'2026-11-23'),
(12,12,12,'2026-11-23');

-- 9. CRIANDO INDICES

CREATE INDEX idx_usuario
ON Visualizacoes(id_usuario);

CREATE INDEX idx_filme
ON Visualizacoes(id_filme);

CREATE INDEX idx_data
ON Visualizacoes(data_visualizacao);

-- 10. CONSULTA FINAL

SELECT
    Visualizacoes.id_visualizacao AS ID,
    Usuarios.nome AS Usuario,
    Filmes.titulo AS Filme,
    Categorias.nome_categoria AS Categoria,
    Visualizacoes.data_visualizacao AS Data
FROM Visualizacoes
INNER JOIN Usuarios
ON Visualizacoes.id_usuario = Usuarios.id_usuario
INNER JOIN Filmes
ON Visualizacoes.id_filme = Filmes.id_filme
INNER JOIN Categorias
ON Filmes.id_categoria = Categorias.id_categoria
ORDER BY Visualizacoes.id_visualizacao;
