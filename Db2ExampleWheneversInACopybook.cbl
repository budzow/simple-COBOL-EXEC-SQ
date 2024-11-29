       IDENTIFICATION DIVISION.
       PROGRAM-ID. Db2ExampleWheneversInACopybook.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       EXEC SQL INCLUDE SQLCA END-EXEC.

       PROCEDURE DIVISION.
           COPY WHENEVERS
		   
      * When WHENEVER directives are in a copybook (WHENEVERS)
      * the issue are raised for the first SQL
           EXEC SQL
               SELECT 1 FROM SYSIBM.SYSDUMMY1
           END-EXEC.

      * ...and the second...
           EXEC SQL
               SELECT 2 FROM SYSIBM.SYSDUMMY1
           END-EXEC.
		   
      *... and the following ones
           EXEC SQL
               SELECT 3 FROM SYSIBM.SYSDUMMY1
           END-EXEC.


           STOP RUN.

       X001-SQL-ERROR.
           DISPLAY 'SQL Error or No Data Found. SQLCODE: ' SQLCODE.
           STOP RUN.

       X002-SQL-WARNING.
           DISPLAY 'SQL Warning occurred. SQLCODE: ' SQLCODE.
           CONTINUE.