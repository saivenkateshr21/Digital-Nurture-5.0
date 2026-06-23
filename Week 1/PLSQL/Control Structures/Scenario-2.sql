-- Create the Customers table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Balance NUMBER,
    IsVIP VARCHAR2(5)
);
/

-- Insert customer records
INSERT INTO Customers (CustomerID, Name, Balance, IsVIP)
VALUES (1, 'Alice', 9000, NULL);

INSERT INTO Customers (CustomerID, Name, Balance, IsVIP)
VALUES (2, 'Bob', 12000, NULL);

INSERT INTO Customers (CustomerID, Name, Balance, IsVIP)
VALUES (3, 'Charlie', 8000, NULL);

INSERT INTO Customers (CustomerID, Name, Balance, IsVIP)
VALUES (4, 'David', 15000, NULL);

INSERT INTO Customers (CustomerID, Name, Balance, IsVIP)
VALUES (5, 'Eve', 5000, NULL);

COMMIT;
/

-- View data before update
SELECT * FROM Customers;
/

-- Enable DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- PL/SQL block to promote customers to VIP status
DECLARE
    CURSOR all_customers IS
        SELECT CustomerID, Balance
        FROM Customers;
BEGIN
    FOR cust_rec IN all_customers LOOP

        IF cust_rec.Balance > 10000 THEN

            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = cust_rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                'CustomerID ' || cust_rec.CustomerID ||
                ' marked as VIP'
            );

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('VIP promotion completed.');

END;
/