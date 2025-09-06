USE [db_cosmetic_store_lake];
GO

DECLARE @schema NVARCHAR(MAX) = '(
    event_id        bigint IDENTITY(1,1) PRIMARY KEY,              -- technický klíč
    event_time      varchar(200)        NOT NULL,               -- čas v UTC (doporučeno)
    event_type      varchar(20)            NOT NULL 
        CHECK (event_type IN (''view'',''cart'',''remove_from_cart'',''purchase'')),
    product_id      bigint                 NOT NULL,
    category_id     bigint                 NULL,                   -- ne vždy vyplněno
    category_code   varchar(255)           NULL,                   -- např. "cosmetics.lipstick"
    brand           varchar(255)           NULL,
    price           decimal(10,2)          NOT NULL,               -- cena za událost
    user_id         bigint                 NOT NULL,
    user_session    varchar(200)       NULL 
)';

DECLARE @tableName NVARCHAR(100);
DECLARE @sql NVARCHAR(MAX);

-- seznam tabulek
DECLARE cur CURSOR FOR
SELECT name
FROM (VALUES
    ('2019-Dec'),
    ('2019-Nov'),
    ('2019-Oct'),
    ('2020-Feb'),
    ('2020-Jan')
) AS t(name);

OPEN cur;
FETCH NEXT FROM cur INTO @tableName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = 'CREATE TABLE ' + QUOTENAME(@tableName) + ' ' + @schema + ';';
    PRINT @sql; -- jen pro kontrolu
    EXEC sp_executesql @sql;

    FETCH NEXT FROM cur INTO @tableName;
END

CLOSE cur;
DEALLOCATE cur;