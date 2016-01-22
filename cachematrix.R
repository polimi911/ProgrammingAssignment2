## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
inverse <- NULL
set <- function(Y){
	X <<- Y
	inverse <<- NULL
	}
get <- function() X
setinverse <- function(Inverse) inverse <<- Inverse
getinverse <- function() inverse
list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
if(require("corpcor")){
	print("corpcor is loaded correctly")
	} else {
		print("trying to install corpcor")
		install.packages("corpcor")
		if(require(corpcor)){
			print("corpcor installed and loaded")
			} else {
			stop("could not install corpcor")
			}
		}
inverse <- X$getinverse()
if(!is.null(inverse)){
	message("matrix is in memory")
	return(inverse)
	}
message("inverse is not in memory so the inverse (if exist) is gonna be computed")
data <- X$get()
inverse <- pseudoinverse(data, ...)
X$setinverse(inverse)
inverse
}


# execute above function, try it how does it work
X <- matrix(rpois(15,3), nrow = 5)
mat <- makeCacheMatrix(X)
mat$get()
cacheSolve(mat)
cacheSolve(mat)
invX <- cacheSolve(mat)

# execute the function, try it how does it work
Y <- matrix(rpois(20,2), nrow = 5, ncol = 4)
mat_ <- makeCacheMatrix(Y)
mat_$get()
cacheSolve(mat_)
cacheSolve(mat_)
inv_ <- cacheSolve(mat_)
