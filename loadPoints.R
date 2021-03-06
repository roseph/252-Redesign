library(XML)

readSpreadsheet <- function(url, sheet = 1){
   library(httr)
   r <- GET(url)
   html <- content(r)
   sheets <- readHTMLTable(html, header=FALSE, stringsAsFactors=FALSE)
   df <- sheets[[sheet]]
   dfClean <- function(df){
     nms <- t(df[1,])
     names(df) <- nms
     df <- df[-1,-1] 
     row.names(df) <- seq(1,nrow(df))
     ##df[,5] <- as.numeric(as.character(df[,5]))
     df
   }
   dfClean(df)
 }

url <- "https://docs.google.com/spreadsheets/d/1IUNwWVd9tHQeibzGWiAT1EJ6KxeHVo_XDvJHZtesRS0/pubhtml"
df <- readSpreadsheet(url)


