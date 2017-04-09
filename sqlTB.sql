-- MySQL Script generated by MySQL Workbench
-- 04/09/17 23:21:16
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SD` DEFAULT CHARACTER SET utf8 ;
USE `SD` ;

-- -----------------------------------------------------
-- Table `SD`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`sales` (
  `sales_id` INT NOT NULL,
  `sales_office` VARCHAR(45) NULL,
  `sale_currency` VARCHAR(45) NULL,
  `sale_district` VARCHAR(45) NULL,
  `price_list` VARCHAR(45) NULL,
  PRIMARY KEY (`sales_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`billing` (
  `bill_id` INT NOT NULL,
  `bill_payment_condition` VARCHAR(45) NULL,
  `bill_method` VARCHAR(45) NULL,
  PRIMARY KEY (`bill_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`partner_functions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`partner_functions` (
  `parther_id` INT NOT NULL,
  `partner_type_of_parther` VARCHAR(45) NULL,
  PRIMARY KEY (`parther_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`cus_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`cus_group` (
  `cusgroup_id` INT NOT NULL,
  `cusgroup_name` VARCHAR(45) NULL,
  PRIMARY KEY (`cusgroup_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`customer` (
  `cus_id` INT NOT NULL,
  `cus_name` VARCHAR(80) NULL,
  `cus_job` VARCHAR(45) NULL,
  `cus_department` VARCHAR(45) NULL,
  `cus_address` VARCHAR(140) NULL,
  `cus_email` VARCHAR(45) NULL,
  `cus_phone` VARCHAR(45) NULL,
  `sales_id` INT NOT NULL,
  `bill_id` INT NOT NULL,
  `parther_id` INT NOT NULL,
  `cusgroup_id` INT NOT NULL,
  PRIMARY KEY (`cus_id`, `sales_id`, `bill_id`, `parther_id`, `cusgroup_id`),
  INDEX `fk_customer_sales1_idx` (`sales_id` ASC),
  INDEX `fk_customer_billing1_idx` (`bill_id` ASC),
  INDEX `fk_customer_partner_functions1_idx` (`parther_id` ASC),
  INDEX `fk_customer_cus_group1_idx` (`cusgroup_id` ASC),
  CONSTRAINT `fk_customer_sales1`
    FOREIGN KEY (`sales_id`)
    REFERENCES `SD`.`sales` (`sales_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_billing1`
    FOREIGN KEY (`bill_id`)
    REFERENCES `SD`.`billing` (`bill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_partner_functions1`
    FOREIGN KEY (`parther_id`)
    REFERENCES `SD`.`partner_functions` (`parther_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_cus_group1`
    FOREIGN KEY (`cusgroup_id`)
    REFERENCES `SD`.`cus_group` (`cusgroup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`materials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`materials` (
  `mat_id` VARCHAR(30) NOT NULL,
  `mat_description` VARCHAR(45) NULL,
  `mat_type` VARCHAR(45) NULL,
  `mat_group` VARCHAR(45) NULL,
  `mat_Instock` INT NULL,
  PRIMARY KEY (`mat_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`CMIR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`CMIR` (
  `cus_id` INT NOT NULL,
  `mat_id` VARCHAR(30) NOT NULL,
  `CMIR_id` VARCHAR(45) NOT NULL,
  `cus_mat_name` VARCHAR(45) NULL,
  PRIMARY KEY (`cus_id`, `mat_id`, `CMIR_id`),
  INDEX `fk_customer_has_materials_materials1_idx` (`mat_id` ASC),
  INDEX `fk_customer_has_materials_customer_idx` (`cus_id` ASC),
  CONSTRAINT `fk_customer_has_materials_customer`
    FOREIGN KEY (`cus_id`)
    REFERENCES `SD`.`customer` (`cus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_has_materials_materials1`
    FOREIGN KEY (`mat_id`)
    REFERENCES `SD`.`materials` (`mat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`scale_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`scale_price` (
  `scale_price_id` INT NOT NULL,
  `sp_description` VARCHAR(45) NULL,
  `sp_amount` VARCHAR(45) NULL,
  PRIMARY KEY (`scale_price_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`condition_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`condition_type` (
  `con_id` VARCHAR(25) NOT NULL,
  `con_type_name` VARCHAR(45) NULL,
  `con_type_description` VARCHAR(45) NULL,
  PRIMARY KEY (`con_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`pricing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`pricing` (
  `price_id` INT NOT NULL,
  `price_amount` VARCHAR(45) NULL,
  `price_valid_from` VARCHAR(45) NULL,
  `price_valid_to` VARCHAR(45) NULL,
  `scale_price_id` INT NOT NULL,
  `con_id` INT NOT NULL,
  `mat_id` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`price_id`, `scale_price_id`, `con_id`, `mat_id`),
  INDEX `fk_pricing_scale_price1_idx` (`scale_price_id` ASC),
  INDEX `fk_pricing_condition_type1_idx` (`con_id` ASC),
  INDEX `fk_pricing_materials1_idx` (`mat_id` ASC),
  CONSTRAINT `fk_pricing_scale_price1`
    FOREIGN KEY (`scale_price_id`)
    REFERENCES `SD`.`scale_price` (`scale_price_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pricing_condition_type1`
    FOREIGN KEY (`con_id`)
    REFERENCES `SD`.`condition_type` (`con_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pricing_materials1`
    FOREIGN KEY (`mat_id`)
    REFERENCES `SD`.`materials` (`mat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`Docheader`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`Docheader` (
  `dochead_id` VARCHAR(45) NOT NULL,
  `document_type` VARCHAR(45) NULL,
  `cus_id` INT NOT NULL,
  `sales_id` INT NOT NULL,
  `bill_id` INT NOT NULL,
  `parther_id` INT NOT NULL,
  `cusgroup_id` INT NOT NULL,
  `Ref_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dochead_id`, `cus_id`, `sales_id`, `bill_id`, `parther_id`, `cusgroup_id`),
  INDEX `fk_Docheader_customer1_idx` (`cus_id` ASC, `sales_id` ASC, `bill_id` ASC, `parther_id` ASC, `cusgroup_id` ASC),
  INDEX `fk_Docheader_Docheader1_idx` (`Ref_id` ASC),
  CONSTRAINT `fk_Docheader_customer1`
    FOREIGN KEY (`cus_id` , `sales_id` , `bill_id` , `parther_id` , `cusgroup_id`)
    REFERENCES `SD`.`customer` (`cus_id` , `sales_id` , `bill_id` , `parther_id` , `cusgroup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Docheader_Docheader1`
    FOREIGN KEY (`Ref_id`)
    REFERENCES `SD`.`Docheader` (`dochead_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`itemlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`itemlist` (
  `itemlist_id` INT NOT NULL,
  `mat_id` VARCHAR(30) NOT NULL,
  `QTY` INT NULL,
  `dochead_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`itemlist_id`, `mat_id`, `dochead_id`),
  INDEX `fk_itemlist_materials1_idx` (`mat_id` ASC),
  INDEX `fk_itemlist_Docheader1_idx` (`dochead_id` ASC),
  CONSTRAINT `fk_itemlist_materials1`
    FOREIGN KEY (`mat_id`)
    REFERENCES `SD`.`materials` (`mat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemlist_Docheader1`
    FOREIGN KEY (`dochead_id`)
    REFERENCES `SD`.`Docheader` (`dochead_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`itemlist_Price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`itemlist_Price` (
  `price_id` INT NOT NULL,
  `scale_price_id` INT NOT NULL,
  `pricing_con_id` INT NOT NULL,
  `mat_id` VARCHAR(30) NOT NULL,
  `itemlist_id` INT NOT NULL,
  PRIMARY KEY (`price_id`, `scale_price_id`, `pricing_con_id`, `mat_id`, `itemlist_id`),
  INDEX `fk_pricing_has_itemlist_itemlist1_idx` (`itemlist_id` ASC),
  INDEX `fk_pricing_has_itemlist_pricing1_idx` (`price_id` ASC, `scale_price_id` ASC, `pricing_con_id` ASC, `mat_id` ASC),
  CONSTRAINT `fk_pricing_has_itemlist_pricing1`
    FOREIGN KEY (`price_id` , `scale_price_id` , `pricing_con_id` , `mat_id`)
    REFERENCES `SD`.`pricing` (`price_id` , `scale_price_id` , `con_id` , `mat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pricing_has_itemlist_itemlist1`
    FOREIGN KEY (`itemlist_id`)
    REFERENCES `SD`.`itemlist` (`itemlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SD`.`sale_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SD`.`sale_order` (
  `sale_order_id` INT NOT NULL,
  `good_issue_date` DATE NULL,
  `invoice_date` VARCHAR(45) NULL,
  `dochead_id` VARCHAR(45) NOT NULL,
  `sales_Rep` VARCHAR(45) NULL,
  `terms` VARCHAR(45) NULL,
  `ship_address` VARCHAR(140) NULL,
  PRIMARY KEY (`sale_order_id`, `dochead_id`),
  INDEX `fk_sale_order_Docheader1_idx` (`dochead_id` ASC),
  CONSTRAINT `fk_sale_order_Docheader1`
    FOREIGN KEY (`dochead_id`)
    REFERENCES `SD`.`Docheader` (`dochead_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;