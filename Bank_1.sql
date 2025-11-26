-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bank
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bank` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bank` ;

-- -----------------------------------------------------
-- Table `bank`.`Branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Branches` (
  `BranchId` VARCHAR(11) NOT NULL,
  `IFSCCode` VARCHAR(11) NOT NULL,
  `BranchName` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  `BranchPhone` VARCHAR(45) NOT NULL,
  `BranchEmail` VARCHAR(45) NOT NULL,
  `ManagerId` VARCHAR(10) NOT NULL,
  `OperatingHours` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BranchId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Customers` (
  `CustomerId` CHAR(11) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NULL,
  `Gender` CHAR(1) NOT NULL,
  `DateOfBirth` DATE NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Phone` CHAR(10) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `PanNo` VARCHAR(10) NOT NULL,
  `Branches_BranchId` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`CustomerId`),
  INDEX `fk_Customers_Branches1_idx` (`Branches_BranchId` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_Branches1`
    FOREIGN KEY (`Branches_BranchId`)
    REFERENCES `bank`.`Branches` (`BranchId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Employees` (
  `EmployeeId` CHAR(8) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Gender` CHAR(1) NOT NULL,
  `Position` VARCHAR(45) NOT NULL,
  `EmpPhone` VARCHAR(45) NOT NULL,
  `EmpEmail` VARCHAR(45) NOT NULL,
  `Qualification` VARCHAR(45) NOT NULL,
  `Hiredate` DATE NOT NULL,
  `Branches_BranchId` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  INDEX `fk_Employees_Branches1_idx` (`Branches_BranchId` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_Branches1`
    FOREIGN KEY (`Branches_BranchId`)
    REFERENCES `bank`.`Branches` (`BranchId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Accounts` (
  `AccountNo` CHAR(11) NOT NULL,
  `AccountType` VARCHAR(45) NOT NULL,
  `Balance` DECIMAL(15) NOT NULL,
  `AccountStatus` VARCHAR(45) NOT NULL,
  `RegistrationDate` DATE NOT NULL,
  `OpenDate` DATE NOT NULL,
  `ClosedDate` DATE NULL,
  `Customers_CustomerId` CHAR(11) NOT NULL,
  PRIMARY KEY (`AccountNo`),
  INDEX `fk_Accounts_Customers1_idx` (`Customers_CustomerId` ASC) VISIBLE,
  CONSTRAINT `fk_Accounts_Customers1`
    FOREIGN KEY (`Customers_CustomerId`)
    REFERENCES `bank`.`Customers` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Cards` (
  `CardNumber` CHAR(16) NOT NULL,
  `CardType` VARCHAR(45) NOT NULL,
  `ExpiryDate` DATE NOT NULL,
  `CardStatus` VARCHAR(45) NOT NULL,
  `Customers_CustomerId` CHAR(11) NOT NULL,
  PRIMARY KEY (`CardNumber`),
  INDEX `fk_Cards_Customers1_idx` (`Customers_CustomerId` ASC) VISIBLE,
  CONSTRAINT `fk_Cards_Customers1`
    FOREIGN KEY (`Customers_CustomerId`)
    REFERENCES `bank`.`Customers` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Transactions` (
  `TransactionId` CHAR(12) NOT NULL,
  `TransactionType` VARCHAR(45) NOT NULL,
  `Amount` DECIMAL NOT NULL,
  `DateTime` DATETIME NOT NULL,
  `Accounts_AccountNo` CHAR(11) NOT NULL,
  PRIMARY KEY (`TransactionId`),
  INDEX `fk_Transactions_Accounts1_idx` (`Accounts_AccountNo` ASC) VISIBLE,
  CONSTRAINT `fk_Transactions_Accounts1`
    FOREIGN KEY (`Accounts_AccountNo`)
    REFERENCES `bank`.`Accounts` (`AccountNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`TransactionStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`TransactionStatus` (
  `StatusId` CHAR(11) NOT NULL,
  `StatusType` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Timestamp` TIMESTAMP(6) NOT NULL,
  `Transactions_TransactionId` CHAR(12) NOT NULL,
  PRIMARY KEY (`StatusId`),
  INDEX `fk_TransactionStatus_Transactions1_idx` (`Transactions_TransactionId` ASC) VISIBLE,
  CONSTRAINT `fk_TransactionStatus_Transactions1`
    FOREIGN KEY (`Transactions_TransactionId`)
    REFERENCES `bank`.`Transactions` (`TransactionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`ATM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`ATM` (
  `ATMid` CHAR(12) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `OperatingHours` VARCHAR(45) NOT NULL,
  `SupportedTransactions` VARCHAR(45) NOT NULL,
  `Branches_BranchId` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`ATMid`),
  INDEX `fk_ATM_Branches1_idx` (`Branches_BranchId` ASC) VISIBLE,
  CONSTRAINT `fk_ATM_Branches1`
    FOREIGN KEY (`Branches_BranchId`)
    REFERENCES `bank`.`Branches` (`BranchId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Loan` (
  `LoanId` CHAR(16) NOT NULL,
  `LoanType` VARCHAR(45) NOT NULL,
  `PrincipalAmount` DECIMAL NOT NULL,
  `InterestRate` DECIMAL NOT NULL,
  `TermMonths` INT NOT NULL,
  `DisbursementDate` DATE NOT NULL,
  `PaymentStartdate` DATE NOT NULL,
  `CurrentOutstandingBalance` DECIMAL NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Customers_CustomerId` CHAR(11) NOT NULL,
  `Branches_BranchId` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`LoanId`),
  INDEX `fk_Loan_Customers1_idx` (`Customers_CustomerId` ASC) VISIBLE,
  INDEX `fk_Loan_Branches1_idx` (`Branches_BranchId` ASC) VISIBLE,
  CONSTRAINT `fk_Loan_Customers1`
    FOREIGN KEY (`Customers_CustomerId`)
    REFERENCES `bank`.`Customers` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loan_Branches1`
    FOREIGN KEY (`Branches_BranchId`)
    REFERENCES `bank`.`Branches` (`BranchId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`LoanSchedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`LoanSchedule` (
  `ScheduleId` CHAR(10) NOT NULL,
  `PaymentNumber` INT NOT NULL,
  `DueDate` DATE NOT NULL,
  `ScheduledAmount` DECIMAL NOT NULL,
  `ScheduledPrincipal` DECIMAL NULL,
  `ScheduledInterest` DECIMAL NULL,
  `IsPaid` CHAR(1) NOT NULL,
  `Loan_LoanId` CHAR(16) NOT NULL,
  PRIMARY KEY (`ScheduleId`),
  INDEX `fk_LoanSchedule_Loan1_idx` (`Loan_LoanId` ASC) VISIBLE,
  CONSTRAINT `fk_LoanSchedule_Loan1`
    FOREIGN KEY (`Loan_LoanId`)
    REFERENCES `bank`.`Loan` (`LoanId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`LoanPayment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`LoanPayment` (
  `PaymentId` CHAR(12) NOT NULL,
  `PaymentDate` DATE NOT NULL,
  `PaymentAmount` DECIMAL NOT NULL,
  `Loan_LoanId` CHAR(16) NOT NULL,
  `Transactions_TransactionId` CHAR(12) NOT NULL,
  PRIMARY KEY (`PaymentId`),
  INDEX `fk_LoanPayment_Loan1_idx` (`Loan_LoanId` ASC) VISIBLE,
  INDEX `fk_LoanPayment_Transactions1_idx` (`Transactions_TransactionId` ASC) VISIBLE,
  CONSTRAINT `fk_LoanPayment_Loan1`
    FOREIGN KEY (`Loan_LoanId`)
    REFERENCES `bank`.`Loan` (`LoanId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LoanPayment_Transactions1`
    FOREIGN KEY (`Transactions_TransactionId`)
    REFERENCES `bank`.`Transactions` (`TransactionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`PPFAccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`PPFAccount` (
  `PPFid` CHAR(11) NOT NULL,
  `OpenDate` DATE NOT NULL,
  `OriginalMaturitydate` DATE NOT NULL,
  `ExtensionBlocksTaken` INT NULL,
  `CurrentStatus` VARCHAR(45) NOT NULL,
  `CurrentBalance` DECIMAL NOT NULL,
  `Customers_CustomerId` CHAR(11) NOT NULL,
  PRIMARY KEY (`PPFid`),
  INDEX `fk_PPFAccount_Customers1_idx` (`Customers_CustomerId` ASC) VISIBLE,
  CONSTRAINT `fk_PPFAccount_Customers1`
    FOREIGN KEY (`Customers_CustomerId`)
    REFERENCES `bank`.`Customers` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`PPFTransaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`PPFTransaction` (
  `PPFTransiD` CHAR(11) NOT NULL,
  `TransactionDate` DATE NOT NULL,
  `FinancialYear` YEAR(4) NOT NULL,
  `TransactionType` VARCHAR(45) NOT NULL,
  `Amount` DECIMAL NOT NULL,
  `PPFAccount_PPFid` CHAR(11) NOT NULL,
  `Accounts_AccountNo` CHAR(11) NOT NULL,
  PRIMARY KEY (`PPFTransiD`),
  INDEX `fk_PPFTransaction_PPFAccount1_idx` (`PPFAccount_PPFid` ASC) VISIBLE,
  INDEX `fk_PPFTransaction_Accounts1_idx` (`Accounts_AccountNo` ASC) VISIBLE,
  CONSTRAINT `fk_PPFTransaction_PPFAccount1`
    FOREIGN KEY (`PPFAccount_PPFid`)
    REFERENCES `bank`.`PPFAccount` (`PPFid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PPFTransaction_Accounts1`
    FOREIGN KEY (`Accounts_AccountNo`)
    REFERENCES `bank`.`Accounts` (`AccountNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`FD_Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`FD_Account` (
  `FDid` CHAR(11) NOT NULL,
  `PrincipalAmount` DECIMAL NOT NULL,
  `InterestRate` DECIMAL(2,2) NOT NULL,
  `TermMonths` INT NOT NULL,
  `OpenDate` DATE NOT NULL,
  `MaturityDate` DATE NOT NULL,
  `InterestPayoutFrequency` VARCHAR(45) NOT NULL,
  `MaturityInstruction` VARCHAR(45) NULL,
  `FDStatus` VARCHAR(45) NOT NULL,
  `Customers_CustomerId` CHAR(11) NOT NULL,
  `Accounts_AccountNo` CHAR(11) NOT NULL,
  PRIMARY KEY (`FDid`),
  INDEX `fk_FD_Account_Customers1_idx` (`Customers_CustomerId` ASC) VISIBLE,
  INDEX `fk_FD_Account_Accounts1_idx` (`Accounts_AccountNo` ASC) VISIBLE,
  CONSTRAINT `fk_FD_Account_Customers1`
    FOREIGN KEY (`Customers_CustomerId`)
    REFERENCES `bank`.`Customers` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FD_Account_Accounts1`
    FOREIGN KEY (`Accounts_AccountNo`)
    REFERENCES `bank`.`Accounts` (`AccountNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
