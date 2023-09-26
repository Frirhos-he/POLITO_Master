<a name="br1"></a>

**Computer Architectures**

**Exam of 22/02/2022**

<a name="br7"></a>

**Computer Architectures**

**Exam of 22/02/2022**

**A**

**Question 5 (6 points)**

Given a 3 x 4 matrix of bytes SOURCE representing two's complement numbers on 8 bits each one,

write an 8086 assembly program which changes the sign of each element and transposes the matrix,

i.e. reverses the columns and rows from SOURCE to DESTINATION, i.e.:

DESTINATION (i, j) = - SOURCE (j,i)

• SOURCE has 3 rows and 4 columns and the transposed DESTINATION has 4 rows and 3

columns

• Both SOURCE and DESTINATION are "cut" by rows to be mapped to the 8086 data

memory

• It is known in advance that the absolute value of each element of SOURCE does not exceed

120

• BRUTE FORCE APPROACH (i.e., without "loops") IS NOT ACCEPTABLE

• In your solution, please provide the declaration of SOURCE and DESTINATION, the code,

and significant comments to the code and instructions. The class program does not include

input output, while the home code should include input of SOURCE and printing of

DESTINATION

• HINT: cut by rows the two matrices SOURCE (a..l) and DESTINATION found below and

depict the corresponding 8086 data memory mapping organizations; then find an algorithm

to switch from the 8086 data memory mapping of SOURCE to that of DESTINATION

• The single-loop-smart-algorithm is eligible to get up to one extra point (do not ask what is

this algorithm)

**Write your code in a file saved in the 8086 folder.**

Example (where a, ..., l represent 2's complement numbers in the range -120...+120)

SOURCE

a

e

i

b

f

c

g

k

d

h

l

j

the following matrix DESTINATION is computed

-a

-b

-c

-d

\*\*

-e

-f

-i

-j

-k

-l

-g

-h

<a name="br8"></a>

**Computer Architectures**

**Exam of 22/02/2022**

**A**

Initial matrix SOURCE

1

2

6

0

-3

-7

3

4

-5

-9

8

-1

the following matrix DESTINATION is computed

-1

-2

3

5

9

-6

7

0

-3

1

-4

-8

Click on the following link to open a web page with the 8086 instruction set:

http://www.jegerlehner.ch/intel/IntelCodeTable.pdf
