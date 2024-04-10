CREATE TABLE IF NOT EXISTS CHEK13 (
    CheckID INT PRIMARY KEY default  0,
    CheckNumber INT NOT NULL check (CheckNumber>0 ) default 0,
    CheckSum INT NULL DEFAULT 0 ,
    CheckData INT NOT NULL,
    EmployeeID INT  NULL,
    BuyerID INT NOT  NULL
);
INSERT INTO CHEK13 (CheckID, CheckNumber, CheckSum, CheckData, EmployeeID, BuyerID)
VALUES (1, 80989,5000,20.12,1,3);
INSERT INTO CHEK13 (CheckID, CheckNumber, CheckSum, CheckData, EmployeeID, BuyerID)
VALUES (2, 80989,21000,2,3,1);
INSERT INTO CHEK13 (CheckID, CheckNumber, CheckSum, CheckData,EmployeeID,BuyerID)
VALUES (3, 80989,10000,15,1,6),
       (4, 809,12000,15,2,4),
       (5, 8098,42000,15,3,2),
       (7, 80,131000,15,4,1),
       (6, 8,12050,15,2,3),
       (8, 889,18000,15,2,5);
SELECT
    CheckID,
    CheckNumber,
    AVG(CheckSum) OVER() AS "overall average price",
    AVG(CheckSum) OVER (PARTITION BY CheckData) AS " average price"
FROM CHEK13;

CREATE TABLE IF NOT EXISTS CHEK132 (
    CheckID INT PRIMARY KEY default  0,
    CheckNumber INT NOT NULL check (CheckNumber>0 ) default 0,
    CheckSum INT NULL DEFAULT 0 ,
    CheckData INT NOT NULL,
    EmployeeID INT  NULL
);;
INSERT INTO CHEK132 (CheckID, CheckNumber, CheckSum, CheckData,EmployeeID)
VALUES (3, 80989,10000,15,1),
       (4, 809,12000,15,2),
       (5, 8098,42000,15,3),
       (7, 80,131000,15,4),
       (6, 8,12050,15,2),
       (8, 889,18000,15,2);
CREATE VIEW CheckView AS
SELECT  CheckNumber, CheckSum
FROM CHEK132;
SELECT * FROM CheckView;

INSERT INTO CheckView ( CheckNumber, CheckSum) VALUES ( 32456, 65790);

UPDATE CheckView SET CheckSum = 52000.00 WHERE CheckNumber = 8;

DELETE FROM CheckView WHERE CheckSum = 10000;;