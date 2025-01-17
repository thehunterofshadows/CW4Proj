#code for week 4 project
#librarys
#install.packages("dplyr")
#install.packages("purrr")
library(dplyr)
options(scipen=999)
#This is how you load the file in regular R 
#source("filename")




#What you will need to do
#Combine 

mySetup<-function(){
	temp<-tempfile()
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",temp)
	unzip(temp)
	unlink(temp)
}
myReadData<-function(){
	NEI<<-readRDS("summarySCC_PM25.rds")
	SCC<<-readRDS("Source_Classification_Code.rds")
}


myCreatePNG<-function(){
	#must use base library
	 NEI<<-subset(NEI,fips=="24510")
	 myNEI<<-summarise(group_by(NEI, year),Emissions=sum(Emissions))
	 Emissions<-myNEI$Emissions
	 Year<-myNEI$year
	 png("plot2.png", width=480, height=480)
	 plot(Year,Emissions,type="l")
	 points(Year,Emissions,pch=19)
	 abline(lm(Emissions ~ Year),lwd=2,col="red")
	 dev.off()
}




#Run these scripts
#mySetup()
myReadData()
myCreatePNG()