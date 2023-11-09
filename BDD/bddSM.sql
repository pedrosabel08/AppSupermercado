-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projeto_supermercado
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto_supermercado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto_supermercado` DEFAULT CHARACTER SET utf8mb4 ;
USE `projeto_supermercado` ;

-- -----------------------------------------------------
-- Table `projeto_supermercado`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_supermercado`.`funcionarios` (
  `idfuncionarios` INT NOT NULL AUTO_INCREMENT,
  `nomef` VARCHAR(45) NOT NULL,
  `telefoneF` VARCHAR(45) NOT NULL,
  `cpfF` VARCHAR(45) NOT NULL,
  `cargoF` VARCHAR(45) NOT NULL,
  `salarioF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfuncionarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_supermercado`.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_supermercado`.`fornecedores` (
  `idfornecedores` INT NOT NULL AUTO_INCREMENT,
  `nomeFo` VARCHAR(45) NOT NULL,
  `cnpjFo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfornecedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_supermercado`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_supermercado`.`produtos` (
  `idprodutos` INT NOT NULL AUTO_INCREMENT,
  `nomeP` VARCHAR(45) NOT NULL,
  `marcaP` VARCHAR(45) NOT NULL,
  `precoP` VARCHAR(45) NOT NULL,
  `fornecedores_idfornecedores` INT NOT NULL,
  PRIMARY KEY (`idprodutos`),
  CONSTRAINT `fk_produtos_fornecedores1`
    FOREIGN KEY (`fornecedores_idfornecedores`)
    REFERENCES `projeto_supermercado`.`fornecedores` (`idfornecedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_supermercado`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_supermercado`.`venda` (
  `idvenda` INT NOT NULL AUTO_INCREMENT,
  `produtos_idprodutos` INT NOT NULL,
  `fornecedores_idfornecedores` INT NOT NULL,
  `funcionarios_idfuncionarios` INT NOT NULL,
  PRIMARY KEY (`idvenda`, `produtos_idprodutos`, `fornecedores_idfornecedores`, `funcionarios_idfuncionarios`),
  CONSTRAINT `fk_venda_produtos`
    FOREIGN KEY (`produtos_idprodutos`)
    REFERENCES `produtos` (`idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_fornecedores1`
    FOREIGN KEY (`fornecedores_idfornecedores`)
    REFERENCES `fornecedores` (`idfornecedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_funcionarios1`
    FOREIGN KEY (`funcionarios_idfuncionarios`)
    REFERENCES `funcionarios` (`idfuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
