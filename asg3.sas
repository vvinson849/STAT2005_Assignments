/*
3a)
the "3" is incorrect
Suggested Correction: CARDS; or CARDS4;

3b)
Correct

3c)
Correct

3d)
The syntax for defining variable types is incorrect.
Suggested Correction: LENGTH NUMERIC 1 A $CHARACTER. B 12;

3e)
The comment signs are incorrect
Suggest Correction: * COMMENT;

3f)
the comment part is incorrect
Suggested Correction: /*  L IS NUMERIC */

/*
3g)
Correct

3h)
Variables should not have the same name.
Suggested Correction: INPUT X Y Z;

3i)
Missing quotation marks and ;
Suggested Correction:
INFILE 'C:\DATA.TXT';
INFILE "C:\DATA.TXT";

3j)
The quotation marks are not consistent
Suggested Correction:
LIBNAME A.B 'C:\';
LIBNAME A.B "C:\";
*/

* Q4a;
DATA PERSONNEL;
	LENGTH ID $4 DEPT $1 BIRTHDAY 8 YEAR 4 SALARY 8;
    INPUT DEPT 1 ID 1-4 BIRTHDAY:DATE9. YEAR 12-15 SALARY:COMMA8.;
CARDS;
A123   4Mar1989    8,60000
A037  23Jun1957   21,45000
M015  19Sep1977   17,50000
RUN;
* Q4b;
DATA PERSONNEL;
	INFILE DATALINES DLM=" $";
	LENGTH ID $4 DEPT $1 BIRTHDAY 8 YEAR 4 SALARY 8;
	INPUT ID BIRTHDAY:DATE9. SALARY:COMMA8. /;
	DEPT = ID;
	YEAR = YEAR(BIRTHDAY);
DATALINES;
A123  4Mar1989  8,6,00
***************
    A037 23Jun1957  21,450
**************
 M015 19Sep1977$17,500
***********
RUN;

