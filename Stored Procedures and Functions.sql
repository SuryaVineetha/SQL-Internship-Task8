-- =========================================
-- TASK 8: STORED PROCEDURES & FUNCTIONS
-- Using existing database ecommerce_db
-- =========================================
USE ecommerce_db;
-- --------------------------------------------------
-- 1. FUNCTION: fn_total_payment
--    Returns the total payment made by a given customer
-- --------------------------------------------------
DELIMITER //
CREATE FUNCTION fn_total_payment(p_customer_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE v_total DECIMAL(10,2);

  SELECT IFNULL(SUM(Amount), 0) INTO v_total
  FROM Payments
  WHERE Customer_ID = p_customer_id;

  RETURN v_total;
END;
//
DELIMITER ;
-- To test:
SELECT c.Name, fn_total_payment(c.Customer_ID) AS Total_Payment
FROM Customer c;
-- --------------------------------------------------
-- 2. PROCEDURE: sp_place_order
--    Inserts new order and payment for an existing customer
-- --------------------------------------------------
DELIMITER //
CREATE PROCEDURE sp_place_order(
  IN p_customer_id INT,
  IN p_amount DECIMAL(10,2),
  OUT p_order_id INT,
  OUT p_message VARCHAR(100)
)
BEGIN
  DECLARE v_exists INT;

  -- Check if customer exists
  SELECT COUNT(*) INTO v_exists
  FROM Customer
  WHERE Customer_ID = p_customer_id;

  IF v_exists = 0 THEN
    SET p_message = 'Customer not found';
    SET p_order_id = NULL;
  ELSE
    -- Insert into Orders table
    INSERT INTO Orders (Customer_ID, Order_Date)
    VALUES (p_customer_id, NOW());

    SET p_order_id = LAST_INSERT_ID();

    -- Insert into Payments table
    INSERT INTO Payments (Order_ID, Customer_ID, Amount, Payment_Date)
    VALUES (p_order_id, p_customer_id, p_amount, NOW());

    SET p_message = 'Order and Payment recorded successfully';
  END IF;
END;
//
DELIMITER ;

-- To test:
-- SET @oid = 0;
-- SET @msg = '';
-- CALL sp_place_order(1, 300.00, @oid, @msg);
-- SELECT @oid AS NewOrderID, @msg AS Message;


-- --------------------------------------------------
-- 3. PROCEDURE: sp_customer_summary
--    Shows each customer’s orders and total payments
-- --------------------------------------------------
DELIMITER //
CREATE PROCEDURE sp_customer_summary()
BEGIN
  SELECT 
    c.Customer_ID,
    c.Name AS Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    fn_total_payment(c.Customer_ID) AS Total_Payment
  FROM Customer c
  LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID
  GROUP BY c.Customer_ID, c.Name;
END;
//
DELIMITER ;

-- To test:
-- CALL sp_customer_summary();
