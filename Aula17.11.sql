drop database if exists loja;
create database loja;
use loja;

show databases;

create table produtos (
	id int auto_increment primary key,
    nome varchar(100) not null, 
    preco decimal (10, 2) not null,
    estoque int not null
);

desc produtos;

create table vendas(
	id int auto_increment primary key, 
    produto_id int,
    produto varchar(100) not null,
    quantidade int not null, 
    valor_total decimal(10, 2) not null,
    data_venda date not null,
    foreign key (produto_id) references produtos(id)
);

INSERT INTO produtos (nome, preco, estoque) VALUES
('Camiseta Básica', 39.90, 30),
('Calça Jeans Masculina', 129.90, 15),
('Tênis Esportivo', 249.00, 20),
('Mochila Escolar', 89.99, 12),
('Fone de Ouvido Bluetooth', 79.90, 25),
('Mouse Óptico USB', 29.90, 40),
('Teclado Mecânico', 199.90, 10),
('Monitor LED 24 Polegadas', 799.00, 5),
('Smartwatch Fit', 159.90, 18),
('Copo Térmico Inox', 49.90, 35),
('Garrafa de Água 1L', 24.90, 50),
('Caderno Universitário 10 Matérias', 22.50, 60),
('Lápis de Cor 24 Unidades', 18.90, 45),
('Cafeteira Elétrica', 119.90, 9),
('Liquidificador 900W', 139.00, 7),
('Chaleira Elétrica', 89.90, 14),
('Ventilador de Mesa 40cm', 159.00, 8),
('Jogo de Panelas Antiaderentes', 259.90, 6),
('Travesseiro Ortobom', 39.00, 20),
('Cobertor Microfibra', 89.90, 11);

INSERT INTO vendas (produto_id, produto, quantidade, valor_total, data_venda) VALUES
(1, 'Camiseta Básica', 2, 79.80, date_sub(curdate(), interval 1 day)),
(2, 'Calça Jeans Masculina', 1, 129.90,date_sub(curdate(), interval 1 day)),
(3, 'Tênis Esportivo', 1, 249.00, date_sub(curdate(), interval 1 day)),
(4, 'Mochila Escolar', 3, 269.97, date_sub(curdate(), interval 1 day)),
(5, 'Fone de Ouvido Bluetooth', 2, 159.80, date_sub(curdate(), interval 1 day)),
(6, 'Mouse Óptico USB', 4, 119.60, date_sub(curdate(), interval 1 day)),
(7, 'Teclado Mecânico', 1, 199.90, date_sub(curdate(), interval 1 day)),
(8, 'Monitor LED 24 Polegadas', 1, 799.00, date_sub(curdate(), interval 1 day)),
(9, 'Smartwatch Fit', 1, 159.90, date_sub(curdate(), interval 1 day)),
(10, 'Copo Térmico Inox', 3, 149.70, date_sub(curdate(), interval 1 day)),
(11, 'Garrafa de Água 1L', 5, 124.50, date_sub(curdate(), interval 1 day)),
(12, 'Caderno Universitário 10 Matérias', 2, 45.00, date_sub(curdate(), interval 1 day)),
(13, 'Lápis de Cor 24 Unidades', 1, 18.90, date_sub(curdate(), interval 1 day)),
(14, 'Cafeteira Elétrica', 4, 479.60, date_sub(curdate(), interval 1 day)),
(15, 'Liquidificador 900W', 1, 139.00, date_sub(curdate(), interval 1 day)),
(16, 'Chaleira Elétrica', 2, 179.80, date_sub(curdate(), interval 1 day)),
(17, 'Ventilador de Mesa 40cm', 5, 795.00, date_sub(curdate(), interval 1 day)),
(18, 'Jogo de Panelas Antiaderentes', 1, 259.90, date_sub(curdate(), interval 1 day)),
(19, 'Travesseiro Ortobom', 3, 117.00, date_sub(curdate(), interval 1 day)),
(20, 'Cobertor Microfibra', 2, 178.00, date_sub(curdate(), interval 1 day));


select * from produtos;
select produto, data_venda from vendas;

select * from vendas where quantidade>=3;

select * from vendas
where data_venda >= curdate() - interval 4 day;

delimiter // 

create procedure AplicadorDeDescontoGeral(in porcentagem decimal(5, 2))
begin

update produtos
set preco = preco * (1 - (porcentagem/ 100));
select concat('Desconto de ', porcentagem, '" aplicado em ', row_count(), ' produtos') as Resultado;
end//
delimiter ;

call AplicadorDeDescontoGeral(10.0);

select * from produtos;