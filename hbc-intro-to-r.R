#Excercise from: https://hbctraining.github.io/Intro-to-R-flipped/schedules/links-to-lessons.html
#Print statements throughout the code have been commented out to avoid cluttering the output
#Exercises were completed at the bottom of each section.


####1.1: intro r

    #Variables are declared with the assignment operator, <-
    x <- 4
    y <- 12

    number <- x+y
    #print(number)

####1.2: R Syntax and Data Structures

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

####1.3: R Functions and Arguments
    #"A function is a self-contained piece of code that performs a specific task."
    #The function name is followed by parentheses, which contain the arguments.

    #Basic Functions
    glengths <- c(glengths, 90)
    glengths <- c(30, glengths)
    #print(glengths)

    #sqrt()
    #print(sqrt(81))
    #You can use sqrt on a vector to get the square root of each element in the vector.
    #print(sqrt(glengths))

    #round()
    #print(round(3.14159))

    ###Seeking help on a function
    #?function_name: This will open the help page for the function in the RStudio help window.
    #you can also use args() to see the arguments of a function
    #to get an example of how to use a function, use example()

    #Exercise
    #1. Use a base R function to calculate the mean of the glengths vector.
    #print(mean(glengths))
    #2. Create a new vector, test <- c(1, NA, 2, 3, NA, 4), and calculate the mean of test.
    test <- c(1, NA, 2, 3, NA, 4)
    #print(mean(test, na.rm = TRUE))
    #for this you need to use the na.rm argument to remove the NA values from the vector before calculating the mean.

    ###User-defined functions
    #The basic syntax for a user-defined function is:
    #function_name <- function(arguments) {
    #    function body
    #    return(something)
    #}
    square_it <- function(x) {
        x_squared <- x^2
        return(x_squared)
    }
    #print(square_it(4))

    #if you dont use the return() function, the function will return the last value in the function body

    #Exercise
    #1. Write a function called "multiply_it" which takes two inputs and returns their product.
    multiply_it <- function(x, y) {
        product <- x*y
        return(product)
    }
    #print(multiply_it(2, 3))

####1.4: Reading data into R 

    #the read.csv() function is used to read data from a csv file into R
    metadata <- read.csv(file="data/mouse_exp_design.csv")
    #print(metadata)

    #Exercise
    #1. Read "project-summary.txt" into R and assign it to a variable called "proj_summary".
    #2. display the contents of proj_summary in the console.
    proj_summary <- read.table(file="data/project-summary.txt", row.names = 1, header = TRUE)
    #print(proj_summary)

    ###Inspecting data structures
    #print(head(metadata))
    #Exercises

    #1. Use the class() function on glengths and metadata, how does the output differ between the two?
    #print(class(glengths))
    #print(class(metadata))
    #One says data.frame and the other is numeric

    #2. Use the summary() function on the proj_summary dataframe, what is the median “rRNA_rate”?
    #print(summary(proj_summary))
    #median rRNA_rate is 0.005345

    #3. How long is the samplegroup factor?
    #print(length(samplegroup_factor))
    #Answer: 9

    #4. What are the dimensions of the proj_summary dataframe?
    #print(dim(proj_summary))
    #Answer: 9 rows and 8 columns

    #5. When you use the rownames() function on metadata, what is the data structure of the output?
    #print(class(rownames(metadata)))
    #Answer: character

    #6. [Optional] How many elements in (how long is) the output of colnames(proj_summary)? Don’t count, but use another function to determine this.
    #print(length(colnames(proj_summary)))
    #Answer: 8

####1.5: Practice Exercises
    #Custom Functions - Let’s create a function temp_conv(), which converts the temperature in Fahrenheit (input) to the temperature in Kelvin (output).
    #   We could perform a two-step calculation: first convert from Fahrenheit to Celsius, and then convert from Celsius to Kelvin.
    #   The formula for these two calculations are as follows: temp_c = (temp_f - 32) * 5 / 9; temp_k = temp_c + 273.15. To test your function,
    #   if your input is 70, the result of temp_conv(70) should be 294.2611.

    temp_conv <- function(temp_f) {
        temp_c <- (temp_f - 32) * 5 / 9
        temp_k <- temp_c + 273.15
        return(temp_k)
    }
    #print(temp_conv(70))

    #Nesting Functions - Now we want to round the temperature in Kelvin (output of temp_conv()) to a single decimal place. 
    #Use the round() function with the newly-created temp_conv() function to achieve this in one line of code.
    #If your input is 70, the output should now be 294.3.

    #print(round(temp_conv(70), 1))
####2.1: Data Wrangling: Subsetting vectors and factors
    #Subsetting vectors
        #Vectors can be subsetted using square brackets.
        #The first element in a vector is at position 1. This is different from Python, where the first element is at position 0.

        age <- c(15,22,45,52,73,81)
        #if we wanted just the 4th element, we would use the following code:
        #print(age[4])
        #if we wanted everything except the 4th element, we would use the following code:
        #print(age[-4])
        #if we wanted the 2nd, 3rd, and 4th elements, we would use the following code:
        #print(age[2:4])
        #or
        #print(age[c(2,3,4)])

        #Exercise
        #Create a vector called alphabets with the following letters: C,D,X,L,F
        #use the associated indices to print out the following:
            #Only C, D, and F
            #All but X
            #Display the letters in reverse order

        alphabets <- c("C", "D", "X", "L", "F")
        #print(alphabets[c(1,2,5)])
        #print(alphabets[-3])
        #print(alphabets[5:1])
    #Logical Operators
        #Logical operators are used to compare values.
        #The result of a logical operation is a logical value (TRUE or FALSE).
        #The following logical operators are available in R:
            #==: equal to
            #!=: not equal to
            #>: greater than
            #<: less than
            #>=: greater than or equal to
            #<=: less than or equal to
            #&: and
            #|: or
        #print(age>50)
        
        #You can use the which function to find the indices of elements that meet a certain condition.
        #print(which(age>50 | age<18))
        #using the indices, we can subset the vector to get the elements that meet the condition
        #print(age[which(age>50 | age<18)])

    #Factors
        #Since factors are vectors, they can be subsetted using the same methods as vectors.
        #print(expression[expression=="high"])

        #Exercise 
        #Extract only elements from samplegroup that are not KO.
        #print(samplegroup[samplegroup!="KO"])
    #Releveling factors
        expression <- factor(expression, levels=c("low", "medium", "high"))
        #str(expression)
        
        #Exercise
        #Use the samplegroup factor we created in a previous lesson, and relevel it such that KO is the first level followed by CTL and OE.
        samplegroup <- factor(samplegroup, levels=c("KO", "CTL", "OE"))
        #str(samplegroup)
####2.2: Packages and Libraries
    #Checking what is loaded
        #You can check which packages are currently loaded by using the sessionInfo() or search() functions.
        #print(sessionInfo())
        #print(search())
    #Installing new packages
        #packages can be installed from the CRAN package repository using the install.packages() function.        
        #install.packages("ggplot2")
        
        #Many packages also exist on Bioconductor, which is a repository for bioinformatics packages.
        #To install a package from Bioconductor, you need to use the BiocManager package.
        #install.packages("BiocManager")
        #to install a package from Bioconductor, use the following code:
        #BiocManager::install("ggplot2")
        #The :: is used to specify that the function should be executed from a specific package.
    #Loading packages
        #To load a package, use the library() function.
        #library(ggplot2)
        #this is like import in Python
    #Exercise
        #Install the tidyverse suite of packages from CRAN.
        #install.packages("tidyverse")

####2.3: Data wrangling: dataframes, matrices, and lists
    #Dataframes
        #extract the value "Wt" from the first column and first row of metadata dataframe
            #print(metadata[1,1])
        #extract the value from 1st row of the 3rd column of metadata dataframe
            #print(metadata[1,3])
        #Extract the 3rd row from the metadata dataframe
            #print(metadata[3,])
            #if you select a single row, the output is a dataframe
        #Extract the 3rd column from the metadata dataframe
            #print(metadata[,3])
            #if you select a column, the output is a vector
        #Extract the 3rd column as a dataframe using the drop=FALSE argument
            #print(metadata[,3,drop=FALSE])
        #Create a dataframe containing the first two columns of metadata
            #print(metadata[,1:2])
        #Create a dataframe containing the 1st, 3rd, and 6th rows of metadata
            #print(metadata[c(1,3,6),])
        #Extract the celltype column from the first 3 samples
            #print(metadata[c("sample1", "sample2", "sample3") , "celltype"])
        #if you want to extract a column using the column name, you can use the $ operator
            #print(metadata$genotype)
                #there is no equivalent operator for rows
    #Exercises
        #Return a data frame with only the genotype and replicate column values for sample2 and sample8.
            #print(metadata[c("sample2", "sample8"), c("genotype", "replicate")])
        #Return the fourth and ninth values of the replicate column.
            #print(metadata[c(4,9), "replicate"])
        #Extract the replicate column as a data frame.
            #print(metadata[, "replicate", drop=FALSE])
    #Selecting indicies with logical operators
        #print(metadata$celltype=="typeA")
        #returns a vector of logical values
        #print(metadata[metadata$celltype=="typeA",])
        #returns a dataframe with only the rows that meet the condition
        #which can be used to subset the dataframe
        #print(which(metadata$celltype=="typeA"))
        #returns the indices of the rows that meet the condition
    #Lists
        #to select a single element from a list, you need to use the double square brackets
       #print(list1[[2]])
        #you can use the class function to check the type of an object
        #print(class(list1[[2]]))
        
        #exercise
        #Create a list named random with the following components: metadata, age, list1, samplegroup, and number.
            random <- list(metadata=metadata, age=age, list1=list1, samplegroup=samplegroup, number=number)
            #print(random)
        #Extract the samplegroup component.
            #print(random$samplegroup)
    #Adding names to lists
        #you can use the names function to add names to a list
        names(list1) <- c("species", "df", "number")
        #print(names(list1))
        #once you have named a list, you can use the names to extract elements
        #print(list1[["species"]])

        #exercise
            #Set names for the random list you created in the last exercise.
            names(random) <- c("metadata", "age", "list1", "samplegroup", "number")
            #Extract the age component using the $ notation
            #print(random$age)
