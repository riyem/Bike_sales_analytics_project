--cleansing product table--
SELECT
      p.[ProductKey]
      ,p.[ProductAlternateKey] AS ProductItemCode
      /*,[ProductSubcategoryKey]
      ,[WeightUnitMeasureCode]
      ,[SizeUnitMeasureCode]*/
      ,p.[EnglishProductName] As [Product Name]

	  ,sc.EnglishProductSubcategoryName As [Sub Category] --joined from sub category table
	  ,c.EnglishProductCategoryName As [Product Category]--joined in from category table
      /*,[SpanishProductName]
      ,[FrenchProductName]
      ,[StandardCost]
      ,[FinishedGoodsFlag]*/
      ,p.[Color] As [Product Color],
     /* ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[ListPrice*]*/
      p.[Size] As [Product Size]
      /*,[SizeRange]
      ,[Weight]
      ,[DaysToManufacture]*/
      ,p.[ProductLine] As [Product Line]
      /*,[DealerPrice]
      ,[Class]
      ,[Style]*/
      ,p.[ModelName] AS [Product Model Name]
      --,[LargePhoto]
      ,p.[EnglishDescription] As [Product Description]
      /*,[FrenchDescription]
      ,[ChineseDescription]
      ,[ArabicDescription]
      ,[HebrewDescription]
      ,[ThaiDescription]
      ,[GermanDescription]
      ,[JapaneseDescription]
      ,[TurkishDescription]
      ,[StartDate]
      ,[EndDate]*/,
      ISNULL (p.Status,'Outdated') As [Product Status]--if it's null label as outdated

  FROM [AdventureWorksDW2022].[dbo].[DimProduct] As p
 LEFT  JOIN dbo.DimProductSubcategory as sc ON sc.ProductSubcategoryKey=p.ProductSubcategoryKey
 LEFT JOIN dbo.DimProductCategory As c on c.ProductCategoryKey=sc.ProductCategoryKey

 order by 
 p.ProductKey asc