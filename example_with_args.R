structures <- function(power){
	greeting <- "Hello World!"

	vector <- c(1,2,3,4,5,6)
    powered_vector <- vector^power
	

	frame <- data.frame(Hello=c(1,2,3),World=c(4,5,6))
    new_frame <- frame^power
	

	list <- list(1,2,frame,4,5)
	new_list <- c(list,6)

	closing <- "All Done!"
	
	return(list(greeting,powered_vector,new_frame,new_list,closing))
}