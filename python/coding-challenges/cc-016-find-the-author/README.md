# Coding Challenge - 016: Find the Author

The purpose of this coding challenge is to write a program that finds out the author of a passage.

## Learning Outcomes

At the end of this coding challenge, students will be able to;

- Analyze a problem, identify, and apply programming knowledge for an appropriate solution.

- Implement conditional statements effectively to solve a problem.

- Implement loops to solve a problem.

- Construct functions to solve a decomposed problem.

- Read and write files to use the data within.

- Execute operations on strings.

- Demonstrate their knowledge of algorithmic design principles by solving the problem effectively.

## Problem Statement

A librarian wants to sort books depending on their complexity. To be able to do this, he/she has to read through all the books in the library. Since this would take months, he/she asks you to perform the task using python. He/she wants you to measure the average length of a book and provide the needed detail. Once you complete the program, you are going to test the program by comparing excerpts from Hemingway and Charles Dickens. Hemingway is known for his short sentences and simple sentences. On the other hand, Charles Dickens is known for his long and complex sentences.

Write a program that reads a file and understand whether the author is Hemingway or Charles Dickens. Your program should report when it opens and closes files. It should also print the average length of the sentences in order (`text1`,`text2`). Finally, it should prompt a message indicating the owners of the excerpts. The `text1.txt` and `text2.txt` files are provided within the folder.

***To find the average length of a sentence, count the number of words, sum them up and divide the total amount to the number of sentences.***

- Expected Output:

```text
text1.txt is opened
text1.txt is closed
text2.txt is opened
text2.txt is closed
(7, 36)
('The first text belongs to ', 'Hemingway', ' and the second one belongs to ', 'Charles Dickens', '.')
```