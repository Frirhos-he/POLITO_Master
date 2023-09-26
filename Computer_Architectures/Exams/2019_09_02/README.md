# **Computer Architectures**
# **Exam of 02.09.2019 - Part II**

In Connect Four, two players alternately insert a colored diskinto a grid of 6 rows and 7 columns. The first player who manages to line up 4 of his own colored disks consecutively or horizontally, or vertically, or diagonally wins. The game grid is stored via a 6x7 connect4 matrix, where each element occupies 1 byte and can take the following values:

- 0: No colored disk has yet been placed
- 1: Player 1 put his own colored disk (in the picture, player 1 has yellow disks)
- 2: Player 2 put his own colored disk (in the picture, player 2 has red disks)

<table><tr><th colspan="1"></th><th colspan="2"></th><th colspan="2"></th><th colspan="2"></th><th colspan="1"></th><th colspan="2"></th><th colspan="2"></th><th colspan="2"></th><th colspan="2"></th><th colspan="2"></th><th colspan="2"></th><th colspan="2"></th><th colspan="2"></th><th colspan="1"></th><th colspan="1"></th><th colspan="2"></th><th colspan="2"></th><th colspan="2"></th><th colspan="2"></th><th colspan="3"></th><th colspan="10"></th></tr>
<tr><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="3"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="1"></td><td colspan="2"></td><td colspan="1"></td><td colspan="7">Column index</td></tr>
<tr><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="3"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="1"></td><td colspan="2"></td><td colspan="1"></td><td colspan="1"><i>0</i></td><td colspan="1"><i>1</i></td><td colspan="1"><i>2</i></td><td colspan="1"><i>3</i></td><td colspan="1"><i>4</i></td><td colspan="1"><i>5</i></td><td colspan="1"><i>6</i></td></tr>
<tr><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="3"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2"></td><td colspan="1"></td><td colspan="2" rowspan="6">Row index</td><td colspan="1"><i>0</i></td><td colspan="1">0</td><td colspan="1">1</td><td colspan="1">2</td><td colspan="1">3</td><td colspan="1">4</td><td colspan="1">5</td><td colspan="1">6</td></tr>
<tr><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="3"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">2</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2"></td><td colspan="1"></td><td colspan="1"><i>1</i></td><td colspan="1">7</td><td colspan="1">8</td><td colspan="1">9</td><td colspan="1">10</td><td colspan="1">11</td><td colspan="1">12</td><td colspan="1">13</td></tr>
<tr><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="3"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">2</td><td colspan="2">1</td><td colspan="2">1</td><td colspan="2">1</td><td colspan="2">1</td><td colspan="2"></td><td colspan="1"></td><td colspan="1"><i>2</i></td><td colspan="1">14</td><td colspan="1">15</td><td colspan="1">16</td><td colspan="1">17</td><td colspan="1">18</td><td colspan="1">19</td><td colspan="1">20</td></tr>
<tr><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="3"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2">0</td><td colspan="2">1</td><td colspan="2">2</td><td colspan="2">2</td><td colspan="2">1</td><td colspan="2">1</td><td colspan="2">2</td><td colspan="2"></td><td colspan="1"></td><td colspan="1"><i>3</i></td><td colspan="1">21</td><td colspan="1">22</td><td colspan="1">23</td><td colspan="1">24</td><td colspan="1">25</td><td colspan="1">26</td><td colspan="1">27</td></tr>
<tr><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="3"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2">2</td><td colspan="2">2</td><td colspan="2">2</td><td colspan="2">2</td><td colspan="2">1</td><td colspan="2">2</td><td colspan="2">1</td><td colspan="2"></td><td colspan="1"></td><td colspan="1"><i>4</i></td><td colspan="1">28</td><td colspan="1">29</td><td colspan="1">30</td><td colspan="1">31</td><td colspan="1">32</td><td colspan="1">33</td><td colspan="1">34</td></tr>
<tr><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="3"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2"></td><td colspan="2">1</td><td colspan="2">2</td><td colspan="2">1</td><td colspan="2">1</td><td colspan="2">1</td><td colspan="2">2</td><td colspan="2">2</td><td colspan="2"></td><td colspan="1"></td><td colspan="1"><i>5</i></td><td colspan="1">35</td><td colspan="1">36</td><td colspan="1">37</td><td colspan="1">38</td><td colspan="1">39</td><td colspan="1">40</td><td colspan="1">41</td></tr>
</table>

1) Game grid		b) matrix connect Four		c) row, column and cell index 

for matrix connect Four

It is required to write a program to check if a player has won.

You are asked to create a project with Keil, replace the contents of the startup\_LPC17xx.s file with the one in the **template** directory and** add the other files in the directory. Finally, write **debugged** and **working** subroutines that meet the following 3 specifications.

*Note 1*: You should not change the code calling the subroutines. It is only required to implement subroutines. Connect4 matrix is already declared.

*Note 2*: Specifications must be run in order. You can only switch to Specification 2 after verifying that the solution to Specification 1 is working correctly. Same for Specification 3.


<table><tr><th valign="top"></th><th valign="top"></th><th colspan="7">Column index</th></tr>
<tr><td valign="top"></td><td valign="top"></td><td><i>0</i></td><td><i>1</i></td><td><i>2</i></td><td><i>3</i></td><td><i>4</i></td><td><i>5</i></td><td><i>6</i></td></tr>
<tr><td rowspan="6" valign="top">Row index</td><td><i>0</i></td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr>
<tr><td><i>1</i></td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td></tr>
<tr><td><i>2</i></td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td></tr>
<tr><td><i>3</i></td><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td></tr>
<tr><td><i>4</i></td><td>28</td><td>29</td><td>30</td><td>31</td><td>32</td><td>33</td><td>34</td></tr>
<tr><td><i>5</i></td><td>35</td><td>36</td><td>37</td><td>38</td><td>39</td><td>40</td><td>41</td></tr>
</table>

**Specification** **1** (8 points). Write a checkRow subroutine that checks if there is a horizontal sequence of 4 discs of player X in the Connect4 matrix. The subroutine receives the following parameters in the order indicated:

- ID of player X (possible values are 1 or 2)
- address of Connect4  matrix

The checkRow subroutine returns the value 1 if the horizontal sequence is present, the value 0 otherwise.

The subroutine shall comply with the ARM Architecture Procedure Call Standard (AAPCS) standard, in particular with regard to switching the parameter to input/output and saving the registers.

*Example*: in Fig. a), there are 4 colored disks horizontally placed in cells 17, 18, 19, 20. If X = 1, the return value is 1.

*Suggestion*: Note that the first element of a sequence of 4 horizontal disks can only be found in one of the cells highlighted in blue in the figure at the bottom right of the previous page.

A possible implementation of checkRow is:

- with a double cycle all cells are marked in blue.
- For each iteration of the inner loop, the value of the current cell and the 3 cells on the right are checked. If all cells have value 1, the subroutine returns 1. You do not need to use a loop to perform the 4 controls: you can use 4 CMP instructions.

**Specification 2** (6 points). Write a checkDiagonal subroutine that controls if there is a sequence of 4 diagonal disks of player 1 in the matrix Connect4 . It is required to check only the diagonals starting at the bottom left and ending at the top right. The checkDiagonal subroutine receives the following parameters in the order indicated:

- ID of player X (possible values are 1 or 2)
- address of Connect4  matrix

The checkDiagonal subroutine returns the value 1 if the diagonal sequence is present, the value 0 otherwise. The subroutine shall comply with the AAPCS standard.

*Example*: in Fig. a), there are 4 colored disks diagonally in cells 38, 32, 26, 20. If X = 1, the return value is 1.

<table><tr><th valign="top"></th><th valign="top"></th><th colspan="7">Column index</th></tr>
<tr><td valign="top"></td><td valign="top"></td><td><i>0</i></td><td><i>1</i></td><td><i>2</i></td><td><i>3</i></td><td><i>4</i></td><td><i>5</i></td><td><i>6</i></td></tr>
<tr><td rowspan="6" valign="top">Row index</td><td><i>0</i></td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr>
<tr><td><i>1</i></td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td></tr>
<tr><td><i>2</i></td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td></tr>
<tr><td><i>3</i></td><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td></tr>
<tr><td><i>4</i></td><td>28</td><td>29</td><td>30</td><td>31</td><td>32</td><td>33</td><td>34</td></tr>
<tr><td><i>5</i></td><td>35</td><td>36</td><td>37</td><td>38</td><td>39</td><td>40</td><td>41</td></tr>
<tr><td valign="top"></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
</table>

*Suggestion:* Note that the first element of a sequence of 4 diagonal colored disks can only be found in one of the cells highlighted in blue in the figure on the right.

A possible implementation of checkDiagonal is:

- with a double cycle all cells are marked in blue.
- For each iteration of the inner loop, the value of the current cell and the 3 cells are checked diagonally. If all cells have value 1, the subroutine returns 1. You do not need to use a loop to perform the 4 controls: you can use 4 CMP instructions.

**Specification** **3 (**5 points). Write appropriate instructions / C functions to implement the following features when pressing the buttons of the LPC 1768 board:

- INT0 key: switch off all LEDs.
- KEY1 key: Check if player 1 has won in the Connect4  grid represented with the grid variable (defined in the sample.c file). For the check, subroutines in ARM must be invoked as per specification 1 and 2. Possible outputs are:
  - Player 1 did not win: LED 11 must be turned on
  - Player 1 has won with a horizontal sequence: LED 10 must be turned on 
  - Player 1 won with a diagonal sequence: LED 9 must be turned on.
- KEY2 key: Check if player 2 has won in the Connect4  grid represented with the grid variable (defined in the sample.c file). For the check, subroutines in ARM must be invoked as per specification 1 and 2. Possible outputs are:
  - Player 2 did not win: LED 7 must be turned on
  - Player 2 won with a horizontal sequence: LED 6 must be turned on 
  - Player 2 won with a diagonal sequence: LED 5 must be turned on.

If a player has won at the same time with a horizontal sequence and a diagonal sequence, you can turn on any of the two corresponding LEDs (for example, LED 10 or 9 in case of player 1 victory).
