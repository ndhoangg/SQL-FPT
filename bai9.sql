SELECT TOP 20
        CONCAT(d.FirstName,' ',d.MiddleName,' ',d.LastName) AS CustomerName,
        f.SalesOrderNumber,
        f.CustomerKey,
        f.TotalProductCost AS TotalOrderCost
FROM
        FactInternetSales f 
        JOIN DimCustomer d ON f.CustomerKey = d.CustomerKey 

ORDER BY TotalProductCost DESC