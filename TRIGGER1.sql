USE Shop
---------------------------------------------TRIGER1------------------------------------------------------<|
-- При додаванні нового товару тригер перевіряє його наявність на складі, якщо такий товар є і нові дані
-- про товар збігаються з існуючими даними, замість додавання від-----------------------------------------<|
create trigger AddGoods
on Goods
instead of INSERT
AS
BEGIN
DECLARE @CODE INT
SELECT @CODE =Code
FROM inserted
IF  EXISTS(SELECT Storage.GoodsId FROM Storage,Goods  WHERE Storage.GoodsId=Goods.Id AND Goods.Code = @CODE )
BEGIN
DECLARE @CoodiD INT 
SELECT  @CoodiD=GoodsId 
FROM Storage, Goods  WHERE Storage.GoodsId=Goods.Id AND Goods.Code = @CODE
UPDATE Storage
SET Storage.AmountStorage =Storage.AmountStorage+1
WHERE  Storage.GoodsId= @CoodiD
END
ELSE
INSERT INTO Goods (Name,Trademark,Category,Amount,Price,Code)
SELECT Name,Trademark,Category,Amount,Price,Code
FROM inserted
END
---------------------------------------------TRIGER2------------------------------------------------------<|
--При звільненні співробітника тригер переносить інформацію про звільненого співробітника таблицю «Архів 
--співробітників»;----------------------------------------------------------------------------------------<|
create trigger DismissalEmployee
on Employee
FOR DELETE
AS
BEGIN
DECLARE @DateDismissal DATETIME
SELECT @DateDismissal =CONVERT(DATE, GETDATE())
INSERT INTO EmployeeArchive(Name,Surname,ReleaseDate)
SELECT Name,Surname,@DateDismissal
FROM deleted
END
---------------------------------------------TRIGER3------------------------------------------------------<|
--Тригер забороняє додавати нового продавця, якщо кількість існуючих продавців більше 6.-----------------<|
create trigger AddSeller
on Sellers
instead of INSERT
AS
BEGIN
IF(SELECT COUNT(*) FROM Sellers>6)
BEGIN
PRINT('Sellers more than 6!')
rollback transaction
END
ELSE 
BEGIN
INSERT INTO Sellers(EmployeeId)
SELECT EmployeeId FROM inserted
END
END
