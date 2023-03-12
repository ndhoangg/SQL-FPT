SELECT TOP 10
        p.EnglishProductName AS ProductName,
        p.ModelName,
        pc.EnglishProductCategoryName AS ProductCategoryName,
        ps.EnglishProductSubcategoryName AS ProductSubcategoryName,
        f.UnitsBalance,
        f.UnitCost
FROM 
        FactProductInventory f 
        JOIN( SELECT ProductKey, MAX(MovementDate) AS LastestDate FROM FactProductInventory GROUP BY ProductKey) AS fld
        ON f.ProductKey = fld.ProductKey AND f.MovementDate = fld.LastestDate
        JOIN DimProduct p ON f.ProductKey = p.ProductKey
        JOIN DimProductSubcategory ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
        JOIN DimProductCategory pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
ORDER BY UnitCost DESC