CREATE VIEW ShopView AS
SELECT ShopID, ShopRating
FROM Shop;;
CREATE VIEW CheckBuyerView AS
SELECT CheckID, CheckNumber, BUYER.BuyerID, BuyerPhone
FROM CHEK
JOIN BUYER;
CREATE INDEX idx_buyer ON CHEK(CheckNumber);
CREATE VIEW IndexedView AS
SELECT BuyerID, BuyerFullName
FROM BUYER;;

