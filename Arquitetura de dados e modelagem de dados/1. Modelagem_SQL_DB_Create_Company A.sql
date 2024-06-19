-- SQL :  CRIAÇÃO DO BANCO DE DADOS Hypera.db === Ivan Alba 28 de Maio de 2024
--BDs: Produto, Loja, Fato 

-- Criação da tabela PRODUTO

CREATE TABLE PRODUTO (
    CODIGO INT PRIMARY KEY,
    DESCRICAO VARCHAR(255) NOT NULL,
    CATEGORIA VARCHAR(255) NOT NULL,
    ATIVO_S_N CHAR(1) NOT NULL,
    PROMOVIDO_S_N CHAR(1) NOT NULL
);

-- Inserir 10 registros na tabela PRODUTO

INSERT INTO PRODUTO (CODIGO, DESCRICAO, CATEGORIA, ATIVO, PROMOVIDO) VALUES
(1, 'Dipirona', 'Analgésico', 'S', 'N'),
(2, 'Paracetamol', 'Analgésico', 'S', 'S'),
(3, 'Ibuprofeno', 'Anti-inflamatório', 'S', 'N'),
(4, 'Omeprazol', 'Antiácido', 'S', 'S'),
(5, 'Simeticona', 'Antiflatulento', 'S', 'N'),
(6, 'Loratadina', 'Antialérgico', 'S', 'S'),
(7, 'Cetirizina', 'Antialérgico', 'S', 'N'),
(8, 'Ácido Acetilsalicílico', 'Anti-inflamatório', 'S', 'S'),
(9, 'Ranitidina', 'Antiácido', 'S', 'N'),
(10, 'Dimenidrinato', 'Antiemético', 'S', 'S');

-- Criação da tabela LOJA

CREATE TABLE LOJA (
    CNPJ VARCHAR(20) PRIMARY KEY,
    CLIENTE VARCHAR(255) NOT NULL,
    ASSOCIACAO VARCHAR(255) NOT NULL,
    ATIVO_S_N CHAR(1) NOT NULL,
    UF CHAR(2) NOT NULL
);

-- Inserir registros na tabela LOJA

INSERT INTO LOJA (CNPJ, CLIENTE, ASSOCIACAO, ATIVO, UF) VALUES
('12345678000101', 'Cliente A', 'Assoc1', 'S', 'SP'),
('12345678000102', 'Cliente B', 'Assoc2', 'S', 'RJ'),
('12345678000103', 'Cliente C', 'Assoc1', 'S', 'MG'),
('12345678000104', 'Cliente D', 'Assoc3', 'S', 'BA'),
('12345678000105', 'Cliente E', 'Assoc2', 'S', 'PR'),
('12345678000106', 'Cliente F', 'Assoc1', 'N', 'SC'),
('12345678000107', 'Cliente G', 'Assoc3', 'S', 'RS'),
('12345678000108', 'Cliente H', 'Assoc2', 'N', 'PE'),
('12345678000109', 'Cliente I', 'Assoc1', 'S', 'GO'),
('12345678000110', 'Cliente J', 'Assoc3', 'S', 'ES');

-- Criação da tabela FATO

CREATE TABLE FATO (
    CODIGO_PRODUTO INT,
    CNPJ_LOJA VARCHAR(20),
    PERIODO CHAR(6),
    VOLUME INT,
    VALOR_R$ DECIMAL(10, 2),
    FOREIGN KEY (CODIGO_PRODUTO) REFERENCES PRODUTO(CODIGO),
    FOREIGN KEY (CNPJ_LOJA) REFERENCES LOJA(CNPJ)
);

-- Inserir registros na tabela FATO

INSERT INTO FATO (CODIGO_PRODUTO, CNPJ_LOJA, PERIODO, VOLUME, VALOR) VALUES
    (1, '12345678000101', '202401', 100, 500.00),
    (2, '12345678000102', '202401', 150, 750.00),
    (3, '12345678000103', '202402', 200, 1000.00),
    (4, '12345678000104', '202402', 250, 1250.00),
    (5, '12345678000105', '202403', 300, 1500.00),
    (6, '12345678000101', '202403', 350, 1750.00),
    (7, '12345678000102', '202304', 400, 2000.00),
    (8, '12345678000103', '202304', 450, 2250.00),
    (9, '12345678000104', '202305', 500, 2500.00),
    (10, '12345678000105', '202305', 550, 2750.00),
