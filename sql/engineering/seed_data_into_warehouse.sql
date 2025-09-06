SELECT *
INTO db_cosmetic_store_warehouse.dbo.sales_data
FROM db_cosmetic_store_lake.dbo.[2019-Dec]

UNION ALL

SELECT *
FROM db_cosmetic_store_lake.dbo.[2019-Nov]

UNION ALL

SELECT *
FROM db_cosmetic_store_lake.dbo.[2019-Oct]

UNION ALL

SELECT *
FROM db_cosmetic_store_lake.dbo.[2020-Jan]

UNION ALL

SELECT *
FROM db_cosmetic_store_lake.dbo.[2020-Feb];