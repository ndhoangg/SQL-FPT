SELECT AccountDescription , [France],[Germany],[Australia]
FROM(
SELECT 
        da.AccountDescription,
        do.OrganizationName AS Country,
        SUM(f.Amount) AS Total
FROM 
        FactFinance f 
        JOIN DimOrganization do ON f.OrganizationKey = do.OrganizationKey
        JOIN DimAccount da ON da.AccountKey = f.AccountKey
WHERE do.OrganizationName IN ('France','Germany','Australia')        
GROUP BY do.OrganizationName ,da.AccountDescription
--ORDER BY AccountDescription ASC
) AS SourceTable
PIVOT
(
    SUM(Total)
    FOR Country IN ([France],[Germany],[Australia])
) AS PivotTable

