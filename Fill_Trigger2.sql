USE MusicCollection
INSERT INTO Record_Label (Name)
VALUES('Blackened'),
('Warner Bros'),
('Universal'),
('MCA'),
('Elektra'),
('Capitol')
GO
INSERT INTO Artist(Record_Label_Id,Name,Surname)
 VALUES(1,'Metallica','1'),
(1,'Megadeth','2'),
(1,'Anthrax','3'),
(2,'Eric Clapton','4'),
(2,'ZZ Top','5'),
(2,'Van Halen','6'),
(3,'Lynyrd Skynyrd','7'),
(3,'AC/DC','8'),
(6,'The Beatles','9');
GO
INSERT INTO Album(ArtistId,Name,Year)
VALUES (3, '...And Justice For All',1988),
(3, 'Black Album',1991),
(3, 'Master of Puppets',1986),
(4, 'Endgame',2009),
(4, 'Peace Sells',1986),
(5, 'The Greater of 2 Evils',2004),
(9, 'Reptile',2001),
(5, 'Riding with the King',2000),
(7, 'Greatest Hits',1992),
(9, 'All-Time Greatest Hits',1975),
(11, 'Sgt. Pepper''s Lonely Hearts Club Band', 1967);
GO
INSERT INTO Song(Album_id,Name,Duration)
VALUES(47,'One',7.25),
(47,'Blackened',6.42),
(48,'Enter Sandman',5.3),
(48,'Sad But True',5.29),
(49,'Master of Puppets',8.35),
(49,'Battery',5.13),
(50,'Dialectic Chaos',2.26),
(50,'Endgame',5.57),
(51,'Peace Sells',4.09),
(51,'I am the Law',6.03),
(52,'Reptile',3.36),
(52,'Riding with the King',4.23),
(53,'Sharp Dressed Man',4.15),
(54,'Legs',4.32),
(54,'Eruption',1.43),
(55,'Hot For Teacher',4.43),
(55,'Sweet Home Alabama',4.45),
(56,'Free Bird',14.23),
(56,'Thunderstruck',4.52),
(57,'T.N.T',3.35),
(57,'Sgt. Pepper''s Lonely Hearts Club Band', 2.0333),
(57,'With a Little Help from My Friends', 2.7333);
GO
INSERT INTO Musical_Style(Name,ArtistId,AlbumId)
VALUES ('Blues',4,50),
('Rock',3,49),
('Dark Power Pop',5,52),
('Electronic rock',7,55),
('Pop music',9,53),
('Rhythm and blues',11,57);