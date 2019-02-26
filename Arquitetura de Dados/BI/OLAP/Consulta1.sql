SELECT
    veiculo,
    cliente,
    status,
    month_description,
    SUM(dias_ocioso),
    SUM(dias_locado),
    SUM(valor_total)
--,ROUND(SUM(D.VALOR_TOTAL) / SUM(D.MEDIA_DIAS_LOCADO),2)
FROM
    fato_loc_view
GROUP BY
    ROLLUP(
        veiculo,
        (status,
          cliente,
          month_description)
    );