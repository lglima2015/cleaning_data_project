# run_analysis Script 
# objective: transform the Human Activity Recognition Using Smartphones DataSet
# in a Tidy Data Format based on Clean Data Analysis Course Project
# the script contains 5 functions: mergeTraintest, extractMeansAndDeviations,
# setDescriptiveActivity, setAppropriatelyLabels and createAverages.
# All the functions are comments below
run_analysis <- function(){
    
    # Merges the training and the test sets to create one data set.
    mergeTrainTest <- function(){
        # specify files
        path = getwd()
        trainFile <- paste(getwd(), "/train/X_train.txt", sep="")
        testFile <- paste(getwd(), "/test/X_test.txt", sep="")
        subjectTrainFile <- paste(getwd(), "/train/subject_train.txt", sep="")
        subjectTestFile <- paste(getwd(), "/test/subject_test.txt", sep="")    
        labelCollumnsFile <- paste(getwd(), "/features.txt", sep="")
        
        # load files
        message("loading files...")
        labelCollumns <- read.table(labelCollumnsFile, sep=" ") 
        message("train file...")
        train <- read.table(trainFile, sep = "")
        message("test file...")
        test<- read.table(testFile, sep = "")
        message("subject train file...")
        subjectTrain <- read.table(subjectTrainFile, sep = "")
        message("subject test file...")
        subjectTest <- read.table(subjectTestFile, sep = "")
        # join two data frames using rbind
        message("binding datasets...")
        dataset <- rbind(train, test)
        # put names in dataset variables using colnames
        message("setting names in collumns..")
        colnames(dataset) <- as.vector(labelCollumns[, 2])
        # append subject values
        dataset$subject <- factor(c(subjectTrain[,1], subjectTest[,1]))
        # return
        dataset
    }
    
    # Extracts only the measurements on the mean and standard deviation for each measurement. 
    extractMeansAndDeviations<- function(dataset){
        message("Extract Means and Deviations from dataset...")
        # match collumns using gdata.matchcols function
        subject_col <- dataset$subject
        cols <- matchcols(dataset, with=c("mean", "std"), method = "or")
        cols <- mapply(c, cols[1], cols[2], SIMPLIFY = FALSE )
        # select dataset from list cols
        selDataset <- dataset[, cols$mean]
        selDataset$subject <-subject_col
        #return 
        selDataset
    }
    # Uses descriptive activity names to name the activities in the data set
    setDescriptiveActivity <- function(selDataset){
        message("setting descriptive activity...")
        #specify files
        activityLabelFile <- paste(getwd(), "/activity_labels.txt", sep="")
        activityTrainFile <- paste(getwd(), "/train/y_train.txt", sep="")
        activityTestFile <- paste(getwd(), "/test/y_test.txt", sep="")
        #load files
        message("loading activity train file..")
        activityTrain <- read.table(activityTrainFile, sep="")
        
        message("loading activity test file..")
        activityTest <- read.table(activityTestFile, sep="")

        message("loading activity label file..")
        activityLabels <- read.table(activityLabelFile, sep="")
        
        message("append activity values ...")
        
        # append activity values and set levels for factors
        selDataset$activity  <- factor(c(activityTrain[,1], activityTest[,1]))
        levels(selDataset$activity) <- as.vector(activityLabels[,2])
        
        #return
        selDataset
    } 
    # Appropriately labels the data set with descriptive variable names. 
    setAppropriatelyLabels <- function(selDataset){
        finalColnames <- names(selDataset)
        finalColnames <- gsub("tBody", "TimeBody", finalColnames)
        finalColnames <- gsub("tGravity", "TimeGravity", finalColnames)
        finalColnames <- gsub("fBody", "FreqBody", finalColnames)
        finalColnames <- gsub("-", "", finalColnames)
        finalColnames <- gsub("\\(\\)", "", finalColnames)
        finalColnames <- gsub("mean", "Mean", finalColnames)
        finalColnames <- gsub("std", "Std", finalColnames)
        finalColnames <- gsub("BodyBody", "Body2Body", finalColnames)
        colnames(selDataset) <- finalColnames
        selDataset
    }
    # Create averages in data set and change to tidy format.
    createAverages <- function(df){
        mycolnames <- colnames(df)
        df$id <- factor(paste(df$activity,df$subject, sep = "_"))
        group_df <- group_by(df, id)
        avg_df<- unique(data.frame(id = df$id))
        i = 1
        my.summarize_mean <- function(group_df, column) { 
            ddply(group_df, .(id), function(d) mean(d[[column]]))
        }
        for (col in mycolnames){
            if (col == "subject" || col == "activity")
                next
            sm <- my.summarize_mean(group_df, col)
            avg_df$V1 <- sm$V1
            colnames(avg_df)[colnames(avg_df)=="V1"] <- col
        }
        arrange(avg_df,id)
    }
    # From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    message("creating tidy_Data from UCI HAR Dataset...")
    library(dplyr)
    library(plyr)
    library(gdata)
    dataset <- mergeTrainTest()
    dataset <- extractMeansAndDeviations(dataset)
    dataset <- setDescriptiveActivity(dataset)
    dataset <- setAppropriatelyLabels(dataset)
    tidy_data <- createAverages(dataset)
    colnames(tidy_data)[colnames(tidy_data)=="id"] <- "activity_subject"
    message("Writting dity dataset..")
    
    write.table(tidy_data, file="tidy_dataset.txt", row.names =FALSE)
    message("Done!")
    tidy_data
}

