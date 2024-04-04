-- Optimización de consultas:
-- Na BD tendaBD:
USE tendaBD;
-- 
--     1. Obtén o plan de execución para as seguintes consultas. Indica en base ao resultado obtido cal delas é máis rápida. Xustifica en base á información da BD a que se debe a diferencia.
--         a. Obtén os datos dos empregados con id 6.
SELECT *
FROM empregados 
WHERE emp_id = 6;

--         b. Obtén os datos dos empregados con DNI ‘76960385Q’
SELECT *
FROM empregados
WHERE emp_dni = '76960385Q';

-- 
--     2. Obtén o plan de execución para as seguintes consultas. Indica en base ao resultado obtido cal delas é máis rápida. Xustifica en base á información da BD a que se debe a diferencia.
--         a. Obtén os datos dos empregados con nome ‘ELISA’.
SELECT *
FROM empregados
WHERE emp_nome LIKE 'ELISA';

--         b. Obtén os datos dos empregados con apelidos ‘VALIENTE VALIENTE’.
SELECT *
FROM empregados
WHERE emp_apelidos LIKE 'VALIENTE VALIENTE';

--            
--     3. Obtén o plan de execución para as seguintes consultas. Indica en base ao resultado obtido cal delas é máis rápida. Xustifica en base á información da BD a que se debe a diferencia.
--         a. Obtén os datos dos empregados con apelidos que empezan por A.
SELECT *
FROM empregados
WHERE emp_apelidos LIKE 'A%'
OR emp_apelidos LIKE '% A%';

--         b. Obtén os datos dos empregados con apelidos que rematan por A..
SELECT *
FROM empregados
WHERE emp_apelidos LIKE '%A %'
OR emp_apelidos LIKE '%A';  

--            
--     4. Obtén o plan de execución para as seguintes consultas. Indica en base ao resultado obtido cal delas é máis rápida. Xustifica en base á información da BD a que se debe a diferencia.
--         a. Obtén o número de empregados que hai en cada poboación.
SELECT 	emp_poboacion,
		COUNT(emp_id)
FROM empregados
GROUP BY emp_poboacion;


--         b. Obtén o número de empregados que hai en cada país.
SELECT emp_pais,
		COUNT(emp_id)
FROM empregados
GROUP BY emp_pais;


--            
--     5. Obter  o código, nome, peso,  id do provedor e stock dos artigos do provedor 'MUPEGA'. 
--        Implementa a consulta das seguintes formas:
--         a. Combinando táboas (JOIN) 
SELECT 	ar.art_codigo,
		ar.art_nome,
        ar.art_peso,
        ar.art_provedor
FROM artigos AS ar
JOIN provedores AS pr ON (ar.art_provedor = pr.prv_id)
WHERE pr.prv_nome LIKE 'MUPEGA';


--         b. Usando subconsultas. 
SELECT art_codigo,
		art_nome,
        art_peso,
        art_provedor
FROM artigos
WHERE art_provedor = (SELECT prv_id
							FROM provedores
                            WHERE prv_nome LIKE 'MUPEGA');


--        Obtén en cada caso o plan de execución, compáraos e razoa cal das dúas opcións é mellor.
--        
--     6. Obtén os apelidos, nome, enderezo, poboación e país (nome do país) de empregados e de clientes.
--        Implementa a consulta das seguintes formas:
--         a. Combinando clientes e paises, combinando empregados e paises, e unindo o resultado.
(SELECT 	cl.clt_apelidos AS 'APELIDOS',
		cl.clt_nome AS 'NOME',
		cl.clt_enderezo AS 'ENDEREZO',
        cl.clt_poboacion AS 'POBOACION',
        pa.pai_nome AS 'PAIS'
FROM clientes AS cl
JOIN paises AS pa ON (pa.pai_id = cl.clt_pais))
UNION
(SELECT 	em.emp_apelidos AS 'APELIDOS',
		em.emp_nome AS 'NOME',
		em.emp_enderezo AS 'ENDEREZO',
        em.emp_poboacion AS 'POBOACION',
        pa.pai_nome AS 'PAIS'
FROM empregados AS em
JOIN paises AS pa ON (pa.pai_id = em.emp_pais));

--         b. Unindo clientes e empregados, e combinando o resultado cos paises.
SELECT 	persona.apelidos AS 'APELIDOS',
		persona.nome AS 'NOME',
		persona.enderezo AS 'ENDEREZO',
        persona.poboacion AS 'POBOACION',
        pa.pai_nome AS 'PAIS'
FROM (
    (SELECT 	cl.clt_apelidos AS apelidos,
				cl.clt_nome AS nome,
				cl.clt_enderezo AS enderezo,
		        cl.clt_poboacion AS poboacion,
                cl.clt_pais AS pais_id
    FROM clientes AS cl)
    UNION
    (SELECT 	em.emp_apelidos AS apelidos,
				em.emp_nome AS nome,
				em.emp_enderezo AS enderezo,
		        em.emp_poboacion AS poboacion,
                em.emp_pais AS pais_id
    FROM empregados AS em)
) AS persona
JOIN paises AS pa ON pa.pai_id = persona.pais_id;


--        Obtén en cada caso o plan de execución, compáraos e razoa cal das dúas opcións é mellor.
-- 
-- 
-- 
--     7. Queremos saber os artigos vendidos polo provedor ‘MUPEGA’ en tendas de ‘RIBEIRA’ nas que o xerente traballe na empresa desde antes do 2020. Para cada un deles queremos saber o código e o nome do artigo, a data de venda e o número de factura, o nome e apelidos do vendedor concatenados nun só campo e o nome e apelidos do cliente concatenados nun só campo.
--        Implementa a consulta das seguintes formas:
--         a. Usando só combinacións de táboas.
SELECT 	ar.art_codigo AS 'Cód. artigo',
		ar.art_nome AS 'Nome artigo',
        ven.ven_data AS 'Data da venda',
        ven.ven_factura AS 'Código Factura',
        CONCAT(em.emp_nome, ", ", em.emp_apelidos) AS 'Nombre vendedor',
        CONCAT(cl.clt_nome, ", ", cl.clt_apelidos) AS 'Nome cliente'
FROM artigos AS ar
JOIN detalle_vendas AS dv ON (dv.dev_artigo = ar.art_codigo)
JOIN vendas AS ven ON (dv.dev_venda = ven.ven_id)
JOIN empregados AS em ON (ven.ven_empregado = em.emp_id)
JOIN clientes AS cl ON (ven.ven_cliente = cl.clt_id)
JOIN provedores AS pr ON (pr.prv_id = ar.art_provedor)
JOIN tendas AS te ON (te.tda_id = ven.ven_tenda)
JOIN empregados AS xerente ON (te.tda_xerente = xerente.emp_id)
WHERE pr.prv_nome LIKE 'MUPEGA'
AND te.tda_poboacion LIKE 'RIBEIRA'
AND YEAR(xerente.emp_alta) < 2020;

--         b. Usando subconsultas con = ou IN, segundo corresponda, para obter o provedor, a tenda e o xerente da tenda; e combinacións nos demais casos.
SELECT 	ar.art_codigo AS 'Cód. artigo',
		ar.art_nome AS 'Nome artigo',
        ven.ven_data AS 'Data da venda',
        ven.ven_factura AS 'Código Factura',
        CONCAT(em.emp_nome, ", ", em.emp_apelidos) AS 'Nombre vendedor',
        CONCAT(cl.clt_nome, ", ", cl.clt_apelidos) AS 'Nome cliente'
FROM artigos AS ar
JOIN detalle_vendas AS dv ON (dv.dev_artigo = ar.art_codigo)
JOIN vendas AS ven ON (dv.dev_venda = ven.ven_id)
JOIN empregados AS em ON (ven.ven_empregado = em.emp_id)
JOIN clientes AS cl ON (ven.ven_cliente = cl.clt_id)
WHERE ar.art_provedor IN (SELECT prv_id
							FROM provedores
                            WHERE prv_nome LIKE 'MUPEGA')
AND ven.ven_tenda = ANY (SELECT tda_id
							FROM tendas
                            WHERE tda_poboacion LIKE 'RIBEIRA')
AND ven.ven_tenda IN (
                        SELECT tda_id
                        FROM tendas AS te
                        JOIN empregados AS xerente ON te.tda_xerente = xerente.emp_id
                        WHERE YEAR(xerente.emp_alta) < 2020);                            


--         c. Usando subconsultas con EXISTS para obter o provedor, a tenda e o xerente da tenda; e combinacións nos demais casos.
SELECT 	ar.art_codigo AS 'Cód. artigo',
		ar.art_nome AS 'Nome artigo',
        ven.ven_data AS 'Data da venda',
        ven.ven_factura AS 'Código Factura',
        CONCAT(em.emp_nome, ", ", em.emp_apelidos) AS 'Nombre vendedor',
        CONCAT(cl.clt_nome, ", ", cl.clt_apelidos) AS 'Nome cliente'
FROM artigos AS ar
JOIN detalle_vendas AS dv ON (dv.dev_artigo = ar.art_codigo)
JOIN vendas AS ven ON (dv.dev_venda = ven.ven_id)
JOIN empregados AS em ON (ven.ven_empregado = em.emp_id)
JOIN clientes AS cl ON (ven.ven_cliente = cl.clt_id)


--        Obtén en cada caso o plan de execución, compáraos e razoa cal das dúas opcións é mellor.
--        Obtén en cada caso o plan de execución con JSON, na información mostrada identifica:
--         ◦ O custe da consulta
--         ◦ O tempo de execución
--         ◦ O tempo que as táboas estiveron bloqueadas.
--         ◦ O número de warnings. Se hai algún indica a que se debe.
--        Indica se coinciden co esperado no plan de execución.
--        Indica cal das tres consultas deberías utilizar.
--        
--        
--        