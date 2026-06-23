-- Drop table if exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Employees';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create Employees table
CREATE TABLE Employees (
    EmpID NUMBER PRIMARY KEY,
    EmpName VARCHAR2(100),
    Department VARCHAR2(50),
    Salary NUMBER(10,2)
);
/

-- Insert sample data
INSERT INTO Employees VALUES (201, 'Aarav', 'Admin', 32000);
INSERT INTO Employees VALUES (202, 'Divya', 'Admin', 36000);
INSERT INTO Employees VALUES (203, 'Ritika', 'Tech', 45000);
INSERT INTO Employees VALUES (204, 'Sohan', 'Tech', 47000);

COMMIT;
/

-- View data before update
SELECT * FROM Employees;
/

-- Create procedure
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
)
IS
    v_updated_count NUMBER;
BEGIN

    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus_percent / 100)
    WHERE Department = p_department;

    v_updated_count := SQL%ROWCOUNT;

    DBMS_OUTPUT.PUT_LINE(
        'Bonus applied to ' ||
        v_updated_count ||
        ' employee(s) in ' ||
        p_department ||
        ' department.'
    );

    COMMIT;

END;
/

-- Enable output
SET SERVEROUTPUT ON;

-- Execute procedure
BEGIN
    UpdateEmployeeBonus('Admin', 10);
END;
/

-- View updated data
SELECT * FROM Employees;
/