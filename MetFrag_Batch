## Load necessary packages
## Need the ReSOLUTION package (https://github.com/schymane/ReSOLUTION) from Dr. Schymanski, and read the document from that package

library(ReSOLUTION)
library(schoolmath)

## Set up the MetFrag CL. Need to download it from: http://c-ruttkies.github.io/MetFrag/
## Change these to the version and directory in your local computer, otherwise it won't work
MetFragCL_name <- "MetFrag2.4.5-CL.jar"
metfrag_dir <- "G:/metfrag/"

## Test with a single peak list file
config_file_1 <- MetFragConfig(256.0137,"[M+H]+","lamotrigine_pos","256_pos.txt", test_dir, DB="PubChem",neutralPrecursorMass=FALSE, ppm=10, mzabs=0.0015, frag_ppm=20)

## Test with lamotrigine, based on formula
config_file_3 <- MetFragConfig.formula("C9H7Cl2N5","[M+H]+",IsPosMode=TRUE, neutralPrecursorMass=FALSE, "Lamotrigine_pos_formula", "F:/academic/R proj/metfrag/256_pos.txt", test_dir, DB="PubChem", frag_ppm=20, minInt=50)

runMetFrag(config_file_1, metfrag_dir, MetFragCL_name)
runMetFrag(config_file_3, metfrag_dir, MetFragCL_name)

## Formula-based run worked better, as the mass accuracy might not be ideal


## Loop function based on m/z. Please see the example list file for the columns
## Higher mass accuracy will lead to better results. Using the m/z from MS1 is recommended

metfrag_batch_mz<- function (list_file){
  lf <- read.csv(list_file, header = TRUE)
  n = nrow(lf) 
  for (i in 1:n){
    config_file[i] <- MetFragConfig(mass=lf$mz[i], adduct_type= lf$adduct[i], results_filename = as.character(lf$formula[i]), base_dir="G:/metfrag/metfrag_results/", IsPosMode = is.positive(lf$adduct[i]), peaklist_path = lf$peaklist[i], test_dir, DB= "PubChem", neutralPrecursorMass=FALSE, ppm=10, mzabs=0.0015, frag_ppm=20, minInt=50)
    runMetFrag(config_file[i], metfrag_dir, MetFragCL_name)}}

## Run the function, and check the results
metfrag_batch("F:/academic/R proj/metfrag/filelist/list_file_test_20190118.csv")
    
    
## Another function based on formula, but NOT working due to a bug (?)
metfrag_batch <- function (list_file){
  lf <- read.csv(list_file, header = TRUE)
n = nrow(lf) 
for (i in 1:n){
  config_file[i] <- MetFragConfig.formula(mol_form=lf$formula[i], adduct_type=lf$adduct[i], results_filename = as.character(lf$formula[i]), base_dir="G:/metfrag/metfrag_results/", IsPosMode = is.positive(lf$adduct[i]), peaklist_path = lf$peaklist[i], test_dir, DB= "PubChem", neutralPrecursorMass=FALSE, ppm=10, mzabs=0.0015, frag_ppm=20, minInt=50)
  runMetFrag(config_file[i], metfrag_dir, MetFragCL_name)}}
