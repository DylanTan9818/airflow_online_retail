SELECT
    c.country,
    c.iso,
    COUNT(fi.invoice_id) AS total_invoices,
    SUM(fi.total) AS total_revenue
FROM
    {{ ref('fct_invoices') }} AS fi
JOIN
    {{ ref('dim_customer') }} AS c
    ON fi.customer_id = c.customer_id
GROUP BY
    c.country,
    c.iso
ORDER BY
    total_revenue DESC
LIMIT 10;
