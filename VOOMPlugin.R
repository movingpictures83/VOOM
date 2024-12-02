library(edgeR)
library(limma)

input <- function(inputfile) {
   dgel2 <<- readRDS(inputfile)
}

run <- function() {}

output <- function(outputfile) {

grp.idx <- rep(c("knockdown", "control"), each=4)
design <- model.matrix(~grp.idx)
log2.cpm <- voom(dgel2,design)
fit <- lmFit(log2.cpm,design)
saveRDS(fit, outputfile)
}
