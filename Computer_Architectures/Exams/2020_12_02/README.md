<a name="br1"></a>

**Computer architectures**

<a name="br4"></a>

**Informazione**

Click here to open the web page of the manual:

<https://developer.arm.com/documentation/ddi0337/e/introduction/instruction-set-summary?lang=en>

<http://www.keil.com/support/man/docs/armasm>

_Note_: Assembly subroutines must comply with the ARM Architecture Procedure Call Standard (AAPCS) standard (about parameter passing, returned value, callee-saved registers).

In all subroutines, you can assume that the matrix is big enough to contains all values.

**Explanation of programming exercises**

Let p(x) be a _n_-th degree polynomial: p(x) = k x + k x<sup>n-1</sup> + k x<sup>n-2</sup> + … + k x + k x + k

n

2

n

n-1

n-2

2

1

0

The coefficients k<sub>i</sub> are unknown, but we know the values of p(1), p(2), …, p(_n_+1). We want to compute the value of p(_m_), with _m_ > _n_, using the method of the divided differences. We use a

matrix _M_ with _m_ rows and _n_+1 column. The element at row _i_ and column _j_ is indicated as _M_[_i_][*j*]. We apply the following algorithm:

phase 1) the elements on the first column _M_[0][0], _M_[1][0], …, _M_[_n_][0] are initialized with the values of p(1), p(2), …, p(_n_+1)

phase 2) the value of an element _M_[_i_][1] on the second column is set as: _M_[_i_][1] = _M_[_i_ +1][0] - _M_[_i_][0]. In this way, the first _n_ elements on the second column are set.

The value of the first _n_-1 elements on the third column are computed as the difference of the elements of the second column: _M_[_i_][2] = _M_[_i_ +1][1] - _M_[_i_][1]

By applying the same rule to all columns, finally we compute the value of the first element of the last column _M_[0][*n*]

phase 3) the value of _M_[0][*n*] is copied into the first _n_+1 elements of the last column. Then, any element M[_i_][*j*], with _j_ < _n_ - 1, is computed as: _M_[_i_][*j*] = _M_[_i_ - 1][*j*] + _M_[_i_ - 1][*j* + 1]

Example: p(x) is a fourth order polynomial, with p(1) = 4, p(2) = 30, p(3) = 120, p(4) = 340, p(5) = 780. We want to compute the value of p(9). We use a matrix with 9 rows and 5 columns.

4

26

90

64

130

220

334

472

634

820

0

66

90

114

138

162

186

0

24

24

24

24

24

0

LEGEND

phase 1

phase 2

phase 3

not used

30

120

340

780

1554

2800

4680

7380

220

440

774

1246

1880

2700

0

0

0

0

0

0

0

At the end, we obtain p(9) = 7380. Note: unused elements must be left to zero.

/

<a name="br5"></a>

**Domanda 4**

Write a initializeMatrixsubroutine that receives in input:

Risposta non data

1\. address of a zeroed block of memory: it represents the matrix

2\. address of an array: it contains the values p(1), p(2), …, p(_n_+1)

3\. _n_+1: grade of the polynomial + 1, i.e., number of values in the array

Punteggio max.:

4,00

The subroutine implements the phase 1 of the algorithm of divided differences. It does not return any value.

Example of calling code

AREA matrixDeclaration, DATA, READWRITE

matrix

array

SPACE 2000

AREA arrayInitialization, DATA, READONLY

DCD 4, 30, 120, 340, 780

AREA

Reset_Handler PROC

LDR r0, =matrix

|.text|, CODE, READONLY

LDR r1, =array

MOV r2, #5

; number of values in the array

; the grade of the polynomial is r2 - 1

BL initializeMatrix

[...]

B stop

ENDP

stop

In the example, the block of memory matrixafter the subroutine call is:

4

30

120

340

780

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

LEGEND

phase 1

phase 2

phase 3

not used

0

0

0

/

<a name="br6"></a>

/

<a name="br7"></a>

**Domanda 5**

Write a computeDifferencessubroutine that receives in input:

Risposta non data

1\. address of the matrix (with values set by the initializeMatrixsubroutine)

2\. _n_+1: grade of the polynomial + 1

Punteggio max.:

8,00

The subroutine implements the phase 2 of the algorithm of divided differences. It does not return any value.

Optional: the subroutine checks the overflow when computing the differences.

If the result of the subtraction is positive but it is too large to fit in 32 bits, then it is replaced with the greatest positive value that you can store in 32 bits.

If the result of the subtraction is negative but it is too small to fit in 32 bits, then it is replaced with the smallest negative value that you can store in 32 bits.

Max score without the overflow check: 4 points

Max score with the overflow check: 5 points

Example of calling code

AREA

Reset_Handler PROC

[...]

|.text|, CODE, READONLY

LDR r0, =matrix

MOV r1, #5

BL computeDifferences

[...]

B stop

ENDP

stop

In the example, the block of memory matrixafter the subroutine call is:

4

30

120

340

780

0

26

90

220

440

0

64

130

220

0

66

90

0

24

0

LEGEND

phase 1

phase 2

phase 3

not used

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

0

/

<a name="br8"></a>

<a name="br9"></a>

**Domanda 6**

Write a getPolynomialValuesubroutine that receives in input:

Risposta non data

1\. address of the matrix (with values set by the computeDifferencessubroutine)

Punteggio max.:

8,00

2\. _n_+1: grade of the polynomial + 1

3\. _m_

The subroutine implements the phase 3 of the algorithm of divided differences. It returns the value of p(_m_).

Optional: the subroutine checks the overflow when computing the sums.

If the result of the addition is positive but it is too large to fit in 32 bits, then it is replaced with the greatest positive value that you can store in 32 bits.

If the result of the addition is negative but it is too small to fit in 32 bits, then it is replaced with the smallest negative value that you can store in 32 bits.

Max score without the overflow check: 4 points

Max score with the overflow check: 5 points

Example of calling code

AREA

Reset_Handler PROC

[...]

|.text|, CODE, READONLY

LDR r0, =matrix

MOV r1, #5

MOV r2, #10

; return value will be p(r2)

BL getPolynomialValue

stop

B stop

ENDP

In the example, the block of memory matrixafter the subroutine call is:

4

26

90

64

130

220

334

472

634

820

0

66

90

114

138

162

186

0

24

24

24

24

24

0

LEGEND

phase 1

phase 2

phase 3

not used

30

120

340

780

1554

2800

4680

7380

220

440

774

1246

1880

2700

0

0

0

0

0

0

0
