SELECT
    MONTH_DESCRIPTION,
    status,
    tipo_pagamento,
    SUM(dias_locado),
    SUM(valor_total) AS "valor total"
FROM
    fato_loc_view
GROUP BY
    CUBE(MONTH_DESCRIPTION, (
           status,
        tipo_pagamento));