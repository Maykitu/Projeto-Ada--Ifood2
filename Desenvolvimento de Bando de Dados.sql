CREATE DATABASE ProjetoDados;

CREATE TABLE ProjetoDados.public.cliente(
	id_cliente SERIAL PRIMARY KEY,
	nome_cliente VARCHAR(40),
	endereco_cliente VARCHAR(50),
	contato_cliente INTEGER,
	cpf_cliente VARCHAR(11)
);

CREATE TABLE ProjetoDados.public.vendedor(
	id_vendedor SERIAL PRIMARY KEY,
	nome_vendedor VARCHAR(50) NOT NULL,
	contato_vendedor INTEGER NOT NULL,
	cpf_vendedor VARCHAR(11) NOT NULL,
	endereco_vendedor VARCHAR(50) NOT NULL
);

CREATE TABLE ProjetoDados.public.pedido(
	id_pedido SERIAL PRIMARY KEY,
	id_cliente INTEGER NOT NULL REFERENCES cliente(id_cliente),
	id_vendedor INTEGER NOT NULL REFERENCES vendedor(id_vendedor),
	total DOUBLE PRECISION NOT NULL,
	horario_venda TIMESTAMP NOT NULL
);

CREATE TABLE ProjetoDados.public.produto(
	id_produto SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	descricao VARCHAR(100),
	preco DOUBLE PRECISION NOT NULL CHECK (preco > 0),
	quantidade INTEGER NOT NULL CHECK (quantidade >= 0)
);

CREATE TABLE ProjetoDados.public.detalhesPedido(
	id_detalhes_pedido SERIAL PRIMARY KEY,
	id_produto INTEGER NOT NULL REFERENCES produto(id_produto),
	id_pedido INTEGER NOT NULL REFERENCES pedido(id_pedido),
	qntd_venda_prod INTEGER NOT NULL
);

-- 30 clientes

INSERT INTO ProjetoDados.public.cliente (nome_cliente, endereco_cliente, contato_cliente, cpf_cliente)
VALUES
	('João Silva', 'Rua das Flores, 123', 123456789, '11122233344'),
	('Maria Oliveira', 'Avenida Principal, 456', 987654321, '55566677788'),
	('Pedro Santos', 'Rua da Praia, 789', 123789456, '99988877766'),
	('Ana Souza', 'Rua do Comércio, 987', 456123789, '44433322211'),
	('Carlos Rocha', 'Avenida dos Comerciantes, 765', 321987654, '77788899900'),
	('Fernanda Costa', 'Rua dos Vendedores, 543', 654321987, '88899900011'),
	('Mariana Oliveira', 'Rua da Indústria, 234', 987654321, '11122233344'),
	('Lucas Pereira', 'Avenida dos Artistas, 876', 543219876, '22233344455'),
	('Juliana Lima', 'Rua do Comércio, 765', 876543219, '33344455566'),
	('Roberto Santos', 'Avenida Principal, 987', 234567890, '44455566677'),
	('Laura Mendes', 'Rua da Praia, 345', 789012345, '55566677788'),
	('Ricardo Silva', 'Avenida dos Comerciantes, 567', 345678901, '66677788899'),
	('Clara Oliveira', 'Rua das Lojas, 789', 901234567, '77788899900'),
	('Diego Pereira', 'Avenida dos Artistas, 123', 678901234, '88899900011'),
	('Amanda Lima', 'Rua do Comércio, 432', 345678901, '99900011122'),
	('Eduardo Costa', 'Avenida dos Vendedores, 876', 789012345, '00011122233'),
	('Sofia Santos', 'Rua da Indústria, 987', 567890123, '11122233344'),
	('Mateus Oliveira', 'Avenida Principal, 234', 890123456, '22233344455'),
	('Lara Rocha', 'Rua das Flores, 567', 456789012, '33344455566'),
	('Thiago Lima', 'Avenida dos Artistas, 876', 123456789, '44455566677'),
	('Isabela Costa', 'Rua do Comércio, 765', 234567890, '55566677788'),
	('Bruno Silva', 'Avenida dos Comerciantes, 987', 789012345, '66677788899'),
	('Camila Oliveira', 'Rua das Lojas, 123', 456789012, '77788899900'),
	('Gabriel Pereira', 'Avenida dos Vendedores, 432', 123456789, '88899900011'),
	('Luiza Lima', 'Rua da Praia, 876', 890123456, '99900011122'),
	('Lucas Santos', 'Avenida dos Artistas, 987', 567890123, '00011122233'),
	('Evelyn Costa', 'Rua do Comércio, 234', 890123456, '11122233344'),
	('Vinícius Rocha', 'Avenida dos Vendedores, 876', 345678901, '22233344455'),
	('Carolina Oliveira', 'Rua das Flores, 123', 678901234, '33344455566'),
	('Rodrigo Oliveira', 'Rua das Árvores, 567', 987654321, '33344455566');
		
SELECT *
FROM cliente;
		
-- 5 vendedores

INSERT INTO ProjetoDados.public.vendedor (nome_vendedor, contato_vendedor, cpf_vendedor, endereco_vendedor)
VALUES
    ('Carlos Pereira', 111222333, '12345678901', 'Rua Comercial, 123'),
    ('Fernanda Lima', 444555666, '98765432102', 'Avenida Vendedores, 456'),
    ('Lucas Oliveira', 777888999, '11122233344', 'Rua das Lojas, 789'),
    ('Larissa Costa', 555444333, '98765432100', 'Avenida das Vendas, 987'),
    ('Roberto Silva', 999888777, '33344455566', 'Travessa do Comércio, 234');
	
SELECT *
FROM vendedor;
	
-- 50 pedidos

INSERT INTO ProjetoDados.public.pedido (id_cliente, id_vendedor, total, horario_venda)
VALUES
    (1, 1, 100.00, '2023-12-08 12:30:00'),
    (2, 2, 75.50, '2023-12-08 14:15:00'),
    (3, 3, 120.99, '2023-12-08 15:45:00'),
    (4, 4, 45.75, '2023-12-08 17:30:00'),
    (5, 5, 89.99, '2023-12-08 18:45:00'),
    (6, 1, 55.25, '2023-12-08 20:00:00'),
    (7, 2, 33.99, '2023-12-08 22:30:00'),
    (8, 3, 120.75, '2023-12-08 23:45:00'),
    (9, 4, 67.25, '2023-12-09 09:15:00'),
    (10, 5, 150.50, '2023-12-09 10:30:00'),
    (11, 1, 45.99, '2023-12-09 12:00:00'),
    (12, 2, 89.75, '2023-12-09 14:45:00'),
    (13, 3, 25.49, '2023-12-09 16:30:00'),
    (14, 4, 30.00, '2023-12-09 18:00:00'),
    (15, 5, 110.25, '2023-12-09 19:30:00'),
    (16, 1, 60.75, '2023-12-09 21:15:00'),
    (17, 2, 48.99, '2023-12-09 23:00:00'),
    (18, 3, 75.00, '2023-12-10 09:45:00'),
    (19, 4, 92.50, '2023-12-10 11:30:00'),
    (20, 5, 110.99, '2023-12-10 13:00:00'),
    (21, 1, 78.25, '2023-12-10 15:15:00'),
    (22, 2, 55.99, '2023-12-10 17:00:00'),
    (23, 3, 40.50, '2023-12-10 19:30:00'),
    (24, 4, 67.75, '2023-12-10 21:00:00'),
    (25, 5, 98.49, '2023-12-10 22:45:00'),
    (26, 1, 120.00, '2023-12-11 10:15:00'),
    (27, 2, 35.75, '2023-12-11 12:00:00'),
    (28, 3, 80.99, '2023-12-11 14:30:00'),
    (29, 4, 65.25, '2023-12-11 16:15:00'),
    (30, 5, 50.49, '2023-12-11 18:00:00'),
    (1, 1, 75.75, '2023-12-11 20:45:00'),
    (2, 2, 110.99, '2023-12-11 22:30:00'),
    (3, 3, 48.25, '2023-12-12 09:00:00'),
    (4, 4, 90.50, '2023-12-12 10:45:00'),
    (5, 5, 67.99, '2023-12-12 12:30:00'),
    (6, 1, 32.75, '2023-12-12 14:15:00'),
    (7, 2, 55.00, '2023-12-12 16:00:00'),
    (8, 3, 78.49, '2023-12-12 18:45:00'),
    (9, 4, 120.75, '2023-12-12 20:30:00'),
    (10, 5, 95.99, '2023-12-12 22:15:00'),
    (11, 1, 40.25, '2023-12-13 09:45:00'),
    (12, 2, 60.99, '2023-12-13 11:30:00'),
    (13, 3, 85.75, '2023-12-13 13:00:00'),
    (14, 4, 42.99, '2023-12-13 15:15:00'),
    (15, 5, 110.25, '2023-12-13 17:00:00'),
    (16, 1, 75.49, '2023-12-13 18:30:00'),
    (17, 2, 90.00, '2023-12-13 20:15:00'),
    (18, 3, 55.25, '2023-12-13 22:00:00'),
    (19, 4, 38.99, '2023-12-14 09:30:00'),
    (20, 5, 70.75, '2023-12-14 11:15:00');
	
SELECT *
FROM pedido;
	
-- 20 produtos

INSERT INTO ProjetoDados.public.produto (nome, descricao, preco, quantidade)
VALUES
	('Arroz', 'Arroz integral, 1kg', 10.99, 200),
	('Feijão', 'Feijão preto, 1kg', 5.99, 150),
	('Óleo de Cozinha', 'Óleo de soja, 900ml', 8.99, 100),
	('Leite', 'Leite integral, 1 litro', 2.49, 120),
	('Café', 'Café moído, 250g', 5.99, 80),
	('Açúcar', 'Açúcar refinado, 1kg', 3.29, 100),
	('Macarrão', 'Macarrão penne, 500g', 2.99, 120),
	('Sabonete', 'Sabonete em barra, 4 unidades', 3.49, 80),
	('Shampoo', 'Shampoo anticaspa, 400ml', 7.99, 70),
	('Escova de Dentes', 'Escova de dentes média', 1.99, 150),
	('Papel Higiênico', 'Rolo de papel higiênico, 4 unidades', 4.99, 60),
	('Detergente', 'Detergente líquido, 500ml', 2.79, 90),
	('Desinfetante', 'Desinfetante de pinho, 1 litro', 4.49, 75),
	('Pão de Forma', 'Pão de forma integral, 500g', 3.49, 40),
	('Presunto', 'Presunto fatiado, 200g', 6.99, 30),
	('Queijo Mussarela', 'Queijo mussarela, 300g', 8.49, 25),
	('Biscoitos', 'Biscoitos sortidos, 500g', 4.99, 50),
	('Água Mineral', 'Água mineral sem gás, 1.5 litro', 1.99, 100),
	('Suco de Laranja', 'Suco de laranja natural, 1 litro', 5.49, 60),
	('Chocolate', 'Chocolate ao leite, 100g', 3.29, 45);
	
SELECT *
FROM produto;
	
-- 50 detalhes de pedidos

INSERT INTO ProjetoDados.public.detalhesPedido (id_produto, id_pedido, qntd_venda_prod) 
VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3),
    (4, 4, 2),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 4),
    (8, 8, 1),
    (9, 9, 2),
    (10, 10, 1),
    (11, 11, 3),
    (12, 12, 2),
    (13, 13, 1),
    (14, 14, 1),
    (15, 15, 2),
    (16, 16, 1),
    (17, 17, 3),
    (18, 18, 1),
    (19, 19, 1),
    (20, 20, 2),
    (1, 21, 3),
    (2, 22, 1),
    (3, 23, 2),
    (4, 24, 4),
    (5, 25, 1),
    (6, 26, 2),
    (7, 27, 2),
    (8, 28, 1),
    (9, 29, 3),
    (10, 30, 1),
    (11, 1, 1),
    (12, 2, 2),
    (13, 3, 3),
    (14, 4, 2),
    (15, 5, 1),
    (16, 6, 3),
    (17, 7, 2),
    (18, 8, 1),
    (19, 9, 1),
    (20, 10, 1),
    (1, 11, 2),
    (2, 12, 1),
    (3, 13, 1),
    (4, 14, 2),
    (5, 15, 3),
    (6, 16, 1),
    (7, 17, 2),
    (8, 18, 1),
    (9, 19, 1),
    (10, 20, 1);
	
SELECT *
FROM detalhespedido;
	
-- VIEWS

	-- Top 10 produtos mais vendidos

CREATE VIEW vw_top_10_produtos AS
SELECT
    p.nome,
	SUM(dp.qntd_venda_prod) AS Quantidade_Vendida
FROM detalhespedido dp
	JOIN produto p
		ON dp.id_produto = p.id_produto
GROUP BY p.nome, dp.qntd_venda_prod
ORDER BY Quantidade_Vendida DESC
LIMIT 10;

SELECT *
FROM vw_top_10_produtos;

	-- Quantidade, total, média por vendedor
	
CREATE VIEW vw_indicadores_por_vendedor AS
SELECT
    v.nome_vendedor,
    COUNT(p.id_pedido) AS total_vendas,
    SUM(p.total) AS valor_total,
    ROUND(CAST(avg(p.total) AS numeric), 2) AS media_vendas
FROM
    ProjetoDados.public.pedido p
	LEFT JOIN ProjetoDados.public.vendedor v
		ON p.id_vendedor = v.id_vendedor
GROUP BY v.id_vendedor
ORDER BY v.id_vendedor;

SELECT *
FROM vw_indicadores_por_vendedor;

	-- Top 3 clientes em valor de compra
	
CREATE VIEW vw_top_3_clientes AS
SELECT
	c.nome_cliente,
	ROUND( CAST(SUM(p.total) AS numeric), 2) as total
FROM cliente c
	JOIN pedido p
		ON c.id_cliente = p.id_cliente
GROUP BY c.nome_cliente
ORDER BY total DESC
LIMIT 3;

SELECT *
FROM vw_top_3_clientes;

	-- Total venda por vendedores

CREATE VIEW vw_total_vendas_vendedor AS
SELECT
	v.id_vendedor,
	v.nome_vendedor,
	SUM(pe.total) AS total_vendas
FROM Vendedor v
	JOIN Pedido pe
		ON v.id_vendedor = pe.id_vendedor
GROUP BY v.id_vendedor, v.nome_vendedor
ORDER BY total_vendas DESC;
		
SELECT *
FROM vw_total_vendas_vendedor;