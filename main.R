#######################################
###   Igor Goltsov course project   ###
### for "Getting and Cleaning Data" ###
###     course on Coursera          ###
#######################################

# load necessary libraries
library(dplyr)

getDirSeparator <- function(){
    "/"
}

## 
# Generate proper path to data file
##
getFilePath <- function(folder, route, id, isInternalSignals = FALSE){

    separator <- getDirSeparator()

    path <- paste(
        folder,
        separator,
        route,
        separator,
        sep = ""
    )

    if (isInternalSignals){
        
        path <- paste(
            path,
            "Inertial Signals",
            separator,
            sep = ""
        )
    }

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

getFeatures <- function(folder){

    pathToFile <- paste(
        folder,
        getDirSeparator(),
        "features.txt"
    , sep = "")

    read.table(pathToFile)
}

getActivityLabels <- function(folder){

    pathToFile <- paste(
        folder,
        getDirSeparator(),
        "activity_labels.txt"
    , sep = "")

    read.table(pathToFile)
}

loadData <- function(folder = "UCI HAR Dataset", route = "test"){

    assign("activity_labels", getActivityLabels(folder), envir=globalenv())
    assign("features", getFeatures(folder), envir=globalenv())

    externalSignalKeys = c("y", "X", "subject")
    for (id in externalSignalKeys){

        pathToFile <- getFilePath(folder, route, id)

        value = read.table(pathToFile)
        assign(id, value, envir=globalenv())

        print(id)
        print(names(value))
    }

    internalSignalKeys = c(
        "body_acc_x", 
        "body_acc_y",
        "body_acc_z",
        "body_gyro_x",
        "body_gyro_y",
        "body_gyro_z",
        "total_acc_x",
        "total_acc_y",
        "total_acc_z"
    )
    for (id in internalSignalKeys){

        pathToFile <- getFilePath(folder, route, id, isInternalSignals = TRUE)
        value = read.table(pathToFile)
        assign(id, value, envir=globalenv())

        print(id)
        print(names(value))
    }

    names(X) <- features$V2
    assign("X", X, envir=globalenv())

}

loadData()