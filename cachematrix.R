## Rich Jones
## 27 July 2014
## DataScience Coursera

## The two functions below cache the inverse of a matrix.
## The code does not work.


## makeCacheMatrix
## ---------------
## the makeCacheMatrix function creates a special "matrix" object that can 
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        xi   <-  NULL
        set <-  function(y) {
                x   <<- y
                xi   <<- NULL
        }
        get <- function() x
        setmatrix <- function(solve) xi <<- solve
        getmatrix <- function() xi
        list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}



## cacheSolve
## ----------
## The function cacheSolve computes the inverse of the special "matrix" 
## returned by makeCacheMatrix. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.



cacheSolve <- function(x=matrix(), ...) {

        ## Here we access the global environment and determine
        ## if the inverted matrix exists. If it does it
        ## is returned
        if (exists("xi")==1) {
                xi <- x$getmatrix()
                print("getting cached data")
                return(xi)
        }
        
        ## If the global enviroment does not contain the
        ## inverted matrix, we solve for it's inverse
        ## and place it in the global environment.
        
        ## Computing the inverse of a square matrix can be done with 
        ## the solve function in R. For example, if X is a square 
        ## invertible matrix, then solve(X) returns its inverse.
        
        if (exists("xi")==0) {
		print("Solving inverse")
                print(matrix)
		xi <- solve(matrix)
	        x$setmatrix(xi)
	}
        xi
        
}

## Aknowledgements
## ---------------
## This attempt, but currently non-functional program was c
## created with help from posts at Stack Overflow 
## (user3643053), and an anonymous poster at PasteBin
## (http://pastebin.com/zapAw1z8). Overview descriptions of 
## functions are provided by R Programming/Coursera 
## instructors.

A <- matrix(c(1 , 2 , 3 , 0 , 1 , 4 , 5 , 6, 0),nrow=3,ncol=3,byrow=3)
makeCacheMatrix(A)
foo <- cacheSolve(A)
foo

