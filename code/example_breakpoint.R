
# print the range of integer values as a condensed vector
dput_range <- function(x) {
  sx <- sort(x) %>% unique
  diff <- sx[-1] - sx[-length(sx)]
  
  # should they be joined
  same <- diff == 1
  
  string <- sx[1] %>% as.character
  
  pos <- 2
  len <- length(sx)
  follow <- 0
  
  # browser()
  
  while (pos <= len){
    
    if (same[pos-1]) {
      
      follow <- follow + 1
      
    } else {
      
      if (follow > 0) {
        string <- paste0(string, ":", sx[pos-1], sep = "")
      }
      
      follow <- 0
      string <- paste0(string, ",", sx[pos])
      
    }
    
    pos <- pos + 1
    
  }
  
  if (follow > 0) {
    # ***try to put a breakpoint here***
    string <- paste0(string, ":", sx[pos-1], sep = "")
  }
  
  if (stringr::str_detect(string, ",")) {
    string <- paste0("c(", string, ")")
  }
  
  cat(string)
  invisible(string)
  
}

# dput_range(sample(1:30, 20))


