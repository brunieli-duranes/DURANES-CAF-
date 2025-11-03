-- Criação do Banco de Dados
CREATE DATABASE DuranesCafe;
USE DuranesCafe;

-- ==========================
-- Tabela: Categorias
-- ==========================
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

-- Inserindo registros na tabela Categorias
INSERT INTO Categorias (nome_categoria) VALUES
('Bebidas'),
('Salgados'),
('Doces');

-- ==========================
-- Tabela: Produtos
-- ==========================
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

-- Inserindo registros na tabela Produtos
INSERT INTO Produtos (nome_produto, preco, id_categoria) VALUES
('Café Latte', 7.50, 1),
('Cappuccino', 8.00, 1),
('Suco Natural', 6.00, 1),
('Coxinha', 5.00, 2),
('Empada', 4.50, 2),
('Pão de Queijo', 3.50, 2),
('Brownie', 6.50, 3),
('Pudim', 5.50, 3),
('Bolo de Cenoura', 7.00, 3);

-- ==========================
-- Tabela: Pedidos
-- ==========================
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    data_pedido DATE,
    forma_pagamento VARCHAR(50)
);

-- Inserindo registros na tabela Pedidos
INSERT INTO Pedidos (nome_cliente, data_pedido, forma_pagamento) VALUES
('Bruna Lima', '2025-10-29', 'Cartão'),
('Carlos Souza', '2025-10-29', 'Pix'),
('Fernanda Alves', '2025-10-28', 'Dinheiro');

-- ==========================
-- Tabela: Itens_Pedido
-- ==========================
CREATE TABLE Itens_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT DEFAULT 1,
    valor_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Inserindo registros na tabela Itens_Pedido
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, valor_unitario) VALUES
(1, 1, 1, 7.50),   -- Bruna comprou 1 Café Latte
(1, 4, 1, 5.00),   -- Bruna comprou 1 Coxinha
(2, 6, 2, 3.50),   -- Carlos comprou 2 Pães de Queijo
(3, 7, 1, 6.50),   -- Fernanda comprou 1 Brownie
(3, 2, 1, 8.00);   -- Fernanda comprou 1 Cappuccino
