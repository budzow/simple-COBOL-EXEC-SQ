       EXEC SQL WHENEVER NOT FOUND PERFORM X001-SQL-ERROR END-EXEC
       EXEC SQL WHENEVER SQLERROR PERFORM X001-SQL-ERROR END-EXEC
       EXEC SQL WHENEVER SQLWARNING PERFORM X002-SQL-WARNING END-EXEC