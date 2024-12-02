/* Lisab payment_url veeru peale payment_methodit mille eesmärgiks on säilitada maksu lehte et kasutajad saaks seda ka hiljem näha */
ALTER TABLE orders
    ADD COLUMN payment_url VARCHAR(255) AFTER payment_method;

/* Lisab payment_methodi veergu NOWPayments maksuvõimaluse */
ALTER TABLE orders
    MODIFY COLUMN payment_method ENUM('montonio', 'NOWPayments') NOT NULL;

/* Muudab users tabelis kasutajad ainulaadseks ehk sama kasutajat ei saa olla kaks saavutatakse ka juba läbi id.
 ALTER TABLE users
    ADD CONSTRAINT unique_username UNIQUE (username); */