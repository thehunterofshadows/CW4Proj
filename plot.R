#code for week 4 project
#librarys



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
}


#Run these scripts
#mySetup()
#myReadData()