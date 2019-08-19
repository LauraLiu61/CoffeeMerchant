-- Script written by Yao Liu
-- Script query to load the Fact Table

SELECT dbo.[Order].OrderID AS OrderID_DD,
	dbo.[Order].ConsumerID,
	dbo.[Order].EmployeeID,
	dbo.OrderLine.InventoryID,
	dbo.[Order].OrderDate,
	dbo.[Order].ShipDate,
	Quantity = SUM(CoffeeMerchant.dbo.OrderLine.Quantity),
	Price = SUM(CoffeeMerchant.dbo.OrderLine.Price),
	Discount = SUM(CoffeeMerchant.dbo.OrderLine.Discount),
	OnHand = SUM(CoffeeMerchant.dbo.Inventory.OnHand)
FROM CoffeeMerchant.dbo.OrderLine
INNER JOIN CoffeeMerchant.dbo.[Order]
	ON CoffeeMerchant.dbo.[Order].OrderID = CoffeeMerchant.dbo.OrderLine.OrderID
INNER JOIN CoffeeMerchant.dbo.Inventory
	ON CoffeeMerchant.dbo.Inventory.InventoryID = CoffeeMerchant.dbo.OrderLine.InventoryID
GROUP BY 
	dbo.[Order].OrderID,
	dbo.[Order].ConsumerID,
	dbo.[Order].EmployeeID,
	dbo.OrderLine.InventoryID,
	dbo.[Order].OrderDate,
	dbo.[Order].ShipDate;

		