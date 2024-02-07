CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    data_nascimento DATE
);


INSERT INTO Clientes (id, nome, endereco, telefone, data_nascimento)
VALUES (1, 'João Carlos', 'rua rio de flores', '14567890', TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO Clientes (id, nome, endereco, telefone, data_nascimento)
VALUES (2, 'Amanda Clara', 'av do Barbeiro', '1456-7890', TO_DATE('1980-02-02', 'YYYY-MM-DD'));


INSERT INTO Clientes (id, nome, endereco, telefone, data_nascimento)
VALUES (3, 'Carlos Henrique', 'av Brasil 562', '2416-4490', TO_DATE('2000-11-01', 'YYYY-MM-DD'));

SELECT * FROM fornecedores




CREATE TABLE Fornecedores (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(255) UNIQUE
);


INSERT INTO Fornecedores (id, nome, endereco, telefone, email)
VALUES (1, 'Fornecedor A', 'Rua zelda, Nº 777', '2196655-3210', 'for01@email.com');



INSERT INTO Fornecedores (id, nome, endereco, telefone, email)
VALUES (2, 'Fornecedor B', 'Rua professor Carvalho, Nº 562', '212455-7784', 'for02@email.com');


INSERT INTO Fornecedores (id, nome, endereco, telefone, email)
VALUES (3, 'Fornecedor C', 'Rua Alan Wake, Nº 622', '212416-6237', 'for03@email.com');


CREATE TABLE Produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    fornecedorID INT,
    FOREIGN KEY (fornecedorID) REFERENCES Fornecedores(id)
);



INSERT INTO Produtos (id, nome, preco, quantidade, fornecedorID)
VALUES (1, 'Biscoito de chocolate wafer Bauducco', 6.99, 50, 1);


INSERT INTO Produtos (id, nome, preco, quantidade, fornecedorID)
VALUES (2, 'Biscoito de morango trakinas', 7.99, 50, 1);


INSERT INTO Produtos (id, nome, preco, quantidade, fornecedorID)
VALUES (3, 'Biscoito Maizena Marilan', 5.99, 50, 2);



INSERT INTO Produtos (id, nome, preco, quantidade, fornecedorID)
VALUES (4, 'Arroz tio João 1kg', 7.99, 50, 1);


INSERT INTO Produtos (id, nome, preco, quantidade, fornecedorID)
VALUES (5, 'Feijão carioca Camil 1kg', 17.99, 50, 1);


INSERT INTO Produtos (id, nome, preco, quantidade, fornecedorID)
VALUES (6, 'Macarrão Espaguete Santa Amália Sêmola 1Kg', 9.99, 50, 3);



select * FROM produtos

CREATE TABLE Pedidos (
    id INT PRIMARY KEY,
    clienteID INT,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (clienteID) REFERENCES Clientes(id)
);

CREATE TABLE ItensPedido (
    id INT PRIMARY KEY,
    pedidoID INT,
    produtoID INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (pedidoID) REFERENCES Pedidos(id),
    FOREIGN KEY (produtoID) REFERENCES Produtos(id)
);

INSERT INTO Pedidos(id, clienteID, data_pedido)
VALUES (1, 1, SYSDATE);

INSERT INTO ItensPedido (id, pedidoID, produtoID, quantidade)
VALUES (1, 1, 1, 15);

INSERT INTO ItensPedido (id, pedidoID, produtoID, quantidade)
VALUES (2, 1, 2, 10);


select * FROM pedidos

select * FROM ItensPedido


DELETE FROM pedidos
WHERE id = 1;



CREATE OR REPLACE PROCEDURE ObterProdutosFornecedoresPorCliente(
    clienteId IN NUMBER
)
IS
BEGIN
    SELECT C.nome AS NomeCliente, P.nome AS NomeProduto, 
	P.preco AS PrecoProduto, 
	IP.quantidade AS Quantidade,
	F.nome AS NomeFornecedor	
    FROM Clientes C
    JOIN Pedidos PD ON C.id = PD.clienteID
    JOIN ItensPedido IP ON PD.id = IP.pedidoID
    JOIN Produtos P ON IP.produtoID = P.id
    JOIN Fornecedores F ON P.fornecedorID = F.id
    WHERE C.id = clienteId;
END ObterProdutosFornecedoresPorCliente;







