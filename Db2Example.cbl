       IDENTIFICATION DIVISION.
       PROGRAM-ID. Db2Example.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       EXEC SQL INCLUDE SQLCA END-EXEC.

       PROCEDURE DIVISION.
           EXEC SQL WHENEVER NOT FOUND PERFORM X001-SQL-ERROR END-EXEC
           EXEC SQL WHENEVER SQLERROR PERFORM X001-SQL-ERROR END-EXEC
           EXEC SQL WHENEVER SQLWARNING PERFORM X002-SQL-WARNING END-EXEC

      * The handling of SQL errors in the 3 above lines will correctly 
      * suppress the issue raised for the first SQL...
           EXEC SQL
               SELECT 1 FROM SYSIBM.SYSDUMMY1
           END-EXEC.

      * ...but not for the second...
           EXEC SQL
               SELECT 2 FROM SYSIBM.SYSDUMMY1
           END-EXEC.
		   
      *... and following ones
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