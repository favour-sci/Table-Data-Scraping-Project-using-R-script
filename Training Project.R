setwd("C:/Users/DELL/Desktop/ADSR/R Programming Lecture/Web Scrapping in R")

# Load the necessary library
library(rvest)

# URL of the website you want to scrape
url <- "https://weatherandclimate.com/nigeria#climatic"


# Weatherandclimate is a website that displays Historical Climate Data.

# Read the HTML content of the website
page <- read_html(url)


# Find all table nodes in the HTML document
tables_nodes <- html_nodes(page, "table")



# Extract tables into a list of data frames
tables <- html_table(tables_nodes, fill = TRUE)

#inspect how many tables are in the website
#there are three tables in the website

# Check the content of the first table
if (length(tables) > 0) {
  # If there are multiple tables and you want to check each, use a loop
  for (i in seq_along(tables)) {
    print(paste("Table", i))
    print(tables[[i]])
  }
} else {
  print("No tables found")
}



# Examine each table
table1 <- tables[[1]];table1
table2 <- tables[[2]];table2
table3 <- tables[[3]];table3




# Write that data in a CSV file
write.csv(table1, "climateclassification.csv")
write.csv(table2, "weatherbymonth.csv")
write.csv(table3, "citesbytemp.csv")


View(table1)
