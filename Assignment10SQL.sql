#This script will create a trigger for the database that runs
# before the insert statement has executed
DELIMITER //
CREATE TRIGGER validateTermsDueDays
BEFORE INSERT ON terms
FOR EACH ROW
BEGIN
  IF NEW.terms_due_days < 10 THEN
  SIGNAL SQLSTATE '45000'
     SET message_text = 'TERMS DUE DATE IS TOO LOW, VALUE NOT LESS THAT 10';
  END IF;
  END//
  
  
use ap;
DROP TRIGGER validateTermsDueDays;
use ap;
show triggers;

use ap;
select * from terms;


use ap;
INSERT INTO terms
VALUES(DEFAULT, 'Net due 50 days', 7);

use ap;
DELETE FROM terms where terms_id = 6;

use ap;
DROP procedure IF EXISTS CreateNewColumnInTerms;
DELIMITER //
CREATE PROCEDURE CreateNewColumnInTerms()
BEGIN
 #DECLARE CountOfAllInvoiceRows INT;
 ALTER TABLE terms
ADD Action varchar(30) NOT NULL default ' ';
 
 END//
 DELIMITER ;
 
 use ap;
DROP procedure CreateNewColumnInTerms;