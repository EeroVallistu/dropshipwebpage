/* loob rollid */
CREATE ROLE 'admin';
CREATE ROLE 'kasutaja';

/* määrab kõik õigused admin rollile */
GRANT ALL ON *.* TO 'admin';

/* määrab select õigused kasutaja rollile */
GRANT SELECT ON *.* TO 'kasutaja';

/* loob uued kasutajad */
CREATE USER 'boss'@'localhost' IDENTIFIED BY 'admin_parool';
CREATE USER 'tööline'@'localhost' IDENTIFIED BY 'tööline_parool';

/* määrab kasutajatele rollid */
GRANT 'admin' TO 'boss'@'%';
GRANT 'kasutaja' TO 'tööline'@'%';

/* kasutaja peab õiguste kasutamiseks sisselogimisel kasutama set role (roll); käsku et need toimiks */

/* testid:
Logisin sisse "tööline" kasutajaga

    MariaDB [testdb]> set role kasutaja;
Query OK, 0 rows affected (0.000 sec)

MariaDB [testdb]> use testdb;
Database changed
MariaDB [testdb]> INSERT INTO test_table (name, age) VALUES ('Alice', 30), ('Bob', 25);
ERROR 1142 (42000): INSERT command denied to user 'tööline'@'localhost' for table `testdb`.`test_table`

Logisin sisse "boss" kasutajaga

   MariaDB [(none)]> set role admin;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> use testdb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [testdb]> INSERT INTO test_table (name, age) VALUES ('Alice', 30), ('Bob', 25);
Query OK, 2 rows affected (0.002 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [(none)]> SHOW GRANTS FOR 'tööline'@'%';
+----------------------------------------------------------------------------------------------------------+
| Grants for tööline@%                                                                                     |
+----------------------------------------------------------------------------------------------------------+
| GRANT `kasutaja` TO `tööline`@`%`                                                                        |
| GRANT USAGE ON *.* TO `tööline`@`%` IDENTIFIED BY PASSWORD '*6968ECAA8D18A7BE31DF21993946A7A3DC3D6599'   |
+----------------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)

MariaDB [(none)]> SHOW GRANTS FOR 'boss'@'%';
+-----------------------------------------------------------------------------------------------------+
| Grants for boss@%                                                                                   |
+-----------------------------------------------------------------------------------------------------+
| GRANT `admin` TO `boss`@`%`                                                                         |
| GRANT USAGE ON *.* TO `boss`@`%` IDENTIFIED BY PASSWORD '*31268CAC4A69F632D95210FB6BAE694599107A79' |
+-----------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)
   */