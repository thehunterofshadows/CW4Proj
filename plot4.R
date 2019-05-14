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
   #Limits to just Baltimore City
	 NEI<<-subset(NEI,fips=="24510")
	 	 
	 
	 png("plot3.png", width=480, height=480)
	 g<-ggplot(NEI,aes(year, Emissions))
	 g<-g+facet_wrap(aes(type),scales="free")+coord_cartesian(ylim=c(0,400))
	 g<-g+geom_point()
	 g<-g+geom_smooth(method="lm")
	 print(g)
	 dev.off()
}




#Run these scripts
#mySetup()
myReadData()
myCreatePNG()