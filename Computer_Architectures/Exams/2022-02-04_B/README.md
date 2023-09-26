**Computer Architectures**

**Exam of 04/02/2022**

**B**

**Question 3 (6 points)**

Given the 4 x 4 matrix SOURCE of words storing only negative data (represented in two's complement on 16 bits), write an 8086 assembly program, which computes the entries of another 4 x 4 matrix MAPP of bytes, according to the following very simple rule:

If SOURCE (i, j) can be represented on 8 bits only, then MAPP (i,j) = -1

Otherwise MAPP (i,j) = 0

- The same program should also compute and store to the variable CROSS (on 16 bits) the sum of all the elements of SOURCE whose corresponding entry in MAPP is equal to -1.
- In your solution, please provide the declaration of SOURCE, MAPP, and CROSS and the code, together with significant comments to the code and instructions.
- Indeed, the choice is yours about how to store the matrices in the memory.

_If you have time, in order to get up to one additional point, please also clearly and shortly respond to the following questions (as "comments in the program"): do we risk an overflow for CROSS? Why? Please consider that a wrong response to these optional questions will imply a negative score up to -1._

**Write your code in a file saved in the 8086 folder.**

Example:

Initial matrix SOURCE

-10 -20 -100 -10000

-1 -12000 -3 -2

-9000 -12345 -999 -30000

-126 -19999 -1 -32000

Computed MAPP

-1 -1 -1 0

-1 0 -1 -1

0 0 0 0

-1 0 -1 0

Computed CROSS = -10 + (-20) + (-100) + (-1) + (-3) + (-2) + (-126) + (-1) = -263

Click on the following link to open a web page with the 8086 instruction set:

<http://www.jegerlehner.ch/intel/IntelCodeTable.pdf>

**Question 4 (8 points)**

In the fixed-point representation, a fixed number of digits is used to represent the fractional part of a number. Example of fixed-point number with 8 fractional digits: 101.10011101. The corresponding decimal value is 1 \* 2<sup>2</sup> + 0 \* 2<sup>1</sup> + 1 \* 2<sup>0</sup> + 1 \* 2<sup>-1</sup> + 0 \* 2<sup>-2</sup> + 0 \* 2<sup>-3</sup> +1 \* 2<sup>-4</sup> + 1 \* 2<sup>-5</sup> +1 \* 2<sup>-6</sup> + 0 \* 2<sup>-7</sup> + 1 \* 2<sup>-8</sup> = 4 + 0 + 1 + 0.5 + 0 + 0 + 0.0625 + 0.03125 + 0.015625 + 0 + 0.00390625 = 5.61328125

Write the nonRestoringSquareRoot subroutine in ARM assembly language, which returns the square root of a fixed-point number lower than 1. The subroutine receives in input:

- a 32-bit value X
- the number of fractional digits k

The subroutine computes the square root following the “non restoring” algorithm:

1. Initialization: r = X, P = 0, Q = 0, i = 1
1. while i ≤ k and r ≠ 0:
1. `      `if r > 0:
1. `            `r = 2 \* r – 2 \* (P – Q) - 2<sup>-i</sup>
1. `            `P = P + 2<sup>-i</sup>
1. `      `else:
1. `            `r = 2 \* r + 2 \* (P – Q) - 2<sup>-i</sup>
1. `            `Q = Q + 2<sup>-i</sup>
1. `      `i = i +1
1. Return P - Q

Example: X = 0.100110, k = 6

The '.' separating integer and fractional digits is shown only for the sake of clarity.

Initialization: r = 0.100110, P = 0.000000, Q = 0.000000

Iteration i = 1: r > 0

`	`r = 2 \* 0.100110 – 2 \* (0.000000 – 0.000000) – 0.100000 = 0.101100

`	`P = 0.000000 + 0.100000 = 0.100000

Iteration i = 2: r > 0

`	`r = 2 \* 0.101100 – 2 \* (0.100000 – 0.000000) – 0.010000 = 0.001000

`	`P = 0.100000 + 0.010000 = 0.110000

Iteration i = 3: r > 0

`	`r = 2 \* 0.001000 – 2 \* (0.110000 – 0.000000) – 0.001000 =
`		`= 11111111111111111111111110.101000

`	`P = 0.110000 + 0.001000 = 0.111000

Iteration i = 4: r < 0

`	`r = 2 \* 11111111111111111111111110.101000 + 2 \* (0.111000 – 0.000000) – 0.000100 =

`		`= 11111111111111111111111110.111100

`	`Q = 0.000000 + 0.000100 = 0.000100

Iteration i = 5: r < 0

`	`r = 2 \* 11111111111111111111111110.111100 + 2 \* (0.111000 – 0.000100) – 0.000010 =

`		`= 11111111111111111111111111.011110

`	`Q = 0.000100 + 0.000010 = 0.000110

Iteration i = 6: r < 0

`	`r = 2 \* 11111111111111111111111111.011110 + 2 \* (0.111000 – 0.000110) – 0.000001 =

`		`= 0.011111

`	`Q = 0.000110 + 0.000001 = 0.000111

The subroutine returns P - Q = 0.111000 – 0.000111 = 0.110001

Important notes:

1. **Create a new project with Keil inside the “template” directory and write your code there. The “template” directory contains the subdirectories “led” and “button” that you can add to your project if you need them.**
1. The assembly subroutine must comply with the ARM Architecture Procedure Call Standard (AAPCS) standard (about parameter passing, returned value, callee-saved registers).
1. Click on the following links to open web pages with the ARM instruction set

<http://www.keil.com/support/man/docs/armasm>

<https://developer.arm.com/documentation/ddi0337/e/Introduction/Instruction-set-summary?lang=en>

1. You can convert positive fixed-point numbers from/to base 2 and 10 at this link:

<https://www.exploringbinary.com/binary-converter/>

**Question 5 (5 points)**

Add the following functionalities to the project created in the previous exercise:

1. The user can specify a binary value through buttons Key1 and Key2. Key1 inserts a new digit equal to 0, while key2 inserts a new digit equal to 1. For example, if the user presses Key2, Key1, Key1, Key2, Key2, Key1, the final value is 100110
1. When the user presses INT0, call the nonRestoringSquareRoot subroutine passing:
   - the value introduced before with Key1 and Key2 (e.g., 100110)
   - the number of times Key1 and Key2 were pressed before (e.g., 6)

Then, the lowest 8 bits of the value returned by the nonRestoringSquareRoot subroutine are shown through the leds 4-11. Led 11 corresponds to the least significant bit. In the example, the lowest 8 bits of the returned value are 00110001, so the led status is:
led 4 off, led 5 off, led 6 on, led 7 on, led 8 off, led 9 off, led 10 off, led 11 on.

The management of the button bouncing is optional (i.e., not required).
