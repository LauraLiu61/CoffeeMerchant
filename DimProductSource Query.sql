-- Script written by Yao Liu
-- Script query to select Inventroy for DimProduct
USE CoffeeMerchant
GO
SELECT dbo.Inventory.InventoryID AS ProductID,
	ISNULL (dbo.Inventory.Name, 'N/A') AS Name,
	ISNULL (dbo.Inventory.Description, 'N/A') AS Description,
	ItemType,
	ISNULL (dbo.Country.CountryName, 'N/A') AS CountryName 
FROM dbo.Inventory
	LEFT OUTER JOIN dbo.Country
		ON dbo.Inventory.CountryID = dbo.Country.CountryID
