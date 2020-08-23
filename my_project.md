Guess the Computer Generated Number App Documentation
========================================================
author: Nicolas Castro
date: 23-08-2020
autosize: true

Introduction
========================================================

This application is developed using R Programming 
language in R Studio's IDE. The application
used shiny environment under R studio for interface
desigening.

Main uses of application are as follows:

- Generate a random computer number between 1 and 10
- Let the user predict the number 
- Give the user how close he is to the computer generated number until he gets it right !


Instructions
========================================================


- Step 1 Enter the number Input to guess the computer generated number
- Step 2 Press Go button
- Step 3 Check to the right how close you are 
- Step 4 Change your Guess if you have not got it right yet
- Step 5 If your guess is right then STOP.


Program Design
========================================================

UI Code 

- Provides input box to enter the number
- Display the validation from the server 


Program Design (continued)
========================================================

Server Code


- Generates the random number between 1 and 10 using the below code


```r
number <- floor(runif(1,1,11))
print(number)
```

```
[1] 7
```
- Takes the input number and validates against the generated number
- Returns text status message to be displayed by the UI



