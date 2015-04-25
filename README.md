# Course Project for course "Getting and Cleaning Data"
This is my Course Project for course "Getting and Cleaning Data" on Coursera

## Introduction
This script get data of "Human Activity Recognition Using Smartphones" project and cleans it for future analisys.
The sourse of dataset is - [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

## How to use
1. Start R console in the RStudio or in the terminal and set your Working Folder.

```
setwd("~/Working Folder/")
```

2. Download file **main.R** and place it into your Working Folder. 
3. Download the [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip it into your Working Folder. I've unzipped it into folder "UCI HAR Dataset" but you may use any other name.
4. Load source of the script into R

```
source('main.R')
```

**dplyr** package should be installed in your system before that.

5. Use function **prepare_tidy_data()** to start cleaning.
6. Profit! The clean table file will be created in your Working Directory. It's name by default is 'uci_har_dataset.txt', but this may be redefined through options.

## Function parameters
```
prepare_tidy_data <- function(
    read.folder = "UCI HAR Dataset",    - Folder to read raw dataset files
    save.path = "uci_har_dataset.txt",  - Filename to save tidy dataset
    open.view = FALSE                   - This flag may be used if you want to
                                          check the result in the RStudio
                                          Tidy Data will be opened in the
                                          View() tab.
){
    ...
}
```

## Usage Examples

Use following comand to start cleaning function with default parameters:

```
prepare_tidy_data()
```

We can also pick the folder with raw data directly in function parameters:

```
prepare_tidy_data("~/Desktop/Coursera/UCI HAR Dataset")
```

We may also pick the name of output file:

```
prepare_tidy_data(save.path = 'tidy.txt')
```

If we decide to check result in the RStudio window we may also add the flag **open.view**:

```
prepare_tidy_data(open.view = TRUE)
```

## Code Book
The script work is described here in [Code Book](https://github.com/riversy/tidydata-course-project/blob/master/CodeBook.md).

## Download
The latest version of this script's placed here on [GitHub](https://github.com/riversy/tidydata-course-project). 




