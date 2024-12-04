/* loob logi tabeli */
CREATE TABLE users_log (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           user_id INT NOT NULL,
                           old_email VARCHAR(255),
                           new_email VARCHAR(255),
                           changed_by VARCHAR(255),
                           changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* loob triggeri mis kontrollib emaili terviklikust */
DELIMITER //

CREATE TRIGGER before_user_insert
    BEFORE INSERT ON users
    FOR EACH ROW
BEGIN
    /* Kontrollib emaili korrektsust */
    IF NEW.email NOT REGEXP '^[A-Za-z0-9._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid email address format';
    END IF;
END;

//

DELIMITER ;

/* loob triggeri mis logib emaili muudatused */
DELIMITER //

CREATE TRIGGER after_users_update
    AFTER UPDATE ON users
    FOR EACH ROW
BEGIN
    IF OLD.email <> NEW.email THEN
        INSERT INTO users_log (user_id, old_email, new_email, changed_by, changed_at)
        VALUES (OLD.id, OLD.email, NEW.email, USER(), NOW());
    END IF;
END;

//

DELIMITER ;