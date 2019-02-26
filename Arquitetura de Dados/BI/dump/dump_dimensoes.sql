/*Carga dimensão Status*/
INSERT INTO DIM_STATUS (STATUS)
select  STATUS from loc_pedido_locacao 
group by status;

/*Carga dimensão tipo pagamento*/
INSERT INTO DIM_TIPO_PAGAMENTO (TIPO_PAGAMENTO)
select  tp_pagto from loc_pedido_locacao 
group by tp_pagto;

/*Carga dimensão cliente*/
INSERT INTO DIM_CLIENTE (CD_CLIENTE,CLIENTE)
select c.cd_cliente, c.nm_cliente from loc_pedido_locacao p, loc_cliente c 
where c.cd_cliente = p.cd_cliente
group by c.cd_cliente,c.nm_cliente;

/*Carga dimensão veiculo*/
INSERT INTO DIM_VEICULO (VEICULO)
select v.veiculo
from  dim_veiculos v
GROUP BY V.veiculo;