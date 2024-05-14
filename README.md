# Register Machine
* A generic class of **Abstract machines** use in a manner similar to a **Turing machine**.
* It Works with two things:
1. A Program to get the instructions
2. A Registers which contain the inputs and outputs

## The files:
* *MultiplicationMine.txt*, which is the multiplication = x1*x2 (x1, x2)
* *PowerMine2.txt*, which is the Exponentiation = b^n (b is the base and n is the power)
* *RegMac.jl*, which is the main program or Register Machine.


## How to Use it:

* Please run it in Linux Terminal or Windows Powershell. 
1. Run:
> $ julia RegMac.jl

2. It Gives you some information about the Program, the files' names in your directory and then ask you for the file name:
> Enter the program's file name:<br>
> \>

3. It displays **the Instructions** of the program, the **number of lines** in that program, the **minimum number of registeries** you need and ask you for number of registeries you want to use:
> Now, how many registers do you need?<br>
> \>

4. it shows you the Registeries, Shows the list of instructions and then Ask you to put each registeries at a time:
> Put the registeries:
> R0 (default is 1)\> 

5. Put the initial numbers in each registeries.

6. Remember: The registeries are like this,
R0 R1 R2 R3 R4 ...
* R0: the initial value of it shows that the **program reader** start at which line of the program.
* The inputs for the function that program solve, should be put in order for R1, R2 and ... until there is no input 
    * for example R1 and R2 are the two inputs for the Multiplication and Exponentiation programs.
* The rest of the registeries should be empty, which means you should put 0 in each of them.

7. The program starts to show the registeries in a list which are changing with respect to the program of your choice.

8. At the end, The registery 1 (R1) should be showing the final answer to the solving function.


### For Example:

