#R Project
#import basic library
library(dplyr)
library(ggplot2)

#to get file location
getwd() 

#to load data set
df<- read.csv("C:/Users/HP/supermarket_sales - Sheet1.csv",
                        stringsAsFactors=FALSE)
head(df)

#to check how many rows and columns
dim(df)

#to show null values in given dataset
any(is.na(df))
#to check null counts
table(is.na(df)) 

#to check datatypes
summary(df)

#to check duplicate rows
table(duplicated(df))

#to check outliers in given dataframe
X=df$Product.line
Y=df$gross.income
ggplot(df, aes(x =X ,y = Y)) + 
geom_boxplot( alpha = 0.5) + 
theme_bw() + 
labs(title = "Supermarket Sales",x = "Products",      
y = "Gross Income",fill = "Transmission")

#to remove outliers
df[df$Product.line == "Fashion accessories" & df$gross.income >=43,]
df[df$Product.line == "Food and beverages" & df$gross.income >=45,]
df[df$Product.line == " Sports and travel" & df$gross.income >=45,]
df1<- df[-c(168,351,423,558)]

#to check outliers again in given dataframe
X=df1$Product.line
Y=df1$gross.income
ggplot(df1, aes(x =X ,y = Y)) + 
geom_boxplot( alpha = 0.5) + 
theme_bw() + 
labs(title = "Supermarket Sales",x = "Products",      
y = "Gross Income",fill = "Transmission")

#With the help of this chart we get to know the most product sales in which city
A=df1$City
B=df1$Product.line
ggplot(df1, aes(B,fill = A)) + 
geom_histogram(binwidth = 1,position = "identity", alpha = 0.5, stat="count")+ 
theme_bw()+ 
labs(title = "Supermarket Sales",x = "Product",y = "City",fill = "Cylinders")


