# 1. Use R to figure out how many elements in the vector below are greater than 2.
rooms <- c(1, 5, 2, 3, 1, NA, 3, 1, 3, 2, NA, 1, 8, 3, 1, 4, NA, 1, 3, 1, 2, 1, 7, 1, NA, 4, 3 ,1 ,7 ,2 ,1 ,NA ,1, 1, 3) # Creates vector of Rooms
rooms > 2 # Tells us if the numbers are either TRUE (greater than 2) or FALSE (less than 2)

# 2. Which function tells you the type of data the 'rooms' vector above contains?
typeof(rooms) # This will tell us the type of data the vector contains (double)

# 3. What is the result of running the median() function on the above 'rooms' vector?
median(rooms) # It will return as NA, as there is missing data
median(rooms, na.rm = TRUE) # using na.rm = TRUE, will ignore missing values

# 4. Install tidyverse and load in SAFI_clean.csv, screenshot on GitHub
install.packages("tidyverse") # Installs "tidyverse" package
install.packages("here") # Installs "here" package (not necessary for this, but nice to have anyways)

download.file(
  "https://raw.githubusercontent.com/datacarpentry/r-socialsci/main/episodes/data/SAFI_clean.csv", "data/SAFI_clean.csv", mode = "wb") # Downloads the SAFI_clean file to our data directory

interviews <- read_csv(here("data", "SAFI_clean.csv"), na = "NULL") # Loads SAFI_clean.csv into our project

# 5. Tidy up Danish Monarchs dataset enough to be able to load it into R, and calculate mean and median of the monarchs' rule over time
DKmonarchs <- read_csv(here("data", "DKmonarchs.csv"), na = "NULL") # Reads in my Danish Monarch csv file, that I cleaned up earlier this course.
# If you load this normally, it will only spit out a single column, where each variable is separated by a semicolon in the same column.
# To get around this, in excel go to Options > Advanced > Unmark "Use system separators" and change "Decimal separator" to "." and "Thousands separator" to ","
# This is because having comma as the decimal separator in excel, forces it to use ";" as the separator in CSV-files, we do NOT want this.
# You can also use read_csv2, which will read CSVs with semicolons as separators instead. This would have been easier, but I only realised after.


mean(DKmonarchs$Duration_of_reign, na.rm = TRUE) # To select specific column, use $(column_name), use na.rm = TRUE to ignore missing values
median(DKmonarchs$Duration_of_reign,na.rm = TRUE) # Same thing, just with median() instead
