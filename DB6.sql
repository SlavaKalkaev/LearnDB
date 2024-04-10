
CREATE TABLE IF NOT EXISTS Delivery(
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    DeliveryCompany text not null,
    DeliveryData datetime not null ,
    DeliveryAddress text not null,
    DeliveryNumber int not null ,
    CheckID INT NOT NULL ,
    CONSTRAINT FOREIGN KEY (CheckID) REFERENCES CHEK(CheckID)
);;
insert into Delivery(DeliveryID, DeliveryCompany, DeliveryData, DeliveryAddress, DeliveryNumber,CheckID)
VALUES(1,'dhl','2023-12-29 15:30:45','moscow,st.rubin,8',12,2),
      (2,'dl','2023-12-29 18:30:45','moscow,st.fdsff,8',11,4),
      (3,'pr','2023-12-29 17:30:45','moscow,st.amkal,8',10,7),
      (4,'amazon','2023-12-29 16:30:45','moscow,st.yuiuy,8',9,1);

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
    UPDATE Delivery SET DeliveryNumber = DeliveryNumber +1;
    SELECT * FROM Delivery;;
    COMMIT;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
    SELECT * FROM Delivery;
    SELECT SLEEP(5);
    SELECT * FROM Delivery;
    COMMIT;
START TRANSACTION;
    UPDATE Delivery SET DeliveryNumber = DeliveryNumber +1;
    SELECT * FROM Delivery;
    COMMIT;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    START TRANSACTION;
    INSERT INTO Delivery (DeliveryID, DeliveryCompany, DeliveryData, DeliveryAddress, DeliveryNumber, CheckID)
    VALUES(5,'ozon','2023-12-29 15:50:45','moscow,st.yttt,8',21,3);
    SELECT * FROM Delivery;
    SELECT SLEEP(5);
    SELECT * FROM Delivery;
    COMMIT ;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    START TRANSACTION;
    INSERT INTO Delivery (DeliveryID, DeliveryCompany, DeliveryData, DeliveryAddress, DeliveryNumber, CheckID)
    VALUES(6,'YM','2024-01-21 15:50:45','moscow,st.aviatorov,8',26,4);
    SELECT * FROM Delivery;
    SELECT SLEEP(5);
    SELECT * FROM Delivery;
    COMMIT ;