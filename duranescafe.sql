-- Criação do Banco de Dados
CREATE DATABASE DuranesCafe;
USE DuranesCafe;

-- ==========================
-- Tabela: Produtos
-- ==========================
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    bebidas VARCHAR(100),
    salgados VARCHAR(100),
    doces VARCHAR(100),
    preco DECIMAL(10,2)
);

-- Inserindo registros na tabela Produtos
INSERT INTO Produtos (bebidas, salgados, doces, preco) VALUES
('Café Latte', NULL, NULL, 7.50),
('Cappuccino', NULL, NULL, 8.00),
('Suco Natural', NULL, NULL, 6.00);

INSERT INTO Produtos (bebidas, salgados, doces, preco) VALUES
(NULL, 'Coxinha', NULL, 5.00),
(NULL, 'Empada', NULL, 4.50),
(NULL, 'Pão de Queijo', NULL, 3.50);

INSERT INTO Produtos (bebidas, salgados, doces, preco) VALUES
(NULL, NULL, 'Brownie', 6.50),
(NULL, NULL, 'Pudim', 5.50),
(NULL, NULL, 'Bolo de Cenoura', 7.00);

-- ==========================
-- Tabela: Pedidos
-- ==========================
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    forma_pagamento VARCHAR(50),
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Inserindo registros na tabela Pedidos
INSERT INTO Pedidos (nome_cliente, data_pedido, valor_total, forma_pagamento, id_produto) VALUES
('Bruna Lima', '2025-10-29', 12.50, 'Cartão', 1),
('Carlos Souza', '2025-10-29', 9.50, 'Pix', 4),
('Fernanda Alves', '2025-10-28', 13.00, 'Dinheiro', 8);
