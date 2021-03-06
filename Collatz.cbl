       IDENTIFICATION DIVISION.
       PROGRAM-ID. Collatz.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       LINKAGE SECTION.
       01 LS-COUNT PIC 9(5).
       01 LS-START PIC 9(5).
       PROCEDURE DIVISION USING LS-START RETURNING LS-COUNT.
       01-START.
        IF LS-START <= 0
            MOVE -1 TO LS-COUNT
            EXIT PROGRAM
        END-IF.
        MOVE ZEROES TO LS-COUNT.
        PERFORM 02-COLLATZ WITH TEST BEFORE UNTIL LS-START = 1.
        STOP RUN.
       02-COLLATZ.
        IF FUNCTION REM(LS-START, 2) = 0
          ADD 1 TO LS-COUNT
          DIVIDE LS-START BY 2 GIVING LS-START 
        ELSE
          ADD 1 TO LS-COUNT
          COMPUTE LS-START = LS-START * 3 + 1
        END-IF.

        