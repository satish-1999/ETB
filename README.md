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

## Banking Database ER Diagram

![Banking ER Diagram](https://raw.githubusercontent.com/satish-1999/ETB/main/Banking_DB_page-0001.jpg)



<div style="width: 70%; margin: 20px auto; padding: 10px; border: 1px solid #eee; background-color: #f9f9f9;">
    <p><strong>Project Description:</strong></p>
    <p style="text-align: justify; margin: 0 10px;">
        This project presents the design and implementation of a Banking Management System (BMS) using MySQL as the relational database. The goal is to build a secure, consistent and efficient backend for core banking functions. The system supports customer account management, transaction processing such as deposits, withdrawals and fund transfers, along with loan tracking. It also includes support for PPF and fixed deposit accounts.
    </p>
</div>

<table>
  <thead>
    <tr>
      <th>Table Name</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Branches</strong></td>
      <td>Holds static information for every physical branch, including <strong>location</strong>, <strong>contact details</strong>, and <strong>operating hours</strong>.</td>
    </tr>
    <tr>
      <td><strong>Employees</strong></td>
      <td>Stores data for all bank staff, including their <strong>position</strong>, <strong>contact information</strong>, and the <strong>branch</strong> where they work.</td>
    </tr>
    <tr>
      <td><strong>Customers</strong></td>
      <td>Contains the <strong>personal demographics</strong> and primary <strong>contact information</strong> (address, phone, email, PAN) for all bank clients.</td>
    </tr>
    <tr>
      <td><strong>Accounts</strong></td>
      <td>Details the core bank accounts (Savings, Current) held by customers, including the <strong>account type</strong>, <strong>current balance</strong>, and <strong>status</strong>.</td>
    </tr>
    <tr>
      <td><strong>Transactions</strong></td>
      <td>A log of all financial movements, recording the <strong>transaction type</strong>, <strong>amount</strong>, and <strong>date/time</strong> associated with a specific bank account.</td>
    </tr>
    <tr>
      <td><strong>TransactionStatus</strong></td>
      <td>Tracks the <strong>current status</strong> (e.g., successful, failed) of individual <code>Transactions</code> with a timestamp and detailed description.</td>
    </tr>
    <tr>
      <td><strong>Cards</strong></td>
      <td>Registers all debit and credit cards issued to customers, tracking the <strong>card number</strong>, <strong>type</strong>, <strong>expiry date</strong>, and <strong>current status</strong>.</td>
    </tr>
    <tr>
      <td><strong>ATM</strong></td>
      <td>Maintains information on all Automated Teller Machines, including their <strong>location</strong>, <strong>status</strong>, and <strong>supported transaction types</strong>.</td>
    </tr>
    <tr>
      <td><strong>Loan</strong></td>
      <td>Records the specifics of every loan granted, such as <strong>principal amount</strong>, <strong>interest rate</strong>, <strong>term</strong>, and <strong>current outstanding balance</strong>.</td>
    </tr>
    <tr>
      <td><strong>LoanSchedule</strong></td>
      <td>Defines the <strong>expected future payments</strong> for a specific loan, including the <strong>due date</strong> and the breakdown of <strong>principal and interest</strong>.</td>
    </tr>
    <tr>
      <td><strong>LoanPayment</strong></td>
      <td>Logs every <strong>actual payment</strong> made against a loan, linking the payment amount and date back to a specific <strong>transaction</strong>.</td>
    </tr>
    <tr>
      <td><strong>PPFAccount</strong></td>
      <td>Manages the long-term Public Provident Fund accounts, noting the <strong>open date</strong>, <strong>maturity date</strong>, and <strong>current balance</strong>.</td>
    </tr>
    <tr>
      <td><strong>PPFTransaction</strong></td>
      <td>Tracks all deposits and withdrawals specific to a PPF account, linking the movement between the <strong>PPF account</strong> and a standard <strong>bank account</strong>.</td>
    </tr>
    <tr>
      <td><strong>FD_Account</strong></td>
      <td>Contains details of Fixed Deposit investments, including the <strong>principal</strong>, <strong>interest rate</strong>, <strong>term</strong>, and <strong>maturity instructions</strong>.</td>
    </tr>
  </tbody>
</table>
