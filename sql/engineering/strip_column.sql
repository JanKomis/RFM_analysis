USE [db_cosmetic_store_warehouse];
GO

ALTER TABLE dbo.sales_data
ADD [event_date] DATE,
    [event_time] TIME,
    event_time_zone VARCHAR(10)
GO


UPDATE dbo.sales_data
SET [event_date] = LEFT(event_timestamp, 10),
    [event_time] = SUBSTRING(event_timestamp, 12, 8),
    event_time_zone = RIGHT(event_timestamp, 3);