-- Create the Loans table
CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    DueDate DATE
);
/

-- Insert sample loan records
INSERT INTO Loans (LoanID, CustomerID, DueDate)
VALUES (101, 1, SYSDATE + 10);

INSERT INTO Loans (LoanID, CustomerID, DueDate)
VALUES (102, 2, SYSDATE + 40);

INSERT INTO Loans (LoanID, CustomerID, DueDate)
VALUES (103, 3, SYSDATE + 25);

INSERT INTO Loans (LoanID, CustomerID, DueDate)
VALUES (104, 4, SYSDATE + 5);

INSERT INTO Loans (LoanID, CustomerID, DueDate)
VALUES (105, 5, SYSDATE + 60);

COMMIT;
/

-- View data
SELECT * FROM Loans;
/

-- Enable output
SET SERVEROUTPUT ON;

-- PL/SQL block to send reminders
DECLARE
    CURSOR loan_cursor IS
        SELECT LoanID, CustomerID, DueDate
        FROM Loans
        WHERE DueDate BETWEEN SYSDATE AND SYSDATE + 30;

BEGIN
    FOR loan_rec IN loan_cursor LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan ' || loan_rec.LoanID ||
            ' for Customer ' || loan_rec.CustomerID ||
            ' is due on ' ||
            TO_CHAR(loan_rec.DueDate, 'DD-MON-YYYY')
        );

    END LOOP;

END;
/