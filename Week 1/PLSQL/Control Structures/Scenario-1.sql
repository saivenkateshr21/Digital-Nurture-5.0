-- Create the Customers table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Age NUMBER,
    InterestRate NUMBER
);

-- Insert customer records
INSERT INTO Customers (CustomerID, Name, Age, InterestRate)
VALUES (101, 'Anil', 70, 6);

INSERT INTO Customers (CustomerID, Name, Age, InterestRate)
VALUES (102, 'Ramesh', 63, 5);

INSERT INTO Customers (CustomerID, Name, Age, InterestRate)
VALUES (103, 'Karthik', 55, 4);

INSERT INTO Customers (CustomerID, Name, Age, InterestRate)
VALUES (104, 'Suresh', 66, 7);

INSERT INTO Customers (CustomerID, Name, Age, InterestRate)
VALUES (105, 'Raj', 42, 4);

COMMIT;

-- View data before update
SELECT * FROM Customers;

-- Enable DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- PL/SQL block to apply 1% discount on interest rates
-- for customers above 60 years old

DECLARE
    CURSOR all_customers IS
        SELECT CustomerID, Age, InterestRate
        FROM Customers;

    v_adjustedRate NUMBER;

BEGIN
    FOR cust_rec IN all_customers LOOP

        -- Check if customer age is above 60
        IF cust_rec.Age > 60 THEN

            -- Apply 1% discount
            v_adjustedRate := cust_rec.InterestRate * 0.99;

            -- Update the interest rate
            UPDATE Customers
            SET InterestRate = v_adjustedRate
            WHERE CustomerID = cust_rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                'CustomerID: ' || cust_rec.CustomerID ||
                ' | New InterestRate: ' || v_adjustedRate
            );

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest rate discount applied successfully.');

END;
/

-- View updated data
SELECT * FROM Customers;