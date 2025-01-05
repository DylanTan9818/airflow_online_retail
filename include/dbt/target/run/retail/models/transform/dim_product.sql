
  
    

    create or replace table `marine-shell-446808-b3`.`retail`.`dim_product`
    
    

    OPTIONS()
    as (
      -- dim_product.sql
-- StockCode isn't unique, a product with the same id can have different and prices
-- Create the dimension table
SELECT DISTINCT
    to_hex(md5(cast(coalesce(cast(StockCode as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(Description as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(UnitPrice as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as product_id,
		StockCode AS stock_code,
    Description AS description,
    UnitPrice AS price
FROM `marine-shell-446808-b3`.`retail`.`raw_invoices`
WHERE StockCode IS NOT NULL
AND UnitPrice > 0
    );
  