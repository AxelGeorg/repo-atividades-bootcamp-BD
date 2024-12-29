DROP DATABASE IF EXISTS func_db;
CREATE DATABASE func_db;
USE func_db;


CREATE TABLE DEPARTAMENTO (
    depto_nro VARCHAR(10) PRIMARY KEY,
    nombre_depto VARCHAR(100),
    localidad VARCHAR(100)
);

CREATE TABLE FUNCIONARIO (
    cod_emp VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    posto VARCHAR(100),
    data_alta DATE,
    salario DECIMAL(15, 2),
    comissao DECIMAL(15, 2),
    depto_nro VARCHAR(10),
    FOREIGN KEY (depto_nro) REFERENCES DEPARTAMENTO(depto_nro)
);

INSERT INTO DEPARTAMENTO (depto_nro, nombre_depto, localidad) VALUES
('D-000-1', 'Software', 'Los Tigres'),
('D-000-2', 'Sistemas', 'Guadalupe'),
('D-000-3', 'Contabilidade', 'La Roca'),
('D-000-4', 'Vendas', 'Plata');

INSERT INTO FUNCIONARIO (cod_emp, nome, sobrenome, posto, data_alta, salario, comissao, depto_nro) VALUES
('E-0001', 'César', 'Piñero', 'Vendedor', '2018-05-12', 80000.00, 15000.00, 'D-000-4'),
('E-0002', 'Yosep', 'Kowaleski', 'Analista', '2015-07-14', 140000.00, 0.00, 'D-000-2'),
('E-0003', 'Mariela', 'Barrios', 'Diretor', '2014-06-05', 185000.00, 0.00, 'D-000-3'),
('E-0004', 'Jonathan', 'Aguilera', 'Vendedor', '2015-06-03', 85000.00, 10000.00, 'D-000-4'),
('E-0005', 'Daniel', 'Brezezicki', 'Vendedor', '2018-03-03', 83000.00, 10000.00, 'D-000-4'),
('E-0006', 'Mito', 'Barchuk', 'Presidente', '2014-06-05', 190000.00, 0.00, 'D-000-3'),
('E-0007', 'Emilio', 'Galarza', 'Desenvolvedor', '2014-08-02', 60000.00, 0.00, 'D-000-1');