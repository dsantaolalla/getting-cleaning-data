# Reading the column headers  
colNames <- read.table("features.txt")
colNamesToSelect <- grepl(".mean()|.std()", colNames[,2])

activityLabels<-read.table("activity_labels.txt", col.names=c("id", "label"))

### TEST data ####

# Reading the test data, adding the proper headers and columnns
testTable <- read.table("test/X_test.txt", col.names=colNames[,2])
# Filtering out anything which does not contain mean or std in the column name
testTable<-subset(testTable, select=colNamesToSelect, drop = TRUE) 

testTable$subjectId <- read.table("test/subject_test.txt")$V1
testTableActivity<- read.table("test/y_test.txt", col.names=c("id"))
testTable$activity <- join(testTableActivity, activityLabels, by="id")$label


### TRAIN data ####

# Reading the train data, adding the proper headers and columnns
trainTable <- read.table("train/X_train.txt", col.names=colNames[,2])
# Filtering out anything which does not contain mean or std in the column name
trainTable<-subset(trainTable, select=colNamesToSelect, drop = TRUE) 

trainTable$subjectId <- read.table("train/subject_train.txt")$V1

trainTableActivity<- read.table("train/y_train.txt", col.names=c("id"))
trainTable$activity <- join(trainTableActivity, activityLabels, by="id")$label

## MERGING ###

# Adding test to train data table
mergedTable <- rbind(trainTable,testTable)

#We perform the avg grouping by activity and subject
grouped<-group_by(mergedTable, activity, subjectId)
summarizedTable <-summarise_each(grouped, funs(mean), matches(".mean()|.std()"))
summarizedTable