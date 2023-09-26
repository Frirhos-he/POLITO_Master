**Computer Architectures
Exam of 20.12.2021**
=========================

**Question #3 (6 points)**

Given a 8 x 5 matrix of bytes SOURCE representing unsigned numbers, write a 8086 assembly program which computes on 16 bits (two’s complement) the addition of all cells with indexes (i,j) where i+j is an even value, minus all the cells whose i+j is an odd value. Please consider that i ranges from 0 to 7 and j ranges from 0 to 4.

Please add significant comments to the code and instructions.

Friendly advice: before starting to write down the code, think at a possible (very) simple algorithm! The choice of the algorithm highly influences the complexity and length of the code.

Example:

matrix SOURCE

1 2 3 4 5

6 7 8 9 0

9 8 7 6 5

4 3 2 1 0

7 7 7 7 7

3 5 7 9 0

8 7 6 5 4

9 9 9 3 2

the cells with i+j even are added up, while the cells with i+j odd are subtracted

1+3+5+7+9+9+ …

-2-4-6-8-0-….

The result will be clearly on 16 bits in two’s complement.

**Write your code in a file saved in the 8086 folder.**

**Question #4 (9 points)**

The IEEE-754 SP standard expresses floating-point numbers in 32 bits:

| 31   | 30       |       23 | 22  |   0 |
| ---- | :------- | -------: | :-- | --: |
| sign | exponent | mantissa |     |     |

Bit 31 is 0 if the number is positive, 1 if negative.

Write the addFPpositiveNumbers subroutine, which receives in input two 32-bit numbers, considers them as IEEE-754 SP floating point numbers, and returns their sum (in the same format). Bit 31 of the two input numbers is always 0 (i.e., the two numbers are positive).

In details, the subroutine implements the following steps:

1. take the mantissa of the two parameters
1. set bit 23 of the mantissa to 1
1. compare the two exponents. If they are equal, the exponent of the result is the same. If they are different:
   1. the exponent of the result is the highest one
   1. shift right the mantissa of the number with the lower exponent by as many position as the difference between the two exponents.
1. sum the two mantissas: this is the mantissa of the result. If bit 24 of the mantissa of the result is 1:
   1. shift right the mantissa of the result by one position
   1. increment the exponent of the result by one.
1. set bit 23 of the mantissa of the result to 0.
1. combine the mantissa and the exponent to get the final result.

Example: parameter1 = 0100 0010 0100 1011 0000 0000 0000 0000

parameter2 = 0100 0001 1010 0100 0000 0000 0000 0000

1. mantissa1 = 0000 0000 0100 1011 0000 0000 0000 0000
   mantissa2 = 0000 0000 0010 0100 0000 0000 0000 0000
1. mantissa1 = 0000 0000 1100 1011 0000 0000 0000 0000
   mantissa2 = 0000 0000 1010 0100 0000 0000 0000 0000
1. exponent1 = 1000 0100
   exponent2 = 1000 0011
   1. exponentResult = 1000 0100
   1. mantissa2 = 0000 0000 0101 0010 0000 0000 0000 0000
1. mantissaResult = 0000 0001 0001 1101 0000 0000 0000 0000
   1. mantissaResult = 0000 0000 1000 1110 1000 0000 0000 0000
   1. exponentResult = 1000 0101
1. mantissaResult = 0000 0000 0000 1110 1000 0000 0000 0000
1. result = 0100 0010 1000 1110 1000 0000 0000 0000

Click on the following links to open web pages with the ARM instruction set

<http://www.keil.com/support/man/docs/armasm>

<https://developer.arm.com/documentation/ddi0337/e/Introduction/Instruction-set-summary?lang=en>

Note: the assembly subroutine must comply with the ARM Architecture Procedure Call Standard (AAPCS) standard (about parameter passing, returned value, callee-saved registers).

**Create a new project with Keil inside the “template” directory and write your code there. The “template” directory contains the subdirectories “led” and “button” that you can add to your project if you need them.**

**Question #5 (4 points)**

Add a C file (e.g. sample.c) to the project created in the previous exercise.

Write here the main function (which needs to be called from the Reset handler).

Inside the main function, call the addFPpositiveNumbers subroutine, passing two floating-point numbers. If the result is zero or positive, switch on led 4 and switch off all other leds. If the result is negative, switch on led 5 and switch off all other leds.
6
