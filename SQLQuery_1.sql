/*criando tabelas*/
CREATE TABLE Produtos(
    id INTEGER PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco_produto INTEGER,
    categoria_produto VARCHAR(100)
    )
CREATE TABLE Clientes(
    id INTEGER PRIMARY KEY,
    nome_cliente VARCHAR(200),
    email_cliente VARCHAR(200)
    )
CREATE TABLE Vendas (
    id INTEGER PRIMARY KEY,
    produto_id INTEGER REFERENCES Produtos(id),
    cliente_id INTEGER REFERENCES Clientes(id),
    quantidade INTEGER, 
    data_venda VARCHAR(50)
    )

/*adicionando valores nas tabelas*/
INSERT INTO produtos(id,nome_produto,preco_produto,categoria_produto)
VALUES(5,'notebook', 3000, 'eletrônicos');

INSERT INTO clientes(id,nome_cliente,email_cliente)
VALUES(5,'lucas', 'lucas@outlook.com');

INSERT INTO vendas(id,produto_id,cliente_id,quantidade,data_venda)
VALUES(14,5,1,1,'19/11/2023')
SELECT*
FROM vendas
/*contagem por categoria*/
SELECT categoria_produto, COUNT(*) AS quantidade_produto
FROM produtos
GROUP BY categoria_produto
ORDER BY quantidade_produto ASC;

/*contagem por produtos iguais*/

SELECT produto_id, COUNT(*) AS quantidade_produto_vendido
FROM vendas
GROUP BY produto_id
ORDER BY quantidade_produto_vendido DESC

/*busca todas as vendas com seus compradores e quantidades*/

SELECT c.nome_cliente, p.nome_produto, v.quantidade
FROM vendas v
JOIN clientes c ON c.id = v.cliente_id 
JOIN produtos p ON p.id = v.produto_id



/*contagem por quantidade de produtos vendidos*/
SELECT p.nome_produto, COUNT(*) AS quantidade_total
FROM vendas v
JOIN produtos p ON p.id = v.produto_id
GROUP BY p.nome_produto
ORDER BY quantidade_total DESC