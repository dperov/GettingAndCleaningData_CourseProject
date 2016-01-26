# download and unzip archive with project data
# into directory "dataset" in the working dir
download_data <- function() {
  
  if(!dir.exists("dataset")) {
  
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="dataset.zip",method="curl")
    unzip("dataset.zip", overwrite = TRUE)
  
    # rename directory name for simpicity
    file.rename("UCI HAR Dataset", "dataset")
  }
}

# create tidy dataset from  raw data from  "test" or "train" directory
# parameter "type" should be either "test" or "train"
load_data <- function(type) {
  
  data <- read.table(file.path("dataset", type, paste0("X_", type, ".txt")));
  features_names <- read.table(file.path("dataset", "features.txt"))
  names(data) <- features_names[,2]
  
  # keep columns with average and deviation
  data <- data[,grep("mean\\(|std\\(", names(data))]
  
  subject <- read.table(file.path("dataset", type, paste0("subject_", type, ".txt")))
  data$subject <- subject[,1]
  
  activity <- read.table(file.path("dataset", type, paste0("y_", type, ".txt")))

  activitiesDict <- read.table(file.path("dataset", "activity_labels.txt"))
  names(activitiesDict) <- c("code", "value")
    
  # create activity column in dataset with descriptive value
  data$activity <- sapply(activity, function(n) { activitiesDict[n,2]})
  
  data
}

# download intial dataset

download_data()

# get test and train portion of tidy data

data_test <- load_data("test")
data_train <- load_data("train")

# merge data together
result <- rbind(data_test, data_train)

# store result 

#write.table(result, file="result.txt")

# build second dataset with aggregated data
# creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject
# subject, activity, mean
result_aggregated <- aggregate(. ~ subject + activity, data = result, FUN = mean)

# write data frame field names
write.table(names(result_aggregated), file="fields.txt", row.names = FALSE)

# store aggregated data
write.table(result_aggregated, file="result_aggregated.txt", row.names = FALSE)


