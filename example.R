structures <- function(){
	greeting <- "Hello World!"

	vector <- c(1,2,3,4,5,6)
	

	frame <- data.frame(Hello=c(1,2,3),World=c(4,5,6))
	

	list <- list(1,2,frame,4,5)
	new_list <- c(list,6)

	closing <- "All Done!"
	
	return(list(greeting,vector,frame,new_list,closing))
}