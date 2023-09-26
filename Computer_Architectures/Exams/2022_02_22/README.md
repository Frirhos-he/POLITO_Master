**Computer Architectures**

**Exam of 22/02/2022**

**A**
**Question 3 (8 points)**

In the fixed-point representation, a fixed number of digits is used to represent the fractional part of a number. Example of fixed-point number with 8 fractional digits: 101.10011101. The corresponding decimal value is 1 \* 2<sup>2</sup> + 0 \* 2<sup>1</sup> + 1 \* 2<sup>0</sup> + 1 \* 2<sup>-1</sup> + 0 \* 2<sup>-2</sup> + 0 \* 2<sup>-3</sup> +1 \* 2<sup>-4</sup> + 1 \* 2<sup>-5</sup> +1 \* 2<sup>-6</sup> + 0 \* 2<sup>-7</sup> + 1 \* 2<sup>-8</sup> = 4 + 0 + 1 + 0.5 + 0 + 0 + 0.0625 + 0.03125 + 0.015625 + 0 + 0.00390625 = 5.61328125

Write the computeF subroutine in ARM assembly language, which computes the following function: _f_(_x_, _y_) = (_x_ + _y_/_x_) / 2.

The subroutine receives in input:

1. _x_: a 32-bit value which represents an unsigned fixed-point number
1. _n_: the number of fractional digits in _x_
1. _y_: a 32-bit value which represents another unsigned fixed-point number
1. _m_: the number of fractional digits in _y_

The subroutine returns _f_(_x_, _y_), with a number of fractional digits equal to max(_n_, _m_).

Let _a_ be the number of fractional digits of the dividend, _b_ the number of fractional digits of the divisor, and _c_ the position of the leftmost bit set to 1 in the dividend (the bits are counted from left to right, i.e., the most significant bit is at position 0). First of all, in order to increase the precision of the division, the dividend must be shifted left by _c_ positions (in this way, the most significant bit is set to 1). Then, the result of the division between the two fixed-point numbers is computed as the integer quotient of their underlying integers. The number of fractional digits of the result is _d_ = _a_ + _c_ – _b_.

In order to add two fixed-point numbers, they must have the same number of fractional digits. If the number of fractional digits is different, the fixed-point number with few fractional digits must be shifted left by a proper number of positions.

It is suggested to implement the division by 2 with a right shift.

Example: _x_ = 0.11, _n_ = 2, _y_ = 101.001, _m_ = 3.

The '.' separating integer and fractional digits is shown only for the sake of clarity.

Step 1: division.

_a_ = 3, _b_ = 2, _c_ = 26.

y is shifted left by 26 positions

10100100000000000000000000000000 / 11 = 110110101010101010101010101010

_d_ = 3 + 26 – 2 = 27: the corresponding fixed-point number is 110.110101010101010101010101010

Step 2: addition.

_n_ < _d_, so _x_ is shifted left by _d_ – _n_ = 25 position.

0\.110000000000000000000000000 + 110.110101010101010101010101010 =

`	`= 111.100101010101010101010101010

Step 3: the division by 2 gives 11.110010101010101010101010101

The result is approximated to max(_n_, _m_) = 3 fractional digits: the subroutine returns 11.110

Important notes:

1. **Create a new project with Keil inside the “ARM” directory and write your code there.**
1. The assembly subroutine must comply with the ARM Architecture Procedure Call Standard (AAPCS) standard (about parameter passing, returned value, callee-saved registers).
1. Click on the following links to open web pages with the ARM instruction set

<http://www.keil.com/support/man/docs/armasm>

<https://developer.arm.com/documentation/ddi0337/e/Introduction/Instruction-set-summary?lang=en>

1. You can convert fixed-point numbers from/to base 2 and 10 at this link:

<https://www.exploringbinary.com/binary-converter/>

**Question 4 (5 points)**

The subroutine developed in the previous exercise can be called iteratively to compute the square root of a number _y_. In this exercise, we want to compute the square root of _y_ = 2022.

1. In a data area, allocate space for: - _numIteration_: a 32-bit variable - _arrayF_: an array of 10 elements; each element is a word (32 bits)

   Inizialize _numIteration_ to 0 and the first element of _arrayF_ to 1, to be represented as a fixed-point value with 12 fractional digits. The other elements are not initialized.

1. In the Reset_Handler, configure the SYSTICK timer in order to generate an interrupt every 2<sup>20</sup> clock cycles. Then, enter in an infinite loop.

   The SYSTICK timer is configured by means of the following registers: - Control and Status Register: size 32 bits, address 0xE000E010 - Reload Value Register: size 24 bits, address 0xE000E014 - Current Value Register: 24 bits, address 0xE000E018

   The meaning of the bits in the Control and Status Register is as follows: - Bit 16 (read-only): it is read as 1 if the counter reaches 0 since last time this register is read; it is cleared to 0 when read or when the current counter value is cleared - Bit 2 (read/write): if 1, the processor free running clock is used; if 0, an external reference clock is used - Bit 1 (read/write): if 1, an interrupt is generated when the timer reaches 0; if 0, the interrupt is not generated - Bit 0 (read/write): if 1, SYSTICK timer is enabled; if 0, SYSTICK timer is disabled.

   The Reload Value Register stores the value to reload when the timer reaches 0.
   The Current Value Register stores the current value of the timer. Writing any number clears its content.

1. In the handler of the SYSTICK timer, read the value of _numIteration_ stored in memory. It counts the number of times the computeF subroutine has been called so far. Get the value _k_ of the element of _arrayF_ at position _numIteration_. Call the computeF subroutine with the following parameters: _x_ = _k_, _n_ = 12, _y_ = 2022, _m_ = 0.
   Increment _numIteration_ by 1 and save the new result in memory.
   Get the value returned by computeF and save it in _arrayF_ at position _numIteration_ (after the increment, this is the first empty element of the array).
   Note that the computeF subroutine has to be called 10 times (at 10 different SYSTICK timer interrupts) because this is the lenght of _arrayF_. At the end, the last element of _arrayF_ stores the best approximation of the square root of 2022.

**Question 5 (6 points)**

Given a 3 x 4 matrix of bytes SOURCE representing two's complement numbers on 8 bits each one, write an 8086 assembly program which changes the sign of each element and transposes the matrix, i.e. reverses the columns and rows from SOURCE to DESTINATION, i.e.:

DESTINATION (i, j) = - SOURCE (j,i)

- SOURCE has 3 rows and 4 columns and the transposed DESTINATION has 4 rows and 3 columns
- Both SOURCE and DESTINATION are "cut" by rows to be mapped to the 8086 data memory
- It is known in advance that the absolute value of each element of SOURCE does not exceed 120
- BRUTE FORCE APPROACH (i.e., without "loops") IS NOT ACCEPTABLE
- In your solution, please provide the declaration of SOURCE and DESTINATION, the code, and significant comments to the code and instructions. The class program does not include input output, while the home code should include input of SOURCE and printing of DESTINATION
- HINT: cut by rows the two matrices SOURCE (a..l) and DESTINATION found below and depict the corresponding 8086 data memory mapping organizations; then find an algorithm to switch from the 8086 data memory mapping of SOURCE to that of DESTINATION
- The single-loop-smart-algorithm is eligible to get up to one extra point (do not ask what is this algorithm)

**Write your code in a file saved in the 8086 folder.**

Example (where a, ..., l represent 2's complement numbers in the range -120...+120)

SOURCE

a b c d

e f g h

i j k l

the following matrix DESTINATION is computed

-a -e -i

-b -f -j

-c -g -k

-d -h -l

\*\*

Initial matrix SOURCE

1 2 -3 4

-5 6 -7 8

-9 0 3 -1

the following matrix DESTINATION is computed

-1 5 9

-2 -6 0

3 7 -3

-4 -8 1

Click on the following link to open a web page with the 8086 instruction set:

<http://www.jegerlehner.ch/intel/IntelCodeTable.pdf>
