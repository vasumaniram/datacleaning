runAnalysis<-function(){
  
  directory<-'./UCI HAR Dataset'
  testSubject<-read.table(file=paste(directory,'/test/subject_test.txt',sep=''),sep="")
  testX<-read.table(file=paste(directory,'/test/X_test.txt',sep=''),sep="");
  testY<-read.table(file=paste(directory,'/test/y_test.txt',sep=''),sep="")
  testY<-cbind(testY,as.character(factor(testY$V1,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))))
  colnames(testY)<-c("V1","V2")
  cols<-read.table(file=paste(directory,'/features.txt',sep=''),sep="")
  
  testFile<-as.data.frame(testSubject)
  testFile<-cbind(testFile,testY,testX)
  #colnames(testFile)<-c("Subject","Activity",as.character(cols$V2))
  
  trainSubject<-read.table(file=paste(directory,'/train/subject_train.txt',sep=''),sep="")
  trainX<-read.table(file=paste(directory,'/train/X_train.txt',sep=''),sep="")
  trainY<-read.table(file=paste(directory,'/train/y_train.txt',sep=''),sep="")
  trainY<-cbind(trainY,as.character(factor(trainY$V1,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))))
  colnames(trainY)<-c("V1","V2")

  
  trainFile<-as.data.frame(trainSubject)
  trainFile<-cbind(trainFile,trainY,trainX)
  
  
  mergedFile<-rbind(testFile,trainFile)
  colnames(mergedFile)<-c("Subject","Activity","ActivityDescription",as.character(cols$V2))
  filterdFile<-cbind(mergedFile[,1:3],mergedFile[,grep("(mean|std)\\(\\)",colnames(mergedFile))])
  #filterdFile<-mergedFile[]
  #filterdFile<-mergedFile[,c(1,2,3,204,205,217,218,230,231,243,244,256,257,506,507,519,520,532,533,545,546)]
  tidyData<-sapply(split(filterdFile[,4:69], list(filterdFile$Activity, filterdFile$Subject)),colMeans);
  write.table(tidyData, file="./tidydata.txt", sep="\t")
  tidyData
}