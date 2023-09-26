# **Computer Architectures**
# **Exam of 11.09.2020 - Part II**

Click here to open the web page of the manual:    <http://www.keil.com/support/man/docs/armasm> 

*Note*: Assembly subroutines must comply with the ARM Architecture Procedure Call Standard (AAPCS) standard (about parameter passing, returned value, callee-saved registers).

**Exercise 1** (8 points).  Let string1 and string2 be two strings containing at most 100 ASCII characters and ending with 0. Write the isContained subroutine that receives in input the addresses of the two strings and returns 1 if both the following conditions are satisfied:

- all characters of the second string are present in the first string
- if a characters appears multiple times in the second string, it must be present at least the same number of times (or more) in the first string.

If the two conditions are not satisfied, isContained returns 0.

The subroutine is case sensitive. The order of appearance of characters in the strings does not matter

Examples.

string1 = “computer architectures”

string2 = “spectrometer”

Return value is 1. Note that ‘r’ appears in string1 at least as many times as in string2.

string1 = “computer architectures”

string2 = “high temperatures”

Return value is 0 because ‘g’ does not appear in string1

string1 = “computer architectures”

string2 = “accurate search”

Return value is 0 because ‘a’ appears 3 times in string2 but only once in string1.

Example of calling code

`		`AREA variableDeclaration, DATA, READWRITE

mySpace	SPACE 128



AREA stringDefinition, DATA, READONLY

string1	DCB "computer architectures", 0

string2	DCB "accurate search", 0	

AREA    |.text|, CODE, READONLY

Reset\_Handler	PROC

LDR r0, =string1

LDR r1, =string2

`		`BL isContained	

`		`[...]

stop		B stop

ENDP

If you need, you can use the variableDeclaration area to write and read temporary values.

**Exercise 2** (3 points).  Write the isAnagram subroutine that receives in input the addresses of two strings and returns 1 if the two strings are anagram of each other, 0 otherwise.

Suggestion: you can call the isContained subroutine developed in the previous exercise.

Example.

string1 = "a teacher of computer architectures"

string2 = "accurate search or prefetch timeout"

Return value is 1.

Example of calling code

`		`AREA variableDeclaration, DATA, READWRITE

mySpace	SPACE 128



AREA stringDefinition, DATA, READONLY

string1	DCB " a teacher of computer architectures", 0

string2	DCB " accurate search or prefetch timeout", 0	

AREA    |.text|, CODE, READONLY

Reset\_Handler	PROC

LDR r0, =string1

LDR r1, =string2

`		`BL isAnagram	

`		`[...]

stop		B stop

ENDP

**Exercise 3** (9 points). Write the longestSubstring subroutine that receives in input the addresses of two strings and returns the length of the longest substring of string2 such that:

- each character of the substring is present in string1, with the same order of appearance
- the characters of the substring may appear not consecutively in string1
- the first character of the substring can be any character of string2

Example:

string1 = “computer architectures”

string2 = “accurate search”

The subroutine returns 6 because the longest substring has 6 characters. All possible cases are listed in the following table.

|Substring of string2|Number of characters appearing in the same order in string1|Characters appearing in the same order in string1 are underlined|
| :-: | :-: | :-: |
|accurate search|5|computer architectures|
|ccurate search|4|computer architectures|
|curate search|6|computer architectures|
|urate search|5|computer architectures|
|rate search|4|computer architectures|
|ate search|3|computer architectures|
|te search|4|computer architectures|
|e search|3|computer architectures|
|` `search|2|computer architectures|
|search|1|computer architectures|
|earch|5|computer architectures|
|arch|4|computer architectures|
|rch|3|computer architectures|
|ch|2|computer architectures|
|h|1|computer architectures|


Example of calling code

`		`AREA variableDeclaration, DATA, READWRITE

mySpace	SPACE 128



AREA stringDefinition, DATA, READONLY

string1	DCB " computer architectures", 0

string2	DCB " accurate search", 0	

AREA    |.text|, CODE, READONLY

Reset\_Handler	PROC

LDR r0, =string1

LDR r1, =string2

`		`BL longestSubstring	

`		`[...]

stop		B stop

ENDP



