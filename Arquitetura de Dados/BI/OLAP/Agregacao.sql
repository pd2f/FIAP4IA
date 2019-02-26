create or replace view Fato_Loc_View as 

with agregacao as(
SELECT
    t.day_id, t.day_end_date,t.day_time_span,t.day_description,t.day_of_month,t.day_of_quarter,t.day_of_year,t.month_id,t.month_end_date,t.month_time_span,t.month_description,t.month_of_quarter,t.month_of_year,
    c.cliente,
    s.status,
    v.veiculo,
    tp.tipo_pagamento,
    media_dias_locado as dias_locado,
    media_dias_ocioso as dias_ocioso,
    valor_total as valor_total
FROM
    fato_loc d,
    time_source t,
    dim_cliente c,
    dim_status s,
    dim_veiculo v,
    dim_tipo_pagamento tp
WHERE
    d.day_id = t.day_id
    AND c.cd_cliente (+) = d.cd_cliente
    AND s.cd_status (+) = d.cd_status
    AND v.cd_veiculo (+) = d.cd_veiculo
    and tp.cd_tipo_pagamento = d.cd_tipo_pagamento
)
select * from agregacao;