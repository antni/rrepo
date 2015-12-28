makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  mset <- function(y) {
    x <- y
    return(x)
    m <<- NULL
  }
  mget <- function() x 
  setinv <- function(solve) m <<- solve
  getinv <- function()
  list(mset = mset, mget = mget,
       setinv = setinv,
       getinv = getinv)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    s <- x$getinv()
    if(!is.null(s)) {
      message("getting cached data")
      return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setinv(s)
    s
  }
