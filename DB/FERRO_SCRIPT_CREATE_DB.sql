-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `price` DECIMAL(9,2) NOT NULL,
  `description` VARCHAR(300) NULL,
  `width` DECIMAL(9,2) NOT NULL,
  `length` DECIMAL(9,2) NOT NULL,
  `color` VARCHAR(25) NOT NULL,
  `img_link` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `img_link_UNIQUE` (`img_link` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`privileges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`privileges` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `privilege` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `address` VARCHAR(450) NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(35) NOT NULL,
  `password` VARCHAR(45) NULL,
  `privileges_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `privileges_id`),
  INDEX `fk_users_privileges1_idx` (`privileges_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_users_privileges1`
    FOREIGN KEY (`privileges_id`)
    REFERENCES `mydb`.`privileges` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `order_date` TIMESTAMP NOT NULL,
  `total` DECIMAL(9,2) NOT NULL,
  `users_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_users1_idx` (`users_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders_has_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders_has_products` (
  `orders_id` BIGINT NOT NULL,
  `products_id` BIGINT NOT NULL,
  PRIMARY KEY (`orders_id`, `products_id`),
  INDEX `fk_orders_has_products_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_orders_has_products_orders1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_has_products_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `mydb`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
