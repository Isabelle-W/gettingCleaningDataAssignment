## script download_data.R
## downloads dataset file to working directory and unzips it

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./Dataset.zip",method="curl")
dateDownloaded <- date()
print (dateDownloaded)

unzip("./Dataset.zip",exdir=".")
