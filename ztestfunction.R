#Create a function to do 1-sided and 2-tests
#Inputs: xbar, mu, sigma, nu, Ha     Ha should be a str ("less" or "greater")
#Output: p-value

tests <- function(xbar, mu, sigma, n, Ha) {
  z <- (xbar-mu)/(sigma/sqrt(n))
  if(Ha == "less") {
    return(pnorm(z))
  } 
  else if (Ha == "greater") {
    return(1-(pnorm(z)))
  }
  else{
    print("Ha must be a string ('less' or 'greater')!")
  }
}
