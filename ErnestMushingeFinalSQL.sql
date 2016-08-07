-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema HelensHomeMadeIceCream
-- -----------------------------------------------------
-- This database will model will define attributes and tables required to create Helen's Home Made Ice Cream

-- -----------------------------------------------------
-- Schema HelensHomeMadeIceCream
--
-- This database will model will define attributes and tables required to create Helen's Home Made Ice Cream
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HelensHomeMadeIceCream` DEFAULT CHARACTER SET utf8 ;
USE `HelensHomeMadeIceCream` ;

-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Vendor` (
  `VendorID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `City` VARCHAR(30) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `Email Address` VARCHAR(45) NULL,
  PRIMARY KEY (`VendorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Inventory` (
  `InventoryID` INT NOT NULL AUTO_INCREMENT,
  `VendorID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Date In` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`InventoryID`, `VendorID`),
  INDEX `VendorID_idx` (`VendorID` ASC),
  CONSTRAINT `VendorID`
    FOREIGN KEY (`VendorID`)
    REFERENCES `HelensHomeMadeIceCream`.`Vendor` (`VendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Email Address` VARCHAR(45) NOT NULL,
  `Customercol` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Employee` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `City` VARCHAR(30) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `PhoneNumber` VARCHAR(10) NOT NULL,
  `Hired Date` DATE NOT NULL,
  `Position` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Ingredients` (
  `IngredientID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `FK_VendorID` INT NOT NULL,
  `Quantity` DECIMAL(9,2) NOT NULL,
  `Unity Of Measure` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`IngredientID`),
  INDEX `VendorID_idx` (`FK_VendorID` ASC),
  CONSTRAINT `Foregn_VendorID`
    FOREIGN KEY (`FK_VendorID`)
    REFERENCES `HelensHomeMadeIceCream`.`Vendor` (`VendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Recipe` (
  `RecipeID` INT NOT NULL AUTO_INCREMENT,
  `IngredientID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RecipeID`, `IngredientID`),
  INDEX `IngredientID_idx` (`IngredientID` ASC),
  CONSTRAINT `IngredientID`
    FOREIGN KEY (`IngredientID`)
    REFERENCES `HelensHomeMadeIceCream`.`Ingredients` (`IngredientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Invoice(Sales)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Invoice(Sales)` (
  `InvoiceID` INT NOT NULL AUTO_INCREMENT,
  `VendorID` INT NOT NULL,
  `InvoiceNumber` INT NOT NULL,
  `InvoiceDate` DATE NOT NULL,
  `InvoiceTotal` DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (`InvoiceID`, `VendorID`),
  INDEX `VendorID_idx` (`VendorID` ASC),
  CONSTRAINT `FK_VendorID`
    FOREIGN KEY (`VendorID`)
    REFERENCES `HelensHomeMadeIceCream`.`Vendor` (`VendorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Invoice Line Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Invoice Line Item` (
  `Invoice_Line_ItemID` INT NOT NULL AUTO_INCREMENT,
  `FK_IngredientID` INT NOT NULL,
  `FK_InvoiceID` INT NOT NULL,
  PRIMARY KEY (`Invoice_Line_ItemID`, `FK_IngredientID`, `FK_InvoiceID`),
  INDEX `IngredientID_idx` (`FK_IngredientID` ASC),
  INDEX `InvoiceID_idx` (`FK_InvoiceID` ASC),
  CONSTRAINT `FK_IngredientID`
    FOREIGN KEY (`FK_IngredientID`)
    REFERENCES `HelensHomeMadeIceCream`.`Ingredients` (`IngredientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_InvoiceID`
    FOREIGN KEY (`FK_InvoiceID`)
    REFERENCES `HelensHomeMadeIceCream`.`Invoice(Sales)` (`InvoiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Flavors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Flavors` (
  `FlavorID` INT NOT NULL AUTO_INCREMENT,
  `InventoryID` INT NOT NULL,
  `RecipeID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Invoice_Line_ItemID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Unity_Price` DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (`FlavorID`, `InventoryID`, `RecipeID`, `Invoice_Line_ItemID`),
  INDEX `InventoryID_idx` (`InventoryID` ASC),
  INDEX `RecipeID_idx` (`RecipeID` ASC),
  INDEX `Invoice_Line_ItemID_idx` (`Invoice_Line_ItemID` ASC),
  CONSTRAINT `InventoryID`
    FOREIGN KEY (`InventoryID`)
    REFERENCES `HelensHomeMadeIceCream`.`Inventory` (`InventoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RecipeID`
    FOREIGN KEY (`RecipeID`)
    REFERENCES `HelensHomeMadeIceCream`.`Recipe` (`RecipeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Invoice_Line_ItemID`
    FOREIGN KEY (`Invoice_Line_ItemID`)
    REFERENCES `HelensHomeMadeIceCream`.`Invoice Line Item` (`Invoice_Line_ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Sales` (
  `SalesID` INT NOT NULL AUTO_INCREMENT,
  `TimeCreated` TIMESTAMP NOT NULL DEFAULT NOW(),
  `SaleAmountPaid` DECIMAL(9,2) NOT NULL,
  `EmployeeID` INT NOT NULL,
  `FlavorID` INT NOT NULL,
  PRIMARY KEY (`SalesID`, `EmployeeID`, `FlavorID`),
  INDEX `EmployeeID_idx` (`EmployeeID` ASC),
  INDEX `flavorID_idx` (`FlavorID` ASC),
  CONSTRAINT `EmployeeID`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `HelensHomeMadeIceCream`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `flavorID`
    FOREIGN KEY (`FlavorID`)
    REFERENCES `HelensHomeMadeIceCream`.`Flavors` (`FlavorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HelensHomeMadeIceCream`.`Sales Line Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HelensHomeMadeIceCream`.`Sales Line Item` (
  `SalesLineItemID` INT NOT NULL AUTO_INCREMENT,
  `SalesID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`SalesLineItemID`, `SalesID`, `CustomerID`),
  INDEX `SalesID_idx` (`SalesID` ASC),
  INDEX `CustomerID_idx` (`CustomerID` ASC),
  CONSTRAINT `SalesID`
    FOREIGN KEY (`SalesID`)
    REFERENCES `HelensHomeMadeIceCream`.`Sales` (`SalesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `HelensHomeMadeIceCream`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
