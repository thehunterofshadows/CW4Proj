#code for week 4 project
#librarys
#install.packages("dplyr")
#install.packages("purrr")
library(dplyr)
library(ggplot2)
options(scipen=999)
#This is how you load the file in regular R 
#source("filename")




#What you will need to do
#Combine 
#Across the United States, how have emissions from 
#coal combustion-related sources changed from 1999–2008?

mySetup<-function(){
	temp<-tempfile()
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",temp)
	unzip(temp)
	unlink(temp)
}
myReadData<-function(){
	NEI<<-readRDS("summarySCC_PM25.rds")
	SCC<<-readRDS("Source_Classification_Code.rds")
	myFull<<-merge(NEI, SCC,by="SCC",all=TRUE)
}

myPrepData<-function(){
  #filter for Vehicle
  myComb<<-myFull[grep("(comb).*(coal)",myFull$Short.Name, ignore.case=TRUE),]
  myCombS<<-summarise(group_by(myComb, year),Emissions=sum(Emissions))
  View(myComb)
}

myCreatePNG<-function(){

	 	 
	 
	 #png("plot5.png", width=480, height=480)
	 g<-ggplot(myCombS,aes(year, Emissions))
	 g<-g+geom_point()
	 g<-g+geom_smooth(method="lm")
	 print(g)
	 #dev.off()
}




#Run these scripts
#mySetup()
#myReadData()
myPrepData()
myCreatePNG()