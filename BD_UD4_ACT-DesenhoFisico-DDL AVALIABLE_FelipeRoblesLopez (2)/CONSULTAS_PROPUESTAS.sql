
-- 102
((SELECT  em.codigo_empleado,
        em.nombre,
        em.apellido_1,
        em.apellido_2,
        fv.fecha_final_formación,
        'Actualmente en formación' AS 'Estado'
FROM EMPLEADO
WHERE fv.fecha_final_formación > CURRENT_DATE())
UNION
(SELECT  em.codigo_empleado,
        em.nombre,
        em.apellido_1,
        em.apellido_2,
        fv.fecha_final_formación,
        'Formación finalizada'
FROM EMPLEADO
WHERE fv.fecha_final_formación > CURRENT_DATE()))
ORDER BY ESTADO;