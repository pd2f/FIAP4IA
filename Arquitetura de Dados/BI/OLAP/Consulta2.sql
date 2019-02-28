SELECT
    MONTH_DESCRIPTION,
  Tipo_pagamento,
  veiculo,
    SUM(dias_locado),
    SUM(valor_total) as "valor total"
FROM
    fato_loc_view
GROUP BY
    CUBE(MONTH_DESCRIPTION,veiculo, Tipo_pagamento
     );