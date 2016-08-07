/*This SQL script will populate all the tables created in helenshomemadeicecream db*/
-- insert rows into the tables

#This SQL statements was written by Ernest Mushinge in the Summer of 2016
use helenshomemadeicecream;
INSERT INTO customer VALUES 
(1,'Ernest','Mushinge','emushinge@gmail.com'), 
(2,'Bob','Bribbs','bobs3@gmail.com'),
(3,'Kant','Mike','banks12@gmail.com'),
(4,'Milly','Moore','millyBilly@gmail.com'),
(5,'Billy','Bolly','bolly44@gmail.com'),
(6,'MKhata','Phill','phill45@gmail.com'),
(7,'dwadle','Mikety','dwadleme@gmail.com'),
(8,'Phillis','Swatch','swatchphill@gmail.com'),
(9,'Dorrith','Mbuya','mbuyad@gmail.com'),
(10,'Dorrito','Mbuyata','mbuya54d@gmail.com');


INSERT INTO employee VALUES
(1,'Dibbs','Mike','443 Lark lake','Virginia Beach','VA','757-765-0987','2015-04-08','Baker'),
(2,'Docky','Jibbs','442 Lark salt','Clevelande','OH','216-765-0787','2016-04-06','Shop Keeper'),
(3,'Dorrin','Muka','44 void street','Cleveland','OH','312-765-0587','2014-04-08','Driver'),
(4,'Mike','Panama','66 Kanta street','Cleveland','OH','440-765-0587','2001-04-08','Driver'),
(5,'Phill','Jobs','222 Bit street','Cleveland','OH','440-109-0587','2014-04-08','Server'),
(6,'Dumbs','Buka','77 Elacto avenu','Newburgh Heights','OH','216-765-0947','2016-04-08','Server'),
(7,'Dorrino','Mukata','90 void street','Cleveland','OH','440-735-0587','2013-04-08','Driver'),
(8,'Dogata','Mbuyt','100 void avenue','Cleveland','OH','218-765-0587','2016-04-08','Cashia'),
(9,'humk','hyera','99 twek street','Cleveland','OH','880-765-0587','2014-03-08','Driver'),
(10,'Bobs','Bibbs','65 void creek','Cleveland','OH','234-765-0587','2014-09-08','Driver');



INSERT INTO flavors 
VALUES 
(1,1,1,'Birthday Cake',1,200,33.65), 
(2,2,2,'Chocolate',2,100,33.65), 
(3,3,3,'Mint',3,300,33.65), 
(4,4,4,'Mocha',4,500,33.65), 
(5,5,5,'Mint Chocolate',4,200,33.65), 
(6,6,6,'Mint Mocha',6,600,33.65), 
(7,7,7,'Vanilla',7,700,33.65), 
(8,8,8,'Banana',8,800,33.65), 
(9,9,9,'Milk',9,200,33.65), 
(10,10,10,'Mint Milk',10,200,33.65);

INSERT INTO ingredients VALUES
(1,'Cold Milk',1,4.7,'liters'),
(2,'cream',2,7,'Grams'),
(3,'Sugar',3,4,'kg'),
(4,'Salt',4,2,'kg'),
(5,'Water',5,7,'liters'),
(6,'Eggs',6,10,'Dozon'),
(7,'Homond Milk',7,7,'liters'),
(8,'Cheez',8,4,'lb'),
(9,'Chocolate',9,5,'lb'),
(10,'Fish Oil',10,7,'mili gram');


INSERT INTO invoice VALUES
(1,1,989,'2015-04-08',3813.33),
(2,2,263,'2015-04-10',40.20),
(3,3,9632,'2015-04-13',138.75),
(4,4,2000,'2015-04-16',144.70),
(5,5,9632,'2015-04-16',15.50),
(6,6,9632,'2015-04-16',42.75),
(7,7,9632,'2015-04-21',172.50),
(8,8,125,'2015-04-24',95.00),
(9,9,97,'2015-04-24',601.95),
(10,10,26325,'2015-04-24',42.67);

INSERT INTO invoice_line_item VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10);


INSERT INTO recipe VALUES
(1,1,'Breez'),
(2,2,'Bahama mama'),
(3,3,'Chocolate Breez'),
(4,4,'Vanilla Ice'),
(5,5,'Milky Way'),
(6,6,'Freez the Beez'),
(7,7,'Haves'),
(8,8,'Creator'),
(9,9,'Showi'),
(10,10,'Breez 2');



INSERT INTO sales  VALUES
(1,default,7.98,1,1),
(2,default,6.98,2,2),
(3,default,4.00,1,3),
(4,default,20.98,2,4),
(5,default,15.98,1,5),
(6,default,2.65,1,6),
(7,default,3.98,10,7),
(8,default,9.98,1,8),
(9,default,2.98,5,9),
(10,default,1.98,1,10);


INSERT INTO sales_line_item VALUES
(1,1,3),
(2,2,7),
(3,3,10),
(4,4,3),
(5,5,1),
(5,6,3),
(7,7,5),
(8,8,3),
(9,9,2),
(10,10,3);



INSERT INTO vendor VALUES
(1,'Walmart','345 Steel Yard','Newburgh Heights','OH', 'walmart22@walmart.com'),
(2,'Spinks','37 Steel Avenue','Cleveland','OH', 'spinks@yahoo.com'),
(3,'Dorrins','54 Yard Street','Newburgh Heights','OH', 'wdw@gmail.com'),
(4,'Banko','376 Mentor Avenue','Mentor','OH', 'dimmies@ymail.com'),
(5,'Titos','25 Chestnut ln','Richmond Heights','OH', 'titos@yahoo.com'),
(6,'Ernie','15 Steel Yard','Newburgh Heights','OH', 'ernie@walmart.com'),
(7,'suckito','365 dibs avenue','Columbus','OH', 'dibs@yahoo.com'),
(8,'Mikies','25 Parade avenue','Cleveland Heights','OH', 'yaho2@gmail.com'),
(9,'Timo limited','34 Steel Yard','Newburgh Heights','OH', 'wfe@timo.com'),
(10,'Hamppy','90 Steel Heaven','Madina','OH', 'hamppy@yahoo.com');

INSERT INTO inventory VALUES
(1,3,'Cups','2016-05-08',300),
(2,3,'Scoops','2016-0-08',300),
(3,3,'Plates','2016-04-08',400),
(4,3,'Mixing Plate','2016-04-08',4),
(5,3,'Napkins','2016-03-08',1000),
(6,3,'Windex','2016-02-08',9),
(7,3,'Broom','2015-12-08',3),
(8,3,'Pots','2016-06-08',6),
(9,3,'Sponges','2016-04-08',34),
(10,3,'Lids','201-04-08',300);


