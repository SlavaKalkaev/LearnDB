CREATE TABLE IF NOT EXISTS Shop1 (
  ShopID INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  ShopAddress TEXT NOT NULL ,
  ShopRating FLOAT NOT NULL ,
  ShopPhone LONG NOT NULL
);


CREATE TABLE IF NOT EXISTS Employee1 (
  EmployeeID INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  EmployeeAddress TEXT  NULL ,
  EmployeeDateBirth INT NOT NULL DEFAULT 0,
  EmployeePhone LONG  NULL,
  EmployeeMail TEXT  NULL,
  EmployeeFullName TEXT  NULL,
  ShopID INT NOT NULL ,
  CONSTRAINT Employee_shop_fk1
  FOREIGN KEY (ShopID) REFERENCES Shop1(ShopID)
);
CREATE VIEW ESView AS
SELECT  ShopAddress, ShopPhone,EmployeeID,EmployeeFullName
FROM Shop1
JOIN Employee1;


DELIMITER //
CREATE TRIGGER InsertTrigger
after INSERT on Shop1
FOR EACH ROW
BEGIN
    INSERT INTO Employee1 (EmployeeID, EmployeeAddress, EmployeeDateBirth, EmployeePhone, EmployeeMail, EmployeeFullName, ShopID)
        values (10, '123 Main Street', 25, 1234567890, 'example1@mail.com', 'John Smith', 1),
(15, '456 Elm Street', 28, 2345678901, 'example2@mail.com', 'Jane Doe', 2),
(5, '789 Oak Street', 30, 3456789012, 'example3@mail.com', 'Alice Johnson', 3),
(18, '1010 Pine Street', 21, 4567890123, 'example4@mail.com', 'Bob White', 2),
(3, '1313 Mockingbird Lane', 29, 5678901234, 'example5@mail.com', 'Emily Brown', 1),
(12, '2468 Willow Lane', 27, 6789012345, 'example6@mail.com', 'David Wilson', 3),
(7, '3698 Cedar Avenue', 23, 7890123456, 'example7@mail.com', 'Sarah Miller', 1),
(9, '4747 Cherry Street', 26, 8901234567, 'example8@mail.com', 'Michael Taylor', 2),
(2, '5858 Maple Drive', 24, 9012345678, 'example9@mail.com', 'Emma Martinez', 1),
(17, '6969 Birch Road', 20, 1231231234, 'example10@mail.com', 'William Anderson', 3);
END//

DELIMITER //
CREATE TRIGGER DeleteTrigger
AFTER DELETE ON Shop1
FOR EACH ROW
BEGIN
    DELETE FROM Employee1 WHERE EmployeeDateBirth = 23;
END//
DELIMITER ;
insert into Shop1 (ShopID, ShopAddress, ShopRating, ShopPhone) VALUES (2,'Москва,Электролитный проезд 3, стр. 87',5.0,88002505006),
                                                                     (1,'Москва,Шоссе энтузиастов',5.0,88002505003),
                                                                     (3,'Москва,Дмитровская',5.0,88002505001);