USE MusicCollection;
------------------------------TRIGGER1------------------------------------<|
--Тригер не дозволяє додати альбом, що вже існує в колекції---------------<|
CREATE TRIGGER AddAlbum
ON Album
INSTEAD OF INSERT
AS
BEGIN
DECLARE @NAME VARCHAR (50)
SELECT @NAME=inserted.Name
FROM inserted
IF EXISTS (SELECT Album.Name FROM Album WHERE Album.Name= @NAME)
BEGIN
PRINT('Album already exists')
ROLLBACK TRANSACTION
END
ELSE
BEGIN
INSERT INTO Album(ArtistId,Name,Year)
SELECT ArtistId,Name,Year
FROM inserted
END
END
------------------------------TRIGGER2------------------------------------<|
-- Тригер, який не дозволяє видаляти диски гурту The Beatles--------------<|
CREATE TRIGGER Remove_Album
ON Album
INSTEAD OF DELETE
AS
BEGIN
DECLARE @NAME VARCHAR (50) 
SELECT @NAME = Artist.Name
FROM deleted,Artist
WHERE deleted.ArtistId=Artist.Id
IF @NAME ='The Beatles'
BEGIN
PRINT ('UNABLE TO DELETE ALBUM!')
ROLLBACK TRANSACTION
END
ELSE
BEGIN
DELETE FROM Album WHERE Album.Id = (SELECT deleted.Id FROM deleted )
END
END
------------------------------TRIGGER3------------------------------------<|
--При видаленні диска тригер переносить інформацію про  віддалений диск до 
--таблиці «Архів»;--------------------------------------------------------<|
CREATE TRIGGER DeleteAlbum
ON Album
FOR DELETE
AS 
BEGIN
INSERT INTO Archive(ArtistId,Name,Year)
SELECT ArtistId,Name,Year FROM deleted
END
------------------------------TRIGGER4------------------------------------<|
--Тригер не дозволяє додавати в колекцію диски музичного стилю «Dark Power Pop»
CREATE TRIGGER Add_Album_Style
ON Musical_Style
INSTEAD OF INSERT
AS 
BEGIN
DECLARE @NAME VARCHAR (50)
SELECT  @NAME= 'Dark Power Pop'
DECLARE @NAME_STYLE VARCHAR (50)
SELECT @NAME_STYLE = inserted.Name
FROM inserted
IF(@NAME_STYLE =@NAME)
BEGIN
PRINT ('Style of album Dark Power Pop. Сannot be added')
ROLLBACK TRANSACTION
END
ELSE
BEGIN
INSERT INTO Musical_Style(Name,ArtistId,AlbumId)
SELECT Name,ArtistId,AlbumId
FROM inserted
END
END