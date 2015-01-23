## Caching the Inverse of a Matrix
## function'makeCacheMatrix' creates a special "matrix" object,
## which is a list containing function to setmatrix and getmatrix.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y    #deep assignment arrow, modifies an existing,
                m <<- NULL #variable by the parent environments.
        }
        get <- function() x
        setmatrix <- function(matrix) m <<- matrix
        getmatrix <- function() m
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
        
}

## function `cacheSolve` computes the inverse of the special
## "matrix" returned by `makeCacheMatrix`. 

cacheSolve <- function(x = matrix, ...) {
        
        if(!is.null(x)) {
                message("getting cached matrix")
                return(x)
        }
        md <- x$get()
        m  <- solve(md, ...)
        
        ## If missing argument 'b' in "solve(md, b)", b is taken to be an
        ## identity matrix and solve will return the inverse of x.
}