## mgf processing script for CSI FingerID
## Agilent qual cannot write the ESI- charge correctly, so I have to correct the polarity in .mgf in batch

## step 1, turn .mgf into .txt

old.file.names <- dir("F:/UW/puget sound/data/marine water ESI neg/")     

# new naming rule
new.file.names <- sapply(old.file.names,function(file){
    # add .txt extension to mgf
  file <- paste0(file,".txt")
    return (file)
})

# rename in batch
setwd("F:/UW/puget sound/data/marine water ESI neg/")
file.rename(old.file.names,new.file.names)

## step 2, batch replace the + with -

library(readtext)
library(stringr)

files <- list.files(path="F:/UW/puget sound/data/marine water ESI neg/", pattern="*.txt")

# make sure setwd() is still effective

nega <- function(f) {
  temp <- readtext(f)
    temp <- str_replace_all(temp, "[+]", "-")
    writeLines(temp, con = f)
        }

data <- lapply(files, nega)

## step 3,  convert txt back to mgf

file.rename(new.file.names, old.file.names)

