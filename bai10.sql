SELECT TOP 10
        d.ResellerName,
        d.ResellerKey,
        SUM(f.OrderQuantity) AS TotalQuantity,
        SUM(f.TotalProductCost) AS TotalOrderCost   
FROM 
        FactResellerSales f 
        JOIN DimReseller d on f.ResellerKey = d.ResellerKey
GROUP BY d.ResellerKey , d.ResellerName
ORDER BY TotalOrderCost DESC