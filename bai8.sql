SELECT
        f.SalesOrderNumber,
        f.SalesOrderLineNumber,
        CONCAT(dc.FirstName,' ',dc.MiddleName,' ',dc.LastName) AS CustomerName,
        dp.EnglishProductName AS ProductName,
        f.OrderQuantity,
        f.UnitPrice,
        f.DiscountAmount,
        f.SalesAmount,
        f.ProductStandardCost,
        f.TotalProductCost
FROM 
        FactInternetSales f 
        JOIN DimCustomer dc ON f.CustomerKey = dc.CustomerKey
        JOIN DimProduct dp ON f.ProductKey = dp.ProductKey
WHERE dp.EnglishProductName = 'Road-150 Red, 48'