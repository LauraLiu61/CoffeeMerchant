-- Script written by Yao Liu
-- Script query to load the Fact Table
USE CoffeeMerchantDM
GO
SELECT 
	CoffeeMerchant.dbo.[Order].OrderID AS OrderID_DD,
	dbo.DimConsumer.Consumer_SK,
	dbo.DimEmployee.Employee_SK,
	dbo.DimProduct.Product_SK,
	DT1.Date_SK AS OrderDate,
	DT2.Date_SK AS ShipDate,
	Quantity = CoffeeMerchant.dbo.OrderLine.Quantity,
	Price = CoffeeMerchant.dbo.OrderLine.Price,
	Discount = CoffeeMerchant.dbo.OrderLine.Discount,
	OnHand = CoffeeMerchant.dbo.Inventory.OnHand
FROM CoffeeMerchant.dbo.[Order]
INNER JOIN CoffeeMerchant.dbo.OrderLine
		ON CoffeeMerchant.dbo.[Order].OrderID = CoffeeMerchant.dbo.OrderLine.OrderID
INNER JOIN CoffeeMerchant.dbo.Inventory
		ON CoffeeMerchant.dbo.OrderLine.InventoryID = CoffeeMerchant.dbo.Inventory.InventoryID
INNER JOIN dbo.DimConsumer
        ON dbo.DimConsumer.Consumer_AK = CoffeeMerchant.dbo.[Order].ConsumerID
INNER JOIN dbo.DimEmployee
        ON dbo.DimEmployee.Employee_AK = CoffeeMerchant.dbo.[Order].EmployeeID
INNER JOIN dbo.DimProduct
        ON dbo.DimProduct.Product_AK = CoffeeMerchant.dbo.OrderLine.InventoryID
INNER JOIN DimDate AS DT1
	ON  DT1.Date = CoffeeMerchant.dbo.[Order].OrderDate
LEFT OUTER JOIN DimDate AS DT2
	ON  DT2.Date = CoffeeMerchant.dbo.[Order].ShipDate
