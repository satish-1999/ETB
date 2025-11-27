# ETB
<div style="text-align: center;"> <h3></h3> <p><strong>Database Management Project</strong></p>
<p><strong>Group: 15</strong></p>


<p text-align: center><strong>Submitted to:</strong></p>
<p><strong>Prof. Ashok Harnal</strong></p>


<p text-align: center><strong>Submitted By:</strong></p>

<ul>
    <li>Satish Chandra - 341168</li>
    <li>Komal Garg - 341150</li>
    <li>Dikshita Modi - 341134</li>
</ul>
</div>


<div style="width: 70%; margin: 20px auto; padding: 10px; border: 1px solid #eee; background-color: #f9f9f9;">
    <p><strong>Project Description:</strong></p>
    <p style="text-align: justify; margin: 0 10px;">
        This project presents the design and implementation of a Banking Management System (BMS) using MySQL as the relational database. The goal is to build a secure, consistent and efficient backend for core banking functions. The system supports customer account management, transaction processing such as deposits, withdrawals and fund transfers, along with loan tracking. It also includes support for PPF and fixed deposit accounts.
    </p>
</div>

<table border="1">
    <thead>
        <tr><th colspan="4" style="text-align: center;">1. Core Entity Tables</th></tr>
        <tr><th>Table Name</th><th>Column Name</th><th>Data Type</th><th>Constraint/Notes</th></tr>
    </thead>
    <tbody>
        <tr><td rowspan="8"><b>Branches</b></td><td><code>BranchId</code></td><td>VARCHAR(11)</td><td><b>PK</b></td></tr>
        <tr><td><code>IFSCCode</code></td><td>VARCHAR(11)</td><td>NOT NULL</td></tr>
        <tr><td><code>BranchName</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Location</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>BranchPhone</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>BranchEmail</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>ManagerId</code></td><td>VARCHAR(10)</td><td>NOT NULL</td></tr>
        <tr><td><code>OperatingHours</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td rowspan="9"><b>Employees</b></td><td><code>EmployeeId</code></td><td>CHAR(8)</td><td><b>PK</b></td></tr>
        <tr><td><code>Name</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Gender</code></td><td>CHAR(1)</td><td>NOT NULL</td></tr>
        <tr><td><code>Position</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>EmpPhone</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>EmpEmail</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Qualification</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Hiredate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>Branches_BranchId</code></td><td>VARCHAR(11)</td><td><b>FK</b> to <code>Branches</code></td></tr>
        <tr><td rowspan="13"><b>Customers</b></td><td><code>CustomerId</code></td><td>CHAR(11)</td><td><b>PK</b></td></tr>
        <tr><td><code>FirstName</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>LastName</code></td><td>VARCHAR(45)</td><td>NULL</td></tr>
        <tr><td><code>Gender</code></td><td>CHAR(1)</td><td>NOT NULL</td></tr>
        <tr><td><code>DateOfBirth</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>Address</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>City</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>State</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Country</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Phone</code></td><td>CHAR(10)</td><td>NOT NULL</td></tr>
        <tr><td><code>Email</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>PanNo</code></td><td>VARCHAR(10)</td><td>NOT NULL</td></tr>
        <tr><td><code>Branches_BranchId</code></td><td>VARCHAR(11)</td><td><b>FK</b> to <code>Branches</code></td></tr>
        <tr><td rowspan="8"><b>Accounts</b></td><td><code>AccountNo</code></td><td>CHAR(11)</td><td><b>PK</b></td></tr>
        <tr><td><code>AccountType</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Balance</code></td><td>DECIMAL(15)</td><td>NOT NULL</td></tr>
        <tr><td><code>AccountStatus</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>RegistrationDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>OpenDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>ClosedDate</code></td><td>DATE</td><td>NULL</td></tr>
        <tr><td><code>Customers_CustomerId</code></td><td>CHAR(11)</td><td><b>FK</b> to <code>Customers</code></td></tr>
    </tbody>
</table>

<br>

<table border="1">
    <thead>
        <tr><th colspan="4" style="text-align: center;">2. Transaction & Service Tables</th></tr>
        <tr><th>Table Name</th><th>Column Name</th><th>Data Type</th><th>Constraint/Notes</th></tr>
    </thead>
    <tbody>
        <tr><td rowspan="5"><b>Transactions</b></td><td><code>TransactionId</code></td><td>CHAR(12)</td><td><b>PK</b></td></tr>
        <tr><td><code>TransactionType</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Amount</code></td><td>DECIMAL</td><td>NOT NULL</td></tr>
        <tr><td><code>DateTime</code></td><td>DATETIME</td><td>NOT NULL</td></tr>
        <tr><td><code>Accounts_AccountNo</code></td><td>CHAR(11)</td><td><b>FK</b> to <code>Accounts</code></td></tr>
        <tr><td rowspan="5"><b>TransactionStatus</b></td><td><code>StatusId</code></td><td>CHAR(11)</td><td><b>PK</b></td></tr>
        <tr><td><code>StatusType</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Description</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Timestamp</code></td><td>TIMESTAMP(6)</td><td>NOT NULL</td></tr>
        <tr><td><code>Transactions_TransactionId</code></td><td>CHAR(12)</td><td><b>FK</b> to <code>Transactions</code></td></tr>
        <tr><td rowspan="5"><b>Cards</b></td><td><code>CardNumber</code></td><td>CHAR(16)</td><td><b>PK</b></td></tr>
        <tr><td><code>CardType</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>ExpiryDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>CardStatus</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Customers_CustomerId</code></td><td>CHAR(11)</td><td><b>FK</b> to <code>Customers</code></td></tr>
        <tr><td rowspan="6"><b>ATM</b></td><td><code>ATMid</code></td><td>CHAR(12)</td><td><b>PK</b></td></tr>
        <tr><td><code>Location</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Status</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>OperatingHours</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>SupportedTransactions</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Branches_BranchId</code></td><td>VARCHAR(11)</td><td><b>FK</b> to <code>Branches</code></td></tr>
    </tbody>
</table>

<br>

<table border="1">
    <thead>
        <tr><th colspan="4" style="text-align: center;">3. Financial Product Tables</th></tr>
        <tr><th>Table Name</th><th>Column Name</th><th>Data Type</th><th>Constraint/Notes</th></tr>
    </thead>
    <tbody>
        <tr><td rowspan="11"><b>Loan</b></td><td><code>LoanId</code></td><td>CHAR(16)</td><td><b>PK</b></td></tr>
        <tr><td><code>LoanType</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>PrincipalAmount</code></td><td>DECIMAL</td><td>NOT NULL</td></tr>
        <tr><td><code>InterestRate</code></td><td>DECIMAL</td><td>NOT NULL</td></tr>
        <tr><td><code>TermMonths</code></td><td>INT</td><td>NOT NULL</td></tr>
        <tr><td><code>DisbursementDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>PaymentStartdate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>CurrentOutstandingBalance</code></td><td>DECIMAL</td><td>NOT NULL</td></tr>
        <tr><td><code>Status</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Customers_CustomerId</code></td><td>CHAR(11)</td><td><b>FK</b> to <code>Customers</code></td></tr>
        <tr><td><code>Branches_BranchId</code></td><td>VARCHAR(11)</td><td><b>FK</b> to <code>Branches</code></td></tr>
        <tr><td rowspan="8"><b>LoanSchedule</b></td><td><code>ScheduleId</code></td><td>CHAR(10)</td><td><b>PK</b></td></tr>
        <tr><td><code>PaymentNumber</code></td><td>INT</td><td>NOT NULL</td></tr>
        <tr><td><code>DueDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>ScheduledAmount</code></td><td>DECIMAL</td><td>NOT NULL</td></tr>
        <tr><td><code>ScheduledPrincipal</code></td><td>DECIMAL</td><td>NULL</td></tr>
        <tr><td><code>ScheduledInterest</code></td><td>DECIMAL</td><td>NULL</td></tr>
        <tr><td><code>IsPaid</code></td><td>CHAR(1)</td><td>NOT NULL</td></tr>
        <tr><td><code>Loan_LoanId</code></td><td>CHAR(16)</td><td><b>FK</b> to <code>Loan</code></td></tr>
        <tr><td rowspan="5"><b>LoanPayment</b></td><td><code>PaymentId</code></td><td>CHAR(12)</td><td><b>PK</b></td></tr>
        <tr><td><code>PaymentDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>PaymentAmount</code></td><td>DECIMAL</td><td>NOT NULL</td></tr>
        <tr><td><code>Loan_LoanId</code></td><td>CHAR(16)</td><td><b>FK</b> to <code>Loan</code></td></tr>
        <tr><td><code>Transactions_TransactionId</code></td><td>CHAR(12)</td><td><b>FK</b> to <code>Transactions</code></td></tr>
        <tr><td rowspan="7"><b>PPFAccount</b></td><td><code>PPFid</code></td><td>CHAR(11)</td><td><b>PK</b></td></tr>
        <tr><td><code>OpenDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>OriginalMaturitydate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>ExtensionBlocksTaken</code></td><td>INT</td><td>NULL</td></tr>
        <tr><td><code>CurrentStatus</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>CurrentBalance</code></td><td>DECIMAL</td><td>NOT NULL</td></tr>
        <tr><td><code>Customers_CustomerId</code></td><td>CHAR(11)</td><td><b>FK</b> to <code>Customers</code></td></tr>
        <tr><td rowspan="7"><b>PPFTransaction</b></td><td><code>PPFTransiD</code></td><td>CHAR(11)</td><td><b>PK</b></td></tr>
        <tr><td><code>TransactionDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>FinancialYear</code></td><td>YEAR(4)</td><td>NOT NULL</td></tr>
        <tr><td><code>TransactionType</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Amount</code></td><td>DECIMAL</td><td>NOT NULL</td></tr>
        <tr><td><code>PPFAccount_PPFid</code></td><td>CHAR(11)</td><td><b>FK</b> to <code>PPFAccount</code></td></tr>
        <tr><td><code>Accounts_AccountNo</code></td><td>CHAR(11)</td><td><b>FK</b> to <code>Accounts</code></td></tr>
        <tr><td rowspan="12"><b>FD_Account</b></td><td><code>FDid</code></td><td>CHAR(11)</td><td><b>PK</b></td></tr>
        <tr><td><code>PrincipalAmount</code></td><td>DECIMAL</td><td>NOT NULL</td></tr>
        <tr><td><code>InterestRate</code></td><td>DECIMAL(2,2)</td><td>NOT NULL</td></tr>
        <tr><td><code>TermMonths</code></td><td>INT</td><td>NOT NULL</td></tr>
        <tr><td><code>OpenDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>MaturityDate</code></td><td>DATE</td><td>NOT NULL</td></tr>
        <tr><td><code>InterestPayoutFrequency</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>MaturityInstruction</code></td><td>VARCHAR(45)</td><td>NULL</td></tr>
        <tr><td><code>FDStatus</code></td><td>VARCHAR(45)</td><td>NOT NULL</td></tr>
        <tr><td><code>Customers_CustomerId</code></td><td>CHAR(11)</td><td><b>FK</b> to <code>Customers</code></td></tr>
        <tr><td><code>Accounts_AccountNo</code></td><td>CHAR(11)</td><td><b>FK</b> to <code>Accounts</code></td></tr>
    </tbody>
</table>
