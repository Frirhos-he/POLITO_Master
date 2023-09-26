**Computer Architectures**

**Exam of 14/09/2022**

**A**

**Question 3 (6 points)**

The variables FIRST DW ? and SECOND DB ? store two unsigned integer numbers in fixed point binary, with different notations. For FIRST the fractional part extends over the least significant 12 bits, while for SECOND the fractional parts extends over the least significant 2 bits.

Compute the result of FIRST+SECOND, with maximum as possible precision and store the result to a variable RESULT whose length is defined by the programmer such as it has a sufficient number of bits to accommodate the result of the addition without any overflow error (and maximum precision too). Hint: start by computing how many integer bits and how many fractional bits for RESULT are necessary to guarantee no overflow and maximum precision.

BRUTE FORCE APPROACHES ARE NOT ACCEPTABLE; an ad-hoc solution, i.e. for these number of integer and fractional bit (but different data) is ok.

Comments are mandatory, as well a full and detailed explanation of the algorithm used.

For example:

FIRST = 1101.010111110001

SECOND = 111110.11

**Write your code in a file saved in the 8086 folder.**

Click on the following link to open a web page with the 8086 instruction set:

<http://www.jegerlehner.ch/intel/IntelCodeTable.pdf>

**Question 4 (8 points)**

The instruction set of ARM v7-M contains an instruction for the signed division with 32-bit operands: DIV Rd, Rn, Rm where Rd is the quotient, Rn is the dividend, and Rm is the divisor. You have to write the DIV64 subroutine in ARM assembly language, which computes the signed division between a 64-bit dividend and a 32-bit divisor, and returns a 32-bit quotient. The subroutine receives in input:

- U: the upper half of the dividend
- L: the lower half of the dividend
- D: the divisor

The following algorithm is used to compute the quotient Q:

1\. Inizialitation: X = 0, Y = 0, A = U, flag = false

2\. for i = 0 to 31:

3\. if U and D have the same sign:

4\. double the dividend: U = 2U, L = 2L

5\. U = U – D

6\. set i-th bit of X to 1

7\. else:

8\. double the dividend: U = 2U, L = 2L

9\. U = U + D

10\. set i-th bit of Y to 1

11\. if U == 0 AND i < 31:

12\. flag = true

13\. if U and D have different sign:

14\. if A and D have the same sign:

15\. U = U + D

16\. Y = Y + 1

17\. else:

18\. U = U - D

19\. X = X + 1

20\. else:

21\. if flag == true:

22\. U = U + D

23\. Y = Y + 1

24\. Return Q = X - Y

At points 4 and 8, you have to use the left shift (not multiplication) to double the dividend. The most significant bit of L becomes the least significant bit of U.

At points 6 and 10, the bits are counted from left to right. For example, bit 0 is the most significant one.

An example is given here considering 4-bit registers. You can easily extend it to the 32-bit case.

Example: U = 0010, L = 1001, D = 0110

Inizialitation: X = 0000, Y = 0000, A = 0010, flag = false

Iteration i = 0: U and D have the same sign

`	`U = 0101, L = 0010

`	`U = 0101 – 0110 = 1111

`	`X = 1000

Iteration i = 1: U and D have different sign

`	`U = 1110, L = 0100

`	`U = 1110 + 0110 = 0100

`	`Y = 0100

Iteration i = 2: U and D have the same sign

`	`U = 1000, L = 1000

`	`U = 1000 – 0110 = 0010

`	`X = 1010

Iteration i = 3: U and D have the same sign

`	`U = 0101, L = 0000

`	`U = 0101 – 0110 = 1111

`	`X = 1011

U and D have different sign

A and D have the same sign

U = U + D = 1111 + 0110 = 0101 this is the remainder of the division

Y = 0100 + 0001 = 0101

Q = 1011 – 0101 = 0110 this is the quotient

Important notes:

1. **Create a new project with Keil inside the “ARM” directory and write your code there.**
1. The assembly subroutine must comply with the ARM Architecture Procedure Call Standard (AAPCS) standard (about parameter passing, returned value, callee-saved registers).
1. Click on the following links to open web pages with the ARM instruction set

<http://www.keil.com/support/man/docs/armasm>

<https://developer.arm.com/documentation/ddi0337/e/Introduction/Instruction-set-summary?lang=en>

**Question 5 (5 points)**

Write the DIV64S subroutine, which extends the subroutine of the previous exercise by setting the flags in the Program Status Register (PSR). The bits in PSR are:

- Bit 31 (most significant bit): negative flag
- Bit 30: zero flag
- Bit 29: carry flag
- Bit 28: overflow flag
- Bit 27: sticky saturation flag
- Bit 26, 25, 15-10: interrupt-continuable instruction (ICI) bits, IF-THEN instruction status bit
- Bit 24: Thumb state
- Bit 8-0: exception number.

At the end of the procedure, the flags have to be:

- negative flag = first bit of the quotient
- zero flag = 1 if the quotient is zero; zero flag = 0 if the quotient is different from 0
- overflow flag = 1 if the quotient can not be stored in 32 bits; overflow flag = 0 otherwise.
- carry flag = 0

The procedure does not change the other bits in PSR.

The value of the overflow flag can be determined at the beginning of the subroutine by comparing the absolute values of U and D. If |2 \* U| >= |D|, then the overflow flag is 1, otherwise is 0.

Note: you do not have to copy duplicated code from the previous exercise. Write new instructions; you can write comments to indicate duplicated section of code.
