## This script includes two functions that demonstrate using lexical scoping
## Using these functions, a value can be cached and then returned or set
## depending on whether it already  has a value

## The following function allows user to set & get value of matrix, then set 
## & get its inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inverse <<- solve
  getinverse <- function() inverse
  list(set = set, get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


## This will return a matrix that is the inverse of x, using the cached results
## if they exist

cacheSolve <- function(x, ...) {
  browser()
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
