       IDENTIFICATION DIVISION.
       PROGRAM-ID. HelloWorldTests.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Hello PIC X(13).
       01 WS-CNT PIC 9 VALUE 0.
       01 WS-MAX PIC 9 VALUE 0.
       01 Tests.
        03 Test1.
            05 WS-T-Enabled PIC X VALUE '1'.
            05 WS-T-Name PIC X(5) VALUE 'Test1'.
            05 WS-T-Func PIC X(10) VALUE 'HelloWorld'.
            05 WS-T-Answer PIC X(13) VALUE 'Hello, World!'.
        03 Test2.
            05 WS-T-Enabled PIC X VALUE '0'.
            05 WS-T-Name PIC X(5) VALUE 'Test1'.
            05 WS-T-Func PIC X(10) VALUE 'HelloWorld'.
            05 WS-T-Answer PIC X(13) VALUE 'Hello, World!'.
       01 TestGroup REDEFINES Tests.
        03 TestList OCCURS 2 TIMES.
            05 WS-TL-Enabled PIC X.
            05 WS-TL-Name PIC X(5).
            05 WS-TL-Func PIC X(10).
            05 WS-TL-Answer PIC X(13).
       01 TestItem.
            03 WS-TI-Enabled PIC X.
            03 WS-TI-Name PIC X(5).
            03 WS-TI-Func PIC X(10).
            03 WS-TI-Answer PIC X(13).
       PROCEDURE DIVISION.
            COMPUTE WS-MAX = LENGTH OF TestGroup / LENGTH OF Test1.
            PERFORM 10-TEST 
                VARYING WS-CNT 
                FROM 1 
                BY 1 
                UNTIL WS-CNT > WS-MAX
            STOP RUN.
       10-TEST.
            MOVE TestList(WS-CNT) TO TestItem.
            IF WS-TI-Enabled = '1'
                CALL WS-TI-Func USING BY REFERENCE Hello
                IF Hello = WS-TI-Answer 
                    DISPLAY "Pass"
                ELSE
                    DISPLAY "Fail"
                END-IF
            END-IF.
    