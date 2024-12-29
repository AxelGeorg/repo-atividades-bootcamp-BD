
1.
SELECT f.nome AS Nome, f.posto AS Posto, d.localidad AS Localizacao
FROM FUNCIONARIO f
JOIN DEPARTAMENTO d ON f.depto_nro = d.depto_nro
WHERE f.posto = 'Vendedor';

2.
SELECT d.nombre_depto AS Departamento, COUNT(f.cod_emp) AS Total_Empleados
FROM DEPARTAMENTO d
LEFT JOIN FUNCIONARIO f ON d.depto_nro = f.depto_nro
GROUP BY d.depto_nro
HAVING COUNT(f.cod_emp) > 5;

3.
SELECT f.nome AS Nome, f.salario AS Salario, d.nombre_depto AS Departamento
FROM FUNCIONARIO f
JOIN DEPARTAMENTO d ON f.depto_nro = d.depto_nro
WHERE f.posto = (SELECT f2.posto FROM FUNCIONARIO f2 WHERE f2.nome = 'Mito' AND f2.sobrenome = 'Barchuk');

4.
SELECT f.*
FROM FUNCIONARIO f
JOIN DEPARTAMENTO d ON f.depto_nro = d.depto_nro
WHERE d.nombre_depto = 'Contabilidade'
ORDER BY f.nome;

5.
SELECT nome
FROM FUNCIONARIO
ORDER BY salario ASC
LIMIT 1;

6.
SELECT *
FROM FUNCIONARIO
WHERE depto_nro = (SELECT depto_nro FROM DEPARTAMENTO WHERE nombre_depto = 'Vendas')
ORDER BY salario DESC
LIMIT 1;
