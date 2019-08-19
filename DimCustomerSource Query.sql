--Script written by Yao Liu
--Script query to select Customers for DimCustomer
USE CoffeeMerchant
GO
SELECT dbo.Consumer.ConsumerID,
	dbo.Consumer.City,
	dbo.Consumer.State,
	dbo.Consumer.Zipcode,
	ISNULL(dbo.Consumer.CreditLimit,0) as CreditLimit
FROM dbo.Consumer




	
