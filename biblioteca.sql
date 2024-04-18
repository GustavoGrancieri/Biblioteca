CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE Autores (
    AutorID 	INT 			AUTO_INCREMENT 			PRIMARY KEY,
    Nome 		VARCHAR(50)		NOT NULL
);

CREATE TABLE Livros (
    LivroID 			INT 			PRIMARY KEY,
    Titulo 				VARCHAR(20)		NOT NULL,
    AutorID 			INT,
    Genero 				VARCHAR(50),
    Disponibilidade 	BOOLEAN,
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

CREATE TABLE Clientes (
    ClienteID 		INT 	PRIMARY KEY,
    Nome 			VARCHAR(50),
    Email 			VARCHAR(100)
);

CREATE TABLE Emprestimos (
    EmprestimoID 		INT 	PRIMARY KEY,
    LivroID 			INT,
    ClienteID 			INT,
    DataEmprestimo 		DATE,
    DataDevolucao 		DATE,
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Inserção de dados
INSERT INTO Autores (AutorID, Nome) VALUES
(1, 'Conan Doyle'),
(2, 'Agatha Christie'),
(3, 'Machado de assis');

INSERT INTO Livros (LivroID, Titulo, AutorID, Genero, Disponibilidade) VALUES
(1, 'Sherlock Holmes', 1, 'Mistério', TRUE),
(2, 'Assassinato no Expresso Oriente', 2, 'Mistério', TRUE),
(3, 'Dom Casmurro', 3, 'Romance', FALSE);

INSERT INTO Clientes (ClienteID, Nome, Email) VALUES
(1, 'Ana Livia', 'ana.livia@gmail.com'),
(2, 'Gustavo', 'gustavograncieri@outlook.com');

INSERT INTO Emprestimos (EmprestimoID, LivroID, ClienteID, DataEmprestimo, DataDevolucao) VALUES
(1, 1, 1, '2024-04-01', '2024-04-15'),
(2, 2, 2, '2024-04-05', NULL);

-- Consultas
-- Selecionando todos os livros disponíveis
SELECT * FROM Livros WHERE Disponibilidade = TRUE;

-- Selecionando todos os livros emprestados
SELECT * FROM Livros WHERE Disponibilidade = FALSE;

-- Selecionando todos os empréstimos em aberto
SELECT * FROM Emprestimos WHERE DataDevolucao IS NULL;

-- Selecionando todos os livros de um autor específico
SELECT * FROM Livros WHERE AutorID = 1;

-- Atualizando a disponibilidade de um livro
UPDATE Livros SET Disponibilidade = FALSE WHERE LivroID = 1;

-- Excluindo um livro
DELETE FROM Livros WHERE LivroID = 3;
