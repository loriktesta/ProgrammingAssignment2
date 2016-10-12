## This function is an example of lexical scoping and object
## oriented programming in R. 


## Providing makeCacheMatrix with an inversible 
## square matrix will return an object that has functions
## that can be called against/with the object.
## Returns a list of objects (functions)

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y = matrix()) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Calling cacheSolve with this output from makeCacheMatrix will provide
## you with the inverse matrix either computed or from cache
## Returns an inverse matrix

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
                
