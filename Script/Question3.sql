INSERT INTO MFCLIENT (NAMECLIENT,TELEPHONE,EMAIL,ADDRESSCLIENT) VALUES ('GUSTAVO','5511995658537','GUSTAVOHN.CRUZ@GMAIL.COM','PRACA CAPITAO ALBERTO MENDES JUNIOR, 71 - CENTRO, GUARULHOS - SP');
INSERT INTO MFCLIENT (NAMECLIENT,TELEPHONE,EMAIL,ADDRESSCLIENT) VALUES ('MARIA','5511995658536','MARIA@GMAIL.COM','PRACA CAPITAO ALBERTO MENDES JUNIOR, 72 - CENTRO, GUARULHOS - SP');
INSERT INTO MFCLIENT (NAMECLIENT,TELEPHONE,EMAIL,ADDRESSCLIENT) VALUES ('SILVIO','5511995658535','SILVIO@GMAIL.COM','PRACA CAPITAO ALBERTO MENDES JUNIOR, 73 - CENTRO, GUARULHOS - SP');
INSERT INTO MFCLIENT (NAMECLIENT,TELEPHONE,EMAIL,ADDRESSCLIENT) VALUES ('NATHALIA','5511995658534','NATHALIA@GMAIL.COM','PRACA CAPITAO ALBERTO MENDES JUNIOR, 74 - CENTRO, GUARULHOS - SP');
INSERT INTO MFCLIENT (NAMECLIENT,TELEPHONE,EMAIL,ADDRESSCLIENT) VALUES ('BRUNO','5511995658533','BRUNO@GMAIL.COM','PRACA CAPITAO ALBERTO MENDES JUNIOR, 75 - CENTRO, GUARULHOS - SP');

INSERT INTO MFPRODUCT (NAMEPRODUCT,DESCRIPTIONPRODUCT,PRICE) VALUES 
( 'IPHONE 15', 'SMARTPHONE', 5000.15),
( 'INSPIRON 15', 'NOTEBOOK', 8000.10),
( 'GALAXY WATCH FE', 'SMARTWATCH', 3000.20)

DECLARE @IDCLIENT INT
DECLARE @IDORDER INT
DECLARE @IDPRODUCT INT
DECLARE @PRICE FLOAT

SELECT @IDCLIENT = IDCLIENT FROM MFCLIENT WHERE NAMECLIENT = 'GUSTAVO'

BEGIN TRY
	BEGIN TRAN
	
	INSERT INTO MFORDERS (IDCLIENT,DTORDER) VALUES (@IDCLIENT, GETUTCDATE());
	SET @IDORDER = (SELECT SCOPE_IDENTITY() AS IDORDER);

	SELECT @IDPRODUCT = IDPRODUCT, @PRICE = PRICE FROM MFPRODUCT WHERE NAMEPRODUCT = 'IPHONE 15'
	INSERT INTO MFORDERS_ITEMS (IDORDER, IDPRODUCT, PRICE, AMOUNT) VALUES (@IDORDER,@IDPRODUCT, @PRICE, 5);
		
	SELECT @IDPRODUCT = IDPRODUCT, @PRICE = PRICE FROM MFPRODUCT WHERE NAMEPRODUCT = 'INSPIRON 15'
	INSERT INTO MFORDERS_ITEMS (IDORDER, IDPRODUCT, PRICE, AMOUNT) VALUES (@IDORDER,@IDPRODUCT, @PRICE, 2);

	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH

SELECT @IDCLIENT = IDCLIENT FROM MFCLIENT WHERE NAMECLIENT = 'NATHALIA'

BEGIN TRY
	BEGIN TRAN
	
	INSERT INTO MFORDERS (IDCLIENT,DTORDER) VALUES (@IDCLIENT, GETUTCDATE());
	SET @IDORDER = (SELECT SCOPE_IDENTITY() AS IDORDER);

	SELECT @IDPRODUCT = IDPRODUCT, @PRICE = PRICE FROM MFPRODUCT WHERE NAMEPRODUCT = 'GALAXY WATCH FE'
	INSERT INTO MFORDERS_ITEMS (IDORDER, IDPRODUCT, PRICE, AMOUNT) VALUES (@IDORDER,@IDPRODUCT, @PRICE, 1);
		
	SELECT @IDPRODUCT = IDPRODUCT, @PRICE = PRICE FROM MFPRODUCT WHERE NAMEPRODUCT = 'IPHONE 15'
	INSERT INTO MFORDERS_ITEMS (IDORDER, IDPRODUCT, PRICE, AMOUNT) VALUES (@IDORDER,@IDPRODUCT, @PRICE, 3);

	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH