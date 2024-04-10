
CREATE TABLE IF NOT EXISTS Shop (
  ShopID INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  ShopAddress TEXT NOT NULL ,
  ShopRating FLOAT NOT NULL ,
  ShopPhone LONG NOT NULL
);

INSERT INTO Shop(ShopID, ShopAddress, ShopRating, ShopPhone ) VALUES (2,'Москва,Электролитный проезд 3, стр. 87',5.0,88002505006),
                                                                     (1,'Москва,Шоссе энтузиастов',5.0,88002505003),
                                                                     (3,'Москва,Дмитровская',5.0,88002505001);

CREATE TABLE IF NOT EXISTS Employee (
  EmployeeID INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  EmployeeAddress TEXT  NULL ,
  EmployeeDateBirth INT NOT NULL DEFAULT 0,
  EmployeePhone LONG  NULL,
  EmployeeMail TEXT  NULL,
  EmployeeFullName TEXT  NULL,
  ShopID INT NOT NULL ,
  CONSTRAINT Employee_shop_fk
  FOREIGN KEY (ShopID) REFERENCES Shop(ShopID) ON DELETE SET NULL
);;

INSERT INTO Employee(EmployeeID, EmployeeAddress, EmployeeDateBirth, EmployeePhone, EmployeeMail, EmployeeFullName,ShopID)
VALUES (1,'Москва,улица красноармейская,дом 5',20.11,89857765432,'nvinrev@mail.ru','Иванов Иван Иванович',1);
INSERT INTO Employee(EmployeeFullName,ShopID) VALUES
                                        ('Петр',1),
                                        ('иван',2),
                                        ('денис',3),
                                        ('андрей',1),
                                        ('гей',2);

CREATE TABLE IF NOT EXISTS Part (
    PartID INT  PRIMARY KEY,
    PartCost INT NOT NULL,
    PartCountry TEXT NULL,
    PartMaterial TEXT NOT NULL,
    PartCount INT NOT NULL ,
    PartPhotoURL TEXT NOT NULL,
    PartName TEXT NOT NULL,
    PartBrand TEXT NOT NULL
);
insert into Part ( PartID,PartCost, PartCountry, PartMaterial, PartCount, PartPhotoURL, PartName, PartBrand)
values (1,17000,'russia','al',14,'eviernv','deck','sputnik'),
       (2,5500,'russia','al',20,'eviernv','bar','sputnik'),
       (3,7000,'russia','st',20,'evieervrnv','bar','sputnik'),
       (4,7000,'russia','al',20,'evievervrernv','bar','sputnik'),
       (5,8000,'russia','al',20,'evibnyternv','fork','sputnik'),
       (6,500,'russia','bumaga',20,'evinternv','sticker','sputnik'),
       (7,3800,'russia','al',20,'evienhgrnv','compression','sputnik'),
       (8,7000,'russia','al',20,'evienghrnv','bar','sputnik'),
       (9,8000,'russia','al',20,'eviertrnv','bar','sputnik'),
       (10,7500,'russia','st',50,'evinhgernv','bar','sputnik');
CREATE TABLE IF NOT EXISTS Availability(
    ShopID INT NOT NULL ,
    PRIMARY KEY(ShopID,PartID),
    CONSTRAINT FOREIGN KEY (ShopID) REFERENCES Shop(ShopID),
    PartID INT NOT NULL,
    CONSTRAINT FOREIGN KEY (PartID) REFERENCES Part(PartID) ON DELETE CASCADE
);

CREATE VIEW AvailabilityView AS
SELECT ShopID,PartID
FROM Shop
JOIN Part;

CREATE TABLE IF NOT EXISTS PartInBuckets(
    PartID INT  AUTO_INCREMENT NOT NULL ,
    PRIMARY KEY(PartID,CheckID),
    CONSTRAINT FOREIGN KEY (PartID) REFERENCES Part(PartID),
    CheckID INT  NOT NULL ,
    CONSTRAINT FOREIGN KEY (CheckID) REFERENCES CHEK(CheckID)
);

CREATE SCHEMA IF NOT EXISTS my_schema;
ALTER TABLE Part
    RENAME TO my_schema.Part;
DROP SCHEMA IF EXISTS my_schema;
