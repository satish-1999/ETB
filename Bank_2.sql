INSERT INTO Branches (BranchId, IFSCCode, BranchName, Location, BranchPhone, BranchEmail, ManagerId, OperatingHours) VALUES
('001001', 'SBIN0001001', 'Connaught Place', 'New Delhi', '9811011001', 'delhi.cp@bank.in', 'E001', '10:00-16:00'),
('002002', 'SBIN0002002', 'Fort Branch', 'Mumbai', '9820022002', 'mumbai.fort@bank.in', 'E003', '10:00-16:00'),
('003003', 'SBIN0003003', 'MG Road', 'Bengaluru', '9945033003', 'blore.mg@bank.in', 'E056', '10:00-16:00'),
('004004', 'SBIN0004004', 'Salt Lake', 'Kolkata', '9038044004', 'kol.sl@bank.in', 'E052', '10:00-16:00'),
('005005', 'SBIN0005005', 'Anna Nagar', 'Chennai', '9444055005', 'chennai.an@bank.in', 'E007', '10:00-16:00');

select * from Branches;

INSERT INTO Employees (EmployeeId, Name, Gender, Position, EmpPhone, EmpEmail, Qualification, Hiredate, Branches_BranchId) VALUES
('E001', 'Ajay Sharma', 'M', 'Branch Manager', '9999111111', 'a.sharma@bank.in', 'MBA', '2018-05-15', '001001'),
('E002', 'Priya Verma', 'F', 'Loan Officer', '9999222222', 'p.verma@bank.in', 'B.Com', '2019-01-20', '002002'),
('E003', 'Rakesh Singh', 'M', 'Branch Mangager', '9999333333', 'r.singh@bank.in', 'MBA', '2017-11-10', '003003'),
('E004', 'Neha Gupta', 'F', 'Customer Service', '9999444444', 'n.gupta@bank.in', 'CA', '2020-03-01', '004004'),
('E005', 'Suresh Nair', 'M', 'Auditor', '9999555555', 's.nair@bank.in', 'PGDBM', '2021-08-25', '005005');

select * from employees;

INSERT INTO Customers (CustomerId, FirstName, LastName, Gender, DateOfBirth, Address, City, State, Country, Phone, Email, PanNo, Branches_BranchId) VALUES
('CUST00001', 'Rohan', 'Aggarwal', 'M', '1985-06-21', '1/A Karol Bagh', 'New Delhi', 'Delhi', 'India', '9876543210', 'r.aggarwal@email.com', 'AGGRH0001Z', '001001'),
('CUST00002', 'Deepika', 'Reddy', 'F', '1990-11-05', '45 Residency Rd', 'Mumbai', 'Maharashtra', 'India', '9876543211', 'd.reddy@email.com', 'REDDP0002Y', '002002'),
('CUST00003', 'Manoj', 'Kumar', 'M', '1975-03-10', '78 Marathahalli', 'Bengaluru', 'Karnataka', 'India', '9876543212', 'm.kumar@email.com', 'KUMAM0003X', '003003'),
('CUST00004', 'Sangeeta', 'Das', 'F', '1995-09-12', '10 Park Street', 'Kolkata', 'West Bengal', 'India', '9876543213', 's.das@email.com', 'DASSG0004W', '004004'),
('CUST00005', 'Vishnu', 'Iyer', 'M', '1988-02-28', '20 Adyar Road', 'Chennai', 'Tamil Nadu', 'India', '9876543214', 'v.iyer@email.com', 'IYERW0005V', '005005');

select * from customers;

INSERT INTO Accounts (AccountNo, AccountType, Balance, AccountStatus, RegistrationDate, OpenDate, ClosedDate, Customers_CustomerId) VALUES
('10000000001', 'Savings', 55000.50, 'Active', '2022-01-01', '2022-01-01', NULL, 'CUST00001'),
('10000000002', 'Current', 1500000.00, 'Active', '2022-02-15', '2022-02-15', NULL, 'CUST00002'),
('10000000003', 'Savings', 12000.75, 'Active', '2022-03-20', '2022-03-20', NULL, 'CUST00003'),
('10000000004', 'Savings', 89000.20, 'Active', '2022-04-10', '2022-04-10', NULL, 'CUST00004'),
('10000000005', 'Current', 250000.00, 'Active', '2022-05-01', '2022-05-01', NULL, 'CUST00005');

select * from accounts;

INSERT INTO Transactions (TransactionId, TransactionType, Amount, DateTime, Accounts_AccountNo) VALUES
('T0000000001', 'Deposit', 10000.00, '2023-11-25 10:00:00', '10000000001'),
('T0000000002', 'ATM Withdrawal', 5000.00, '2023-11-25 11:30:00', '10000000002'),
('T0000000003', 'UPI Payment', 2500.00, '2023-11-25 12:45:00', '10000000003'),
('T0000000004', 'NEFT Out', 50000.00, '2023-11-26 09:15:00', '10000000004'),
('T0000000005', 'Cheque Deposit', 100000.00, '2023-11-26 13:00:00', '10000000005');

select * from transactions;

INSERT INTO TransactionStatus (StatusId, StatusType, Description, Timestamp, Transactions_TransactionId) VALUES
('S0000000001', 'Completed', 'Transaction successful', '2023-11-25 10:00:05', 'T0000000001'),
('S0000000002', 'Completed', 'Cash dispensed', '2023-11-25 11:30:10', 'T0000000002'),
('S0000000003', 'Completed', 'Immediate payment done', '2023-11-25 12:45:05', 'T0000000003'),
('S0000000004', 'Processing', 'Waiting for beneficiary confirmation', '2023-11-26 09:15:30', 'T0000000004'),
('S0000000005', 'Pending', 'Cheque cleared on T+1 day', '2023-11-26 13:00:00', 'T0000000005');

select * from transactionstatus;

INSERT INTO Cards (CardNumber, CardType, ExpiryDate, CardStatus, Customers_CustomerId) VALUES
('4000111122223333', 'Debit-Rupay', '2028-12-31', 'Active', 'CUST00001'),
('5000444455556666', 'Credit-Visa', '2027-09-30', 'Active', 'CUST00002'),
('4000777788889999', 'Debit-Visa', '2026-05-31', 'Active', 'CUST00003'),
('5000123456789012', 'Credit-Master', '2029-01-31', 'Blocked', 'CUST00004'),
('4000987654321098', 'Debit-Rupay', '2025-03-31', 'Active', 'CUST00005');

select * from cards;

INSERT INTO ATM (ATMid, Location, Status, OperatingHours, SupportedTransactions, Branches_BranchId) VALUES
('ATM001001001', 'Near CP Metro Gate 6', 'Operational', '24 Hours', 'Cash, Balance Enquiry', '001001'),
('ATM002002001', 'Inside Fort Building', 'Operational', '10:00-18:00', 'Cash, Deposit', '002002'),
('ATM003003001', 'MG Road Basement', 'Maintenance', '10:00-16:00', 'Cash only', '003003'),
('ATM004004001', 'Near City Centre Mall', 'Operational', '24 Hours', 'Cash, Balance Enquiry, Mini Statement', '004004'),
('ATM005005001', 'Anna Nagar High Road', 'Operational', '24 Hours', 'All', '005005');

select * from atm;

INSERT INTO Loan (LoanId, LoanType, PrincipalAmount, InterestRate, TermMonths, DisbursementDate, PaymentStartdate, CurrentOutstandingBalance, Status, Customers_CustomerId, Branches_BranchId) VALUES
('L000000000000001', 'Home Loan', 5000000.00, 8.50, 240, '2023-10-01', '2023-11-01', 4985000.00, 'Active', 'CUST00001', '001001'),
('L000000000000002', 'Car Loan', 800000.00, 9.25, 60, '2023-08-01', '2023-09-01', 775000.00, 'Active', 'CUST00002', '002002'),
('L000000000000003', 'Personal Loan', 50000.00, 12.00, 12, '2023-11-20', '2023-12-20', 50000.00, 'Active', 'CUST00003', '003003'),
('L000000000000004', 'Education Loan', 1500000.00, 7.00, 180, '2022-07-01', '2023-07-01', 1450000.00, 'Active', 'CUST00004', '004004'),
('L000000000000005', 'Home Loan', 2500000.00, 8.25, 300, '2020-01-01', '2020-02-01', 2200000.00, 'Active', 'CUST00005', '005005');
select * from loan;

INSERT INTO LoanSchedule (ScheduleId, PaymentNumber, DueDate, ScheduledAmount, ScheduledPrincipal, ScheduledInterest, IsPaid, Loan_LoanId) VALUES
('LS00000001', 1, '2023-11-01', 43391.00, 1000.00, 42391.00, 'Y', 'L000000000000001'),
('LS00000002', 2, '2023-12-01', 43391.00, 1007.00, 42384.00, 'N', 'L000000000000001'),
('LS00000003', 4, '2023-12-01', 15000.00, 10000.00, 5000.00, 'N', 'L000000000000002'),
('LS00000004', 1, '2023-12-20', 4443.00, 4000.00, 443.00, 'N', 'L000000000000003'),
('LS00000005', 18, '2023-12-01', 13500.00, 5000.00, 8500.00, 'N', 'L000000000000004');

select * from loanschedule;

INSERT INTO LoanPayment (PaymentId, PaymentDate, PaymentAmount, Loan_LoanId, Transactions_TransactionId) VALUES
('LP0000000001', '2023-11-01', 43391.00, 'L000000000000001', 'T0000000001'), 
('LP0000000002', '2023-10-01', 15000.00, 'L000000000000002', 'T0000000002'), 
('LP0000000003', '2023-09-01', 15000.00, 'L000000000000002', 'T0000000003'),
('LP0000000004', '2023-11-01', 13500.00, 'L000000000000004', 'T0000000004'),
('LP0000000005', '2023-10-01', 20000.00, 'L000000000000005', 'T0000000005');

select * from loanpayment;

INSERT INTO PPFAccount (PPFid, OpenDate, OriginalMaturitydate, ExtensionBlocksTaken, CurrentStatus, CurrentBalance, Customers_CustomerId) VALUES
('PPF00000001', '2010-04-01', '2025-03-31', 0, 'Active', 1500000.00, 'CUST00001'),
('PPF00000002', '2015-08-15', '2030-08-14', 0, 'Active', 550000.00, 'CUST00003'),
('PPF00000003', '2005-12-01', '2021-11-30', 1, 'Extended', 2200000.00, 'CUST00004'),
('PPF00000004', '2020-03-01', '2035-02-28', 0, 'Active', 180000.00, 'CUST00005'),
('PPF00000005', '2018-01-01', '2033-12-31', 0, 'Active', 800000.00, 'CUST00002');

select * from ppfaccount;

INSERT INTO PPFTransaction (PPFTransiD, TransactionDate, FinancialYear, TransactionType, Amount, PPFAccount_PPFid, Accounts_AccountNo) VALUES
('PT000000001', '2023-06-15', 2023, 'Subscription', 50000.00, 'PPF00000001', '10000000001'),
('PT000000002', '2023-04-01', 2023, 'Subscription', 10000.00, 'PPF00000002', '10000000003'),
('PT000000003', '2023-08-01', 2023, 'Withdrawal', 5000.00, 'PPF00000003', '10000000004'),
('PT000000004', '2023-09-10', 2023, 'Subscription', 10000.00, 'PPF00000004', '10000000005'),
('PT000000005', '2023-05-20', 2023, 'Subscription', 20000.00, 'PPF00000005', '10000000002');

select * from ppftransaction;

INSERT INTO FD_Account (FDid, PrincipalAmount, InterestRate, TermMonths, OpenDate, MaturityDate, InterestPayoutFrequency, MaturityInstruction, FDStatus, Customers_CustomerId, Accounts_AccountNo) VALUES
('FD000000011', 100000.00, 0.750, 12, '2023-05-01', '2024-05-01', 'Quarterly', 'Auto Renew Principal', 'Active', 'CUST00002', '10000000002'),
('FD000000012', 500000.00, 0.780, 60, '2023-01-10', '2028-01-10', 'Cumulative', 'Credit to Account', 'Active', 'CUST00005', '10000000005'),
('FD000000013', 25000.00, 0.700, 6, '2023-11-01', '2024-05-01', 'Monthly', 'Credit to Account', 'Active', 'CUST00001', '10000000001'),
('FD000000014', 150000.00, 0.800, 24, '2022-10-20', '2024-10-20', 'Cumulative', 'Auto Renew Both', 'Active', 'CUST00003', '10000000003'),
('FD000000015', 75000.00, 0.725, 18, '2023-03-01', '2024-09-01', 'Quarterly', 'Credit to Account', 'Active', 'CUST00004', '10000000004');

select * from fd_account;

select CustomerId, FirstName, FDid, PrincipalAmount from customers join fd_account on customers.CustomerId=fd_account.Customers_CustomerId;