


library(tictoc)
library(foreach)
library(iterators)
library(parallel)
library(tidyverse)


#Timing solutions
tic("Timing Solution 1")
source("scripts/hw4_solution1.R")
toc(log = TRUE)     # 41.55 sec 



tic("Timing Solution 2")
source("scripts/hw4_solution2.R")
toc(log = TRUE)     # 35.25 sec 



tic("Timing Solution 3")
source("scripts/hw4_solution3.R")
toc(log = TRUE)     # 14.14 sec 



#making the results:
printTicTocLog <- 
  function() {
    tic.log() %>% 
      unlist %>% 
      tibble(logvals = .) %>% 
      separate(logvals, 
               sep = ":", 
               into = c("Solutions", "log")) %>% 
      mutate(log = str_trim(log)) %>% 
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }

# Print results
printTicTocLog() %>% 
  knitr::kable()

