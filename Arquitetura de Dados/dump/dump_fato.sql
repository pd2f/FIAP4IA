/* dump da tabela fato_loc
necessário realizar o dump das dimensoes 
antes de realizar esse dump */
insert into fato_loc (day_id ,
    cd_cliente,
    cd_tipo_pagamento,
    cd_status,
    cd_veiculo,
    valor_total,
    media_dias_locado,
    media_dias_ocioso)
select day_id ,
    cd_cliente,
    cd_tipo_pagamento,
    cd_status,
    cd_veiculo,
    valor_total,
    media_dias_locado,
    media_dias_ocioso from (

WITH view_fato AS (
    SELECT
    v.nr_placa,
        t.day_id ,
        p.cd_cliente,
        tp.cd_tipo_pagamento,
        s.cd_status,
        vl.cd_veiculo,
        i.vl_locacao as valor_total,
        1 AS media_dias_locado,
        0 AS media_dias_ocioso
    FROM
        loc_item_locacao i,
        dim_status s,
        dim_tipo_pagamento tp,
        loc_pedido_locacao p,
        loc_veiculo v,
        dim_veiculo vl,
        time_source t
    WHERE
        i.nr_pedido = p.nr_pedido(+)
        AND s.status(+) = p.status
        AND v.nr_placa (+) = i.nr_placa
        AND tp.tipo_pagamento(+) = p.tp_pagto
        and v.modelo = vl.veiculo(+)
        AND t.day_id < i.dt_entrega
        AND t.day_id >= i.dt_retirada
)
,view_fato2 AS (
    SELECT
        t.day_id ,
        NULL cd_cliente,
        NULL cd_tipo_pagamento,
        NULL cd_status,
        v.cd_veiculo,
        0 AS valor_total,
        0 AS media_dias_locado,
        COUNT(1) AS media_dias_ocioso
    FROM
        time_source t,
        loc_veiculo vl,
        dim_veiculo v
    WHERE
    v.veiculo = vl.modelo
    and
        ( t.day_id,
          vl.nr_placa ) NOT IN (
            SELECT
                day_id,
                nr_placa
            FROM
                view_fato
        )and t.day_id >= '19/10/10' --(select min(dt_locacao) from loc_pedido_locacao)
        and t.day_id <='25/12/10' -- (select max(dt_locacao) from loc_pedido_locacao)
    GROUP BY
        t.day_id,
        v.cd_veiculo
)

SELECT
    day_id ,
    cd_cliente,
    cd_tipo_pagamento,
    cd_status,
    cd_veiculo,
    valor_total,
    media_dias_locado,
    media_dias_ocioso
FROM
    view_fato
    union
SELECT
    day_id ,
    cd_cliente,
    cd_tipo_pagamento,
    cd_status,
    cd_veiculo,
    valor_total,
    media_dias_locado,
    media_dias_ocioso
  FROM
    view_fato2);
