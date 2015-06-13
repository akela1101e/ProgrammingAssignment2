# #### Usage ####
#
# a = makeCacheMatrix(matrix(rnorm(9), 3))
#
# i1 = cacheSolve(a) # create and cache inverse
# i2 = cacheSolve(a) # reuse cached inverse
#


##
# CacheMatrix: list containing matrix and it's cached inverse.
#
makeCacheMatrix <- function(x = matrix())
{
	m = x       # matrix
	inv = NULL  # inverse

	# methods
	GetM = function() m
	GetInv = function() inv

	SetM = function(m_) m <<- m_
	SetInv = function(inv_) inv <<- inv_

	# return
	list(GetM = GetM,
		 GetInv = GetInv,
		 SetM = SetM,
		 SetInv = SetInv
		)
}


##
# Method taking inverse of CacheMatrix.
#
cacheSolve <- function(cx, ...)
{
	if( is.null(cx$GetInv()) )
	{
		cx$SetInv(solve(cx$GetM()))
		message("Inverse created.")
	}
	cx$GetInv()
}
