-- Tarefa 1. Realizar consultas con subconsultas dentro dunha condición sobre a base de datos tendaBD
USE tendaBD;

-- 1. Tarefa 1.1. Seleccionar código e peso dos artigos que teñen o peso máis pequeno có peso do artigo de código '077WN45'.
SELECT 	art_codigo,
		art_peso
FROM artigos
WHERE art_peso < (SELECT art_peso
					FROM artigos
                    WHERE art_codigo = '077WN45');

-- 2. Tarefa 1.2. Seleccionar código, nome, peso e cor dos artigos da mesma cor có artigo de código '242C283', e que teñan un peso maior ou igual co peso medio de todos os artigos.
SELECT art_codigo,
		art_nome,
        art_peso
FROM artigos
WHERE art_color = (SELECT art_color
					FROM artigos
                    WHERE art_codigo LIKE '242C823')
AND art_peso >= (SELECT AVG(art_peso));

-- 3. Tarefa 1.3. Seleccionar código da tenda e nome do xerente das tendas nas que se vendeu polo menos unha unidade do artigo de código ' 077WN45'.
SELECT te.tda_id,
		xer.emp_nome
FROM tendas AS te
JOIN empregados AS xer ON (te.tda_xerente = xer.emp_id)
WHERE te.tda_id IN (SELECT ven_tenda
						FROM vendas
                        WHERE ven_id =  ANY (SELECT dev_venda
												FROM detalle_vendas
                                                WHERE dev_artigo IN (SELECT art_codigo
																		FROM artigos
                                                                        WHERE art_codigo = '077WN45')));


-- 4. Tarefa 1.4. Mostrar a lista de artigos cun prezo de venta maior có prezo de venta do artigo máis barato de cor negra. Obter o mesmo resultado nos dous casos seguintes:
--     ◦ Utilizando any.
SELECT *
FROM artigos
WHERE art_pv > ANY (SELECT art_pv
					FROM artigos
                    WHERE art_color LIKE 'negro');

--     ◦ Utilizando a función min().
SELECT *
FROM artigos
WHERE art_pv > (SELECT MIN(art_pv)
				FROM artigos
                WHERE art_color LIKE 'negro');



-- 5. Tarefa 1.5. Seleccionar código de artigo, descrición do artigo e código do provedor para os artigos que subministra o provedor que ten o nome SEAGATE.
SELECT art_codigo,
		art_nome,
        art_provedor
FROM artigos
WHERE art_provedor IN (SELECT prv_id
						FROM provedores
                        WHERE prv_nome LIKE 'MUPEGA');

-- 6. Tarefa 1.6. Mostrar información do artigo máis caro, Seleccionando o seu código, nome, prezo de venta e nome do provedor que o subministra. 
SELECT ar.art_codigo AS Codigo,
		ar.art_nome AS Nome,
        ar.art_pv AS Prezo,
        pr.prv_nome AS Provedor
FROM artigos AS ar
JOIN provedores AS pr ON (pr.prv_id = ar.art_provedor)
WHERE ar.art_pv = (SELECT MAX(art_pv)
					FROM artigos);

SELECT ar.art_codigo,
		ar.art_nome,
        ar.art_pv,
        (SELECT pr.prv_nome 
			FROM provedores AS pr
            WHERE ar.art_provedor = pr.prv_id)
FROM artigos AS ar
WHERE ar.art_pv = (SELECT MAX(art_pv)
					FROM artigos);

--    
-- 7. Tarefa 2.1. Mostrar nome e prezo de venda dos artigos que teñen un prezo de venda comprendido entre o prezo do artigo '0713242' e a media de prezos de todos os artigos. Os datos deben mostrarse ordenados alfabeticamente polo nome do artigo.
SELECT art_nome,
		art_pv
FROM artigos
WHERE art_pv BETWEEN (SELECT art_pv
						FROM artigos
                        WHERE art_codigo = '0713242')
			AND (SELECT AVG(art_pv)
					FROM artigos)
ORDER BY art_nome;

--    
-- 8. Tarefa 3.1. Obter a lista de provedores que subministran como mínimo un artigo de cor negra.
SELECT *
FROM provedores
WHERE prv_id = ANY (SELECT art_provedor
						FROM artigos
                        WHERE art_color LIKE 'negro');

-- 9. Tarefa 3.2. Mostrar identificador de cliente, apelidos e nome na mesma columna separados por coma, para os clientes que só teñen unha venda. O resultado estará ordenado polo identificador do cliente.
SELECT clt_id,
		CONCAT(clt_apelidos, ", ", clt_nome) AS 'Nome completo'
FROM clientes
WHERE clt_id IN (SELECT ven_cliente
					FROM vendas
                    GROUP BY ven_cliente
                    HAVING COUNT(ven_id) = 1);
                    

-- 10. Tarefa 3.3. Mostrar identificador e nome dos clientes que fixeron algunha compra despois do día en que o cliente número 6 fixo a súa última compra.  
SELECT clt_id,
		clt_nome
FROM clientes AS cl
WHERE clt_id IN (SELECT ven_cliente
					FROM vendas
                    WHERE ven_data > (SELECT MAX(ven_data)
										FROM vendas
										WHERE ven_cliente = 6));

-- 11. Tarefa 3.4. Mostrar os nomes dos xerentes das tendas nas que se fixo algunha venta. 
SELECT emp_nome
FROM empregados
WHERE emp_id IN (SELECT DISTINCT tda_xerente
					FROM tendas
                    WHERE tda_id IN (SELECT DISTINCT ven_tenda
										FROM vendas));


-- 12. Tarefa 3.5. Importe total das vendas que se fixeron ao cliente LEANDRO FERREIRO BENITEZ.
SELECT SUM(dv.dev_cantidade * dv.dev_prezo_unitario - dv.dev_cantidade * dv.dev_prezo_unitario * dv.dev_desconto / 100) AS 'Importe Total'
FROM detalle_vendas AS dv
WHERE dev_venda = ANY (SELECT ven_id
						FROM vendas
                        WHERE ven_cliente = (SELECT clt_id
											FROM clientes
                                            WHERE clt_nome LIKE 'LEANDRO'
                                            AND clt_apelidos LIKE 'FERREIRO BENITEZ'));

-- 13. Tarefa 3.6. Seleccionar o id, apelidos e nome dos empregados que aínda non fixeron ningunha venda.     
--    
SELECT emp_id,
		emp_apelidos,
        emp_nome
FROM empregados
WHERE emp_id NOT IN (SELECT ven_empregado
						FROM vendas);



-- 14. Tarefa 4.1. Mostrar a lista de artigos cun prezo de venta maior có prezo de venta do artigo máis barato de cor negra utilizando unha consulta de existencia. 
SELECT *
FROM artigos AS ar1
WHERE EXISTS (
    SELECT ar2.art_pv
    FROM artigos AS ar2
    WHERE ar2.art_color LIKE 'negro'
    AND ar1.art_pv > ar2.art_pv
);
                
                


-- 15. Tarefa 4.2. Mostrar o nome dos artigos de cor negra que teñan algunha venda de máis de 5 unidades. Obter o mesmo resultado nos dous casos seguintes:
--     ◦ sen utilizar join.
SELECT art_nome
FROM artigos
WHERE art_color LIKE 'negro'
AND art_codigo IN (SELECT dev_artigo
					FROM detalle_vendas
                    WHERE dev_cantidade > 5);



--     ◦ utilizando join.
SELECT ar.art_nome
FROM artigos AS ar
JOIN detalle_vendas AS dv ON (dv.dev_artigo = ar.art_codigo)
WHERE dv.dev_cantidade > 5
AND ar.art_color LIKE 'negro';



-- 16. Tarefa 4.3. Mostrar nome e apelidos dos clientes que non fixeron ningunha compra.
SELECT clt_nome,
		clt_apelidos
FROM clientes
WHERE clt_id NOT IN (SELECT ven_cliente
						FROM vendas);