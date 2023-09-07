  /*cleansing dim_customers*/
  SELECT
       c.customerkey As   [CustomerKey]
     /** ,[GeographyKey]
      ,[CustomerAlternateKey]
      ,[Title]**/
      ,c.FirstName As [FirstName]
      /*,[MiddleName]*/
      ,c.LastName As  [LastName],
	  c.FirstName + ' ' +c.LastName As [Full Name],

      /*,[NameStyle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Suffix]*/
      CASE  c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END As Gender, 
       
      /*,[EmailAddress]
      ,[YearlyIncome]
      ,[TotalChildren]
      ,[NumberChildrenAtHome]
      ,[EnglishEducation]
      ,[SpanishEducation]
      ,[FrenchEducation]
      ,[EnglishOccupation]
      ,[SpanishOccupation]
      ,[FrenchOccupation]
      ,[HouseOwnerFlag]
      ,[NumberCarsOwned]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]*/
      c.DateFirstPurchase As [DateFirstPurchase]
      /*,[CommuteDistance]*/
	  ,g.City As [Customer City] --joined in customer city from geography table

  FROM [AdventureWorksDW2022].[dbo].[DimCustomer] as c
  LEFT JOIN dbo.DimGeography As g ON g.GeographyKey=c.GeographyKey
  ORDER BY
  CustomerKey ASC --Ordered List by CustomerKey
