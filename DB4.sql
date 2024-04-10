DELIMITER //
CREATE PROCEDURE ShopTable()
BEGIN
    DECLARE done INT DEFAULT FALSE;;
    DECLARE Shop_d TEXT;
    DECLARE cur CURSOR FOR SELECT ShopAddress FROM Shop;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO Shop_d;
        IF done THEN
            LEAVE read_loop;;
        END IF;
    END LOOP;
    CLOSE cur;
END //
CREATE PROCEDURE CustomFunction()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE VAR text;
    DECLARE cur CURSOR FOR SELECT ShopPhone, ShopRating AS COLUMN_1 FROM Shop;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO VAR;
        IF done THEN
            LEAVE read_loop;
        END IF;
    END LOOP;

    CLOSE cur;
END //

CREATE PROCEDURE TableFunction()
    BEGIN
    SELECT * FROM CustomFunction();
END//

DELIMITER ;