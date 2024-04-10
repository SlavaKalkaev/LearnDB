
CREATE TABLE IF NOT EXISTS BUYER (
    BuyerID INT  PRIMARY KEY NOT NULL ,
    BuyerEmail TEXT NOT NULL ,
    BuyerPhone LONG NOT NULL check ( BuyerPhone>80000000000 ),
    BuyerFullName TEXT NOT NULL
);
INSERT INTO BUYER (BuyerID, BuyerEmail, BuyerPhone,BuyerFullName)
VALUES (1, 'slava.kalkaev@mail.ru',89652765238,'Slava Kalkaev'),
       (2,'example1@example.com', 89552765238, 'John'),
        (3,'user@mail.com', 89852745238, 'Alice'),
        (4,'test@gmail.com', 89852365238, 'Bob'),
        (5,'info@example.org', 89852765258, 'Emily'),
        (6,'support@example.net', 89852755238, 'Michael');
       ;
CREATE TABLE IF NOT EXISTS CHEK (
    CheckID INT PRIMARY KEY,
    CheckNumber INT NOT NULL check (CheckNumber>0 ),
    CheckSum INT NULL DEFAULT 0,
    CheckData INT NOT NULL,
    EmployeeID INT  NULL,
    CONSTRAINT FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    BuyerID INT NOT  NULL ,
    CONSTRAINT FOREIGN KEY (BuyerID) REFERENCES BUYER(BuyerID)
);
INSERT INTO CHEK (CheckID, CheckNumber, CheckSum, CheckData, EmployeeID, BuyerID)
VALUES (1, 80989,5000,20.12,1,3);
INSERT INTO CHEK (CheckID, CheckNumber, CheckSum, CheckData, EmployeeID, BuyerID)
VALUES (2, 80989,21000,2,3,1);
INSERT INTO CHEK (CheckID, CheckNumber, CheckSum, CheckData,EmployeeID,BuyerID)
VALUES (3, 80989,10000,15,1,6),
       (4, 809,12000,15,2,4),
       (5, 8098,42000,15,3,2),
       (7, 80,131000,15,4,1),
       (6, 8,12050,15,2,3),
       (8, 889,18000,15,2,5);

SELECT DISTINCT  CheckData
FROM CHEK;

DELETE from CHEK132 WHERE CheckSum < 20000;
UPDATE CHEK132 SET CheckNumber = 5 where EmployeeID = 3;

SELECT CheckID AS ID, CheckNumber AS Number, CheckSum AS Sum, CheckData AS Date, EmployeeID AS EmpID, BuyerID AS CustID
FROM CHEK;

SELECT CHEK.CheckID, CHEK.CheckNumber, CHEK.CheckSum, CHEK.CheckData, Employee.EmployeeFullName AS EmployeeName, BUYER.BuyerFullName AS BuyerName
FROM CHEK
LEFT JOIN Employee ON CHEK.EmployeeID = Employee.EmployeeID
LEFT JOIN BUYER ON CHEK.BuyerID = BUYER.BuyerID;

SELECT *
FROM CHEK
WHERE CheckNumber = 80989;

SELECT *
FROM CHEK
ORDER BY CheckSum DESC;

SELECT EmployeeID, SUM(CheckSum) AS TotalSum
FROM CHEK
GROUP BY EmployeeID;

SELECT CheckNumber, CheckSum
FROM CHEK
WHERE EmployeeID = 1
UNION ALL
SELECT CheckNumber, CheckSum
FROM CHEK
WHERE EmployeeID = 2;

SELECT *
FROM CHEK
WHERE EmployeeID IN (SELECT EmployeeID FROM Employee WHERE ShopID = 1);


CREATE PROCEDURE CalculateTotalCheckSum()
BEGIN
    DECLARE total_sum INT;
        SELECT SUM(CheckSum) INTO total_sum FROM CHEK;
        SELECT total_sum AS TotalCheckSum;
END;
call CalculateTotalCheckSum();;