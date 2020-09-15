# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("Gviz", version = "3.8")

library(Gviz)
axTrack <- GenomeAxisTrack() 
axTrack
plotTracks(axTrack, from = 1e6, to = 10e6)
plotTracks(axTrack, from=1e6, to=10e6, add53=TRUE, add35=TRUE, littleTicks=TRUE)
url <- "http://hgdownload.cse.ucsc.edu/goldenPath/dm3/database/chr3R_rmsk.txt.gz"
con <- gzcon(url(url, open="r"))
repeats <- read.table(textConnection(readLines(con)), nrow=50)[, 6:8]
annoTrack <- AnnotationTrack(start=repeats[,2],
                             end=repeats[,3], chromosome=repeats[,1],
                             genome="dm3", name="Repeats", stacking="dense")
annoTrack
plotTracks(list(axTrack, annoTrack))
SHIBUSHIHE