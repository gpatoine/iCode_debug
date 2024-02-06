

# Interactive help ------------------------
f <- function(a) g(a)
g <- function(b) h(b)
h <- function(c) i(c)
i <- function(d) {
  if (!is.numeric(d)) {
    stop("`d` must be numeric", call. = FALSE)
  }
  d + 10
}

f("a")

traceback()


library(dplyr)
iris %>% filter(Sepal.Lengt > 4)

traceback()

rlang::last_trace()
rlang::last_error()



# recover ----------------------------------

options(error = recover)
f(12)
f("a")

options(error = NULL)



# Browser and breakpoints ------------------
dput(x=sample(1:30, 24))
dput(1:5)
dput(c(1:5, 6))

source("code/example_breakpoint.R")
dput_range(sample(1:30, 25))
dput_range(c(1:5, 6))

# Now try with browser
# then with breakpoints

dput_range(sample(1:30, 15))



# debug() ---------------------------------
myfun <- function(i) {
  
  while(i<=10) {

    print(i*2)
    i <- i+1
  }
}

myfun(6)
debug(myfun)
myfun(4)
undebug(myfun)

debugonce(myfun)
myfun(2)



# Now pick a function to look into, or try to resolve an error that you had.
# Examples:

sample
lm
ggplot
