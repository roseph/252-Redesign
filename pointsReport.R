#Created by Dr. Nicole Radziwill

getMyCurrentPoints <- function(me) { 
   library(XML)

#=================================================================================================

# source_https is from 
# http://tonybreyal.wordpress.com/2011/11/24/source_https-sourcing-an-r-script-from-github/

source_https <- function(u, unlink.tmp.certs = FALSE) {
  # load package
  require(RCurl)
 
  # read script lines from website using a security certificate
  if(!file.exists("cacert.pem")) download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile = "cacert.pem")
  script <- getURL(u, followlocation = TRUE, cainfo = "cacert.pem")
  if(unlink.tmp.certs) unlink("cacert.pem")
 
  # parase lines and evealuate in the global environement
  eval(parse(text = script), envir= .GlobalEnv)
}

#=================================================================================================

# Load the loadPoints.R code from GitHub, which contains the readSpreadsheet() function
# and the full URL to access the points spreadsheet from this class

source_https("https://raw.githubusercontent.com/roseph/252-Redesign/master/loadPoints.R")

#=================================================================================================

# Here are some utilities that might help us later:

# Create Vector of Unique Courses
courses <- unique(df$class)

# Print All Courses
# for (a in 1:4) { writeLines(paste("Course #",a,"is",courses[a]),con=stdout(),sep="\n") }

# Create Data Frame of Unique Student-Course Pairs and Lookup Table
sc.pairs <- unique(df[,c("student","class")])
lookup.class <- new.env()
for (i in 1:nrow(sc.pairs)) {  lookup.class[[ sc.pairs$student[i] ]] <- sc.pairs$class[i] }

#=================================================================================================

# Actually do the work: FOR YOUR CLASS PRINT LEADERBOARD AND YOUR STUFF
my.course <- which(courses==lookup.class[[me]])
for (this.course in 1:length(my.course)) {
writeLines(paste("================Personalized Report for",me,"in",courses[my.course],"==================="), con=stdout(), sep="\n")
   if (nrow(df[df$student=="ALL" & df$class==courses[my.course],]) > 0) {
      current.all <- sum(as.integer(df[df$student=="ALL" & df$class==courses[my.course],]$points))
   } else {
      current.all <- 0
   }
   current.totals <- aggregate(as.integer(df[df$class==courses[my.course],]$points), by=list(df[df$class==courses[my.course],]$student), FUN=sum)
   current.totals$x <- current.totals$x + current.all
   writeLines(paste("Leaderboard for",courses[my.course]), con=stdout(), sep="\n")
   writeLines(paste("(Includes",current.all,"points earned by ALL students)"), con=stdout(), sep="\n")
   print(current.totals[rev(order(current.totals$x)),], quote=FALSE, row.names=FALSE)
   writeLines("=============================================================================", con=stdout(), sep="\n")

   for (s in me) {
      my.stuff <- rbind(df[df$student=="ALL" & df$class==courses[my.course],],df[df$student==s,])
      my.points <- sum(as.integer(my.stuff$points))
      writeLines(paste(s,"-- you currently have",my.points,"points! The tasks you have completed are:"), con=stdout(), sep="\n\n")
      print(my.stuff, quote = FALSE, row.names = FALSE)
      writeLines("=============================================================================", con=stdout(), sep="\n")
   }
}

}