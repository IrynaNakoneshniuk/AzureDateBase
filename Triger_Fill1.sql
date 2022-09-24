INSERT INTO Employee(Name,Surname,Rang)
VALUES ('Olga', 'Hmil',1),
('Volodymyr','Matsuk',2),
('Inna','Li',1),
('Kateryna','Hlushchak',3),
('Denys','Bohach',5),
('Maria','Pokoruk',4),
('Anna','Popova',4),
('Valeria','Solodka',1),
('Iryna','Nakoneshniuk',2),
('Lydmyla','Chuhai',5);
GO
INSERT INTO Manager(EmployeeId)
VALUES (1),(3),(8);
GO
INSERT INTO Sellers(EmployeeId)
VALUES (4),(10),(5);
GO
INSERT INTO Network(Adress,Phone)
VALUES ('s. Vinnytsia, st. Hmelnytske, 96-А', 080035300),
('s.Baranivka, st.Soborna, 2-А',0674343426),
('s.Vinnytsia, st Shevchenka 21',0674472063);
GO
INSERT INTO Goods(Name,Trademark,Category,Amount,Price,Code)
VALUES ('Mark Ecco','Puma','Boots',10,55,2345),
('Lugz','Nike','Boots',10,56,4567),
('DCPL','Puma','Sweater',10,67,9087),
('Stretz','Puma','Bags',34,10,1020),
('Champion','Nike','Bags',5,13,4050),
('True Religion','Puma','Bags',6,45,3000);
GO
INSERT INTO Storage(GoodsId,DeliveryDate,AmountStorage)
VALUES (1,'01.09.2022',5),
(2,'09.1.2022',5),
(3,'09.01.2022',5),
(4,'09.10.2022',10),
(5,'09.09.2022',2),
(6,'09.09.2022',3);
GO
INSERT INTO OrderGoods(GoodsId,NetworkId,Amount)
VALUES (1,1,1), (2,2,2);
INSERT INTO GoodsInShops(NetworkId,GoodsId,Amount)
VALUES (1,1,1), (2,2,2);

