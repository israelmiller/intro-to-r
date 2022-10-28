#Excercise from: https://hbctraining.github.io/Intro-to-R-flipped/schedules/links-to-lessons.html

#1.1 intro r

#Variables are declared with the assignment operator, <-
x <- 4
y <- 12

number <- x+y
#print(number)

#1.2 R Syntax and Data Structures

###Vectors
#The c (combine) function is used to create vectors. 
#Vectors are the most basic data structure in R.
#Vectors can contain numbers, characters, or logical values (TRUE or FALSE).
#Vectors can also contain a mix of these data types.
glengths <- c(4.6, 3000, 50000)
#print(glengths)

species <- c("mouse", "rat", "human")
#print(species)

#combined vectors
combined <- c(glengths, species)
#print(combined)

###Factors
#Factors are used to represent categorical data.
#Factors are vectors that can only contain a fixed set of values.
#Each value is assigned a number, called a level.
#Factors are useful for representing data that can only take on a limited number of values.
expression <- c("low", "medium", "high", "low", "medium", "high")
expression_factor <- factor(expression)
#print(expression_factor)

#Exercise
#Create a vector named samplegroup with nine elements: 
#3 control (“CTL”) values, 3 knock-out (“KO”) values, and 3 over-expressing (“OE”) values.
#Turn samplegroup into a factor data structure.

samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")
samplegroup_factor <- factor(samplegroup)
#print(samplegroup_factor)

###Matrices
#Matrices are two-dimensional arrays of data.
#Matrices can contain numbers, characters, or logical values (TRUE or FALSE).

###Data Frames
#Data frames are two-dimensional data structures that can contain different data types.
#Data frames are the most commonly used data structure in R.
#Data frames are similar to matrices, but each column can contain a different data type.
df <- data.frame(species, glengths)
#print(df)

#Exercise
#Create a dataframe called "favorite_books" with the following vectors as columns:
#titles: "The Hobbit", "The Fellowship of the Ring", "The Two Towers", "The Return of the King"
#pages: 310, 423, 352, 416
titles <- c("The Hobbit", "The Fellowship of the Ring", "The Two Towers", "The Return of the King")
pages <- c(310, 423, 352, 416)
favorite_books <- data.frame(titles, pages)
#print(favorite_books)

###Lists
#A list is a data structure that can contain other data structures.

list1<- list(species, df, number)
#print(list1)

#Exercise
#Create a list called "list2" that contains species,glengths,and number.
list2 <- list(species, glengths, number)
#print(list2)

#1.3 R Functions and Arguments
