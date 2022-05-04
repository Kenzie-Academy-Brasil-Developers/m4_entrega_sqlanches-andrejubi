-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
  p.id,
  p.status,
  p.cliente_id,
  pr.id,
  pr.nome,
  pr.tipo,
  pr.preço,
  pr.pts_de_lealdade
FROM 
  pedidos p
  INNER JOIN produtos_pedidos pp ON p.id = pp.pedido_id
  INNER JOIN produtos pr ON pp.produto_id = pr.id;

-- 2)
SELECT
  pp.pedido_id
FROM
  produtos_pedidos pp
  INNER JOIN produtos pr ON pp.produto_id = pr.id
WHERE
  pr.nome = 'Fritas'

-- 3)
SELECT
  c.nome as gostam_de_fritas
FROM
  produtos_pedidos pp
  INNER JOIN produtos pr ON pp.produto_id = pr.id
  INNER JOIN pedidos p ON p.id = pp.pedido_id
  INNER JOIN clientes c ON p.cliente_id = c.id
WHERE
  pr.nome = 'Fritas'
  
-- 4)
SELECT
  SUM(pr.preço)
FROM
  clientes c
  INNER JOIN pedidos p ON p.cliente_id = c.id
  INNER JOIN produtos_pedidos pp ON p.id = pp.pedido_id  
  INNER JOIN produtos pr ON pp.produto_id = pr.id
WHERE
  c.nome = 'Laura'

-- 5)
SELECT
  pr.nome,
  COUNT(pp.produto_id)
FROM
  produtos pr
  INNER JOIN produtos_pedidos pp ON pr.id = pp.produto_id
GROUP BY
  pr.nome


