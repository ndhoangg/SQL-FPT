-- ****BAI 1
SELECT 
        CONCAT(FirstName,' ',MiddleName,' ',LastName) AS FullName,
        BirthDate,
        CASE WHEN Gender = 'M' THEN 'MALE' WHEN Gender = 'F' THEN 'Female' ELSE 'Unknow' END,
        EmailAddress,
        EnglishEducation AS Education,
        Phone,
        AddressLine1,
        AddressLine2
FROM 
        DimCustomer c
        JOIN DimGeography g ON c.GeographyKey = g.GeographyKey
WHERE
        g.CountryRegionCode = 'GB'

