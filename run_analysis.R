# Reading the column headers  
colNames <- read.table("features.txt")
colNamesToSelect <- grepl(".mean()|.std()", colNames[,2])

# Reading the test data, adding the proper headers and columnns
testTable <- read.table("test/X_test.txt", col.names=colNames[,2])
# Filtering out anything which does not contain mean or std in the column name
testTable<-subset(testTable, select=colNamesToSelect, drop = TRUE) 

testTable$subjectId <- read.table("test/subject_test.txt")$V1
testTable$activity <- read.table("test/y_test.txt")$V1

# Reading the train data, adding the proper headers and columnns
trainTable <- read.table("train/X_train.txt", col.names=colNames[,2])
# Filtering out anything which does not contain mean or std in the column name
trainTable<-subset(trainTable, select=colNamesToSelect, drop = TRUE) 

trainTable$subjectId <- read.table("train/subject_train.txt")$V1
trainTable$activity <- read.table("train/y_train.txt")$V1

# Adding test to train data table
table <- rbind(trainTable,testTable)

#TODO: add labels of the activities
#TODO: perform the avg grouping by activity and subject