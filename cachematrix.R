## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix takes a matrix object as "x". get function displays the matrix.
## setinverse caches user input matrix and getinverse gives cache inverse matrix. 


makeCacheMatrix <- function(x = matrix()) {
	i<-NULL
	get <- function() x
	setinverse<-function(invmat) i <<- invmat
	getinverse<-function() i
	list(get=get, setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve calls getinverse function which is defined in makeCacheMatrix function environment which
## reterives cache inverse matrix. If there is no cache matrix, the function calls 
## get function which is defined in makecachematrix function which takes the variable defined in that particular 
## function and hence calculates inverse and displays inverse matrix.

cacheSolve <- function(x, ...) {
	i<-x$getinverse()
	if(!is.null(i)) {
		message("getting cached data")
		return(i)
	}
	data <- x$get() 
	i<-Inverse(data)
	x$setinverse(i)
	i   ## Return a matrix that is the inverse of 'x'
}
