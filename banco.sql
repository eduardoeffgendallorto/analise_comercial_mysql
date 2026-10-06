CREATE DATABASE analise_comercial;

USE analise_comercial;



TABELA DE CLIENTES

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    email VARCHAR(100)
);



TABELA DE PRODUTOS

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10,2)
);


TABELA DE VENDAS

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    valor_total DECIMAL(10,2),

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


INSERINDO CLIENTES

INSERT INTO clientes (id_cliente, nome, cidade, email)
VALUES
(1, 'João Silva', 'Vila Velha', 'joao@email.com'),
(2, 'Maria Santos', 'Vitória', 'maria@email.com'),
(3, 'Carlos Oliveira', 'Serra', 'carlos@email.com'),
(4, 'Ana Costa', 'Vila Velha', 'ana@email.com'),
(5, 'Lucas Almeida', 'Cariacica', 'lucas@email.com'),
(6, 'Beatriz Souza', 'Vitória', 'beatriz@email.com'),
(7, 'Rafael Lima', 'Serra', 'rafael@email.com'),
(8, 'Juliana Martins', 'Vila Velha', 'juliana@email.com');

 PRODUTOS

INSERT INTO produtos (id_produto, nome_produto, categoria, preco)
VALUES
(1, 'Notebook', 'Informática', 3500.00),
(2, 'Mouse', 'Periféricos', 120.00),
(3, 'Teclado Mecânico', 'Periféricos', 280.00),
(4, 'Monitor 24"', 'Informática', 950.00),
(5, 'Headset', 'Periféricos', 220.00),
(6, 'Webcam', 'Periféricos', 180.00),
(7, 'SSD 1TB', 'Armazenamento', 450.00),
(8, 'Memória RAM 16GB', 'Componentes', 380.00);

INSERINDO VENDAS

INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, valor_total)
VALUES
(1, 1, 1, 1, 3500.00),
(2, 2, 2, 2, 240.00),
(3, 3, 4, 1, 950.00),
(4, 4, 3, 1, 280.00),
(5, 5, 5, 2, 440.00),
(6, 6, 7, 1, 450.00),
(7, 7, 8, 2, 760.00),
(8, 8, 6, 1, 180.00),
(9, 1, 5, 1, 220.00),
(10, 2, 1, 1, 3500.00),
(11, 3, 2, 3, 360.00),
(12, 4, 4, 2, 1900.00),
(13, 5, 7, 2, 900.00),
(14, 6, 3, 1, 280.00),
(15, 7, 1, 1, 3500.00),
(16, 8, 8, 1, 380.00),
(17, 1, 6, 2, 360.00),
(18, 2, 5, 1, 220.00),
(19, 3, 7, 1, 450.00),
(20, 4, 2, 2, 240.00);


ANÁLISES

Quantidade de vendas
SELECT COUNT(*) AS quantidade_vendas
FROM vendas;


Faturamento total
SELECT SUM(valor_total) AS faturamento_total
FROM vendas;


Maior venda
SELECT MAX(valor_total) AS maior_venda
FROM vendas;


Menor venda
SELECT MIN(valor_total) AS menor_venda
FROM vendas;


Média das vendas
SELECT AVG(valor_total) AS media_vendas
FROM vendas;


Cliente e suas vendas
SELECT 
    clientes.nome,
    vendas.id_venda,
    vendas.valor_total
FROM clientes
JOIN vendas
ON clientes.id_cliente = vendas.id_cliente;


Produto e suas vendas
SELECT
    produtos.nome_produto,
    vendas.quantidade,
    vendas.valor_total
FROM produtos
JOIN vendas
ON produtos.id_produto = vendas.id_produto;