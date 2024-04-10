DELIMITER //
CREATE TRIGGER Trigger_1
BEFORE INSERT ON MyDB.BUYER
FOR EACH ROW
BEGIN
    IF (BuyerPhone < 80000000000)
    THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ошибка: Некорректный номер телефона';
    END IF;
END//
CREATE TRIGGER InsertTrigger
AFTER INSERT ON Shop
FOR EACH ROW
BEGIN
    DECLARE Message TEXT;;
    SELECT 'Вставлен элемент ' AS Message INTO Message;
END//

CREATE TRIGGER UpdateTrigger
AFTER UPDATE ON Shop
FOR EACH ROW
BEGIN
    DECLARE Message TEXT;
    SELECT 'Обновлено ' AS Message INTO Message;
END//

CREATE TRIGGER DeleteTrigger
AFTER DELETE ON Shop
FOR EACH ROW
BEGIN
    DECLARE Message TEXT;
    SELECT 'Удалено ' AS Message INTO Message;
END//

DELIMITER ;;