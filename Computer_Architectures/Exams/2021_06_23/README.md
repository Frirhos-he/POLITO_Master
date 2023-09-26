## Assembly Program to Compute Sum of Matrix Cells

**Date:** 2021-06-23

### Problem Description

Given a 5 x 5 matrix of bytes `SOURCE` representing unsigned numbers, write an 8086 assembly program that computes, on 16 bits, the sum of all cells excluding those on the main diagonal (i.e., the upper left-to-lower right diagonal), minus the sum of all cells on the same main diagonal.

### Instructions

1. Initialize the sum to 0.

2. Traverse the matrix, element by element, excluding the main diagonal:

   - Load the current byte from `SOURCE` into a register (e.g., `DL`).

   - Add the byte to the sum.

3. After completing the traversal, you'll have the sum of all cells excluding the main diagonal.

4. Subtract the sum of the main diagonal from the total sum.

5. The result (on 16 bits in two's complement) represents the desired value.

### Example

Consider the following matrix `SOURCE`:
1 2 3 4 5
6 7 8 9 0
9 8 7 6 5
4 3 2 1 0
7 7 7 7 7

- Sum of all cells excluding the main diagonal: 102.
- Sum of all cells on the main diagonal: 23.
- Result (on 16 bits in two's complement): 102 - 23 = 79.
