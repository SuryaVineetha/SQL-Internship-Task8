🧾 Task 8 – Stored Procedures & Functions

Course: SQL Developer Internship
Database: ecommerce_db
Task Type: Practical Implementation

📘 Overview

It focuses on implementing and understanding Stored Procedures and Functions using the existing ecommerce_db database created in earlier tasks.
The main goal is to perform database automation and reusable calculations without repeating the same SQL logic multiple times.

🎯 Objectives

Learn how to create and use Stored Procedures and Functions.

Understand IN, OUT, and local variables in SQL.

Automate database operations such as creating orders and payments.

Apply conditional logic (IF, ELSE, etc.) and grouping (GROUP BY) within stored routines.

Generate summarized data using SQL joins and functions together.

🧩 Implemented Components
1. SQL Function – Total Payment Calculation

A reusable function was created to calculate the total amount paid by each customer.
It helps quickly retrieve total payments without writing complex queries repeatedly.

2. Stored Procedure – Place Order

This procedure automates order creation for existing customers.
It checks if a customer exists, creates a new order, records the payment, and returns the new order ID with a success message.

3. Stored Procedure – Customer Summary

This procedure generates a summarized report showing each customer’s total number of orders and total payments made.
It combines multiple tables and uses the custom function to calculate results dynamically.

📊 Expected Output

The output displays a summarized view of each customer, including:

Customer ID

Customer Name

Total Orders Placed

Total Payment Made

🧠 Key Learnings
Concept	Description
Stored Procedure	A pre-written SQL program that performs a series of actions such as insert, update, or delete.
Function	A SQL routine that performs a calculation and returns a single value.
IN / OUT Parameters	IN sends data to a procedure, OUT sends data back as output.
DECLARE / SET	Used to create and assign values to variables inside stored routines.
SELECT INTO	Stores query results into variables.
IF...THEN...ELSE	Allows decision-making inside SQL procedures.
LAST_INSERT_ID()	Fetches the ID of the most recently inserted record.
LEFT JOIN	Combines rows from two tables and shows all records from the left table.
GROUP BY	Groups rows to calculate totals or counts for each category.
⚙️ Tools Used

MySQL Server 8.x

MySQL Workbench

Existing ecommerce_db database (created in previous tasks)

🏁 Conclusion

This task helped in understanding how Stored Procedures and Functions make SQL code:

More reusable,

Easier to maintain, and

More efficient for real-world applications.

It also strengthened the understanding of how database logic can be automated, reducing manual work and improving data consistency.
