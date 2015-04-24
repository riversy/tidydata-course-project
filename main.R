#######################################
###   Igor Goltsov course project   ###
### for "Getting and Cleaning Data" ###
###     course on Coursera          ###
#######################################

# load necessary libraries
library(dplyr)

###
# Retrieves system dir deparator (in most of cases it "/") 
###
get_dir_separator <- function(){
    "/"
}

## 
# Generate proper path to data file
##
get_file_path <- function(folder, route, id){

    separator <- get_dir_separator()

    path <- paste(
        folder,
        separator,
        route,
        separator,
        sep = ""
    )

    path <- paste(
        path,
        id,
        "_",
        route,
        ".txt",
        sep = ""
    )

    path
}

###
# Load descriptive file
###
load_descriptive_file <- function(folder, file.name) {

    path_to_file <- paste(
        folder,
        get_dir_separator(),
        file.name
    , sep = "")

    data <- read.table(path_to_file)
    names(data) <- c("no", "name")
    data
}

###
# Load feature keys
###
get_features <- function(folder){
    load_descriptive_file(folder, "features.txt")
}

###
# Load activity label descriptions
###
get_activity_labels <- function(folder){
    load_descriptive_file(folder, "activity_labels.txt")
}

###
# Retrieves keys to extract from raw dataset
###
get_keys_to_extract <- function(folder){

    features <- get_features(folder)
    filter(
        features, 
        grepl('mean\\(\\)|std\\(\\)', name)
    )
}

###
# Load and Clear data for some route ("test" or "train")
###
load_and_select <- function(folder, route){

    # Load Data into separate datasets
    external_signal_keys = c("y", "X", "subject")
    for (id in external_signal_keys){

        path_to_file <- get_file_path(folder, route, id)
        value = read.table(path_to_file)
        assign(id, value)
    }

    # Save only necessary data
    keys_to_extract <- get_keys_to_extract(folder)
    X <- select(X, keys_to_extract$no)
    names(X) <- keys_to_extract$name

    # Append Activity type before data
    # but factorise it first
    activity_labels <- get_activity_labels(folder)
    names(y) <- c("activity")
    y$activity <- factor(
        y$activity, 
        levels = activity_labels$no,
        labels=activity_labels$name
    )    
    X <- bind_cols(y, X)

    # Append Subject Id 
    names(subject) <- c("subject")
    X <- bind_cols(subject, X)

    X
}

###
# Prepare Tidy Data from Raw dataset
#
# @param read.folder
# @param save.path
# @param open.view
###
prepare_tidy_data <- function(
    read.folder = "UCI HAR Dataset", 
    save.path = "uci_har_dataset.txt",
    open.view = FALSE
){
    
    # Merge selected data into one data frame
    data <- bind_rows( 
        load_and_select(read.folder, route = "test"),
        load_and_select(read.folder, route = "train")
    ) %>% 
    group_by(activity, subject) %>%     # Group by activity and subject
    summarise_each(funs(mean))          # Prepare average values for each of activity <-> subject pair

    # Open data in View() if necessary
    if (open.view){
        View(data)
    }

    # Write it to disk
    write.table(data, save.path, row.name=FALSE)
}
