downloadCoreNLP = function(outputLoc, type=c("base","chinese","spanish")) {

  baseURL = "http://nlp.stanford.edu/software/"
  coreFile = "/stanford-corenlp-full-2015-01-29"

  if (missing(outputLoc)) {
    outputLoc = system.file("extdata",package="coreNLP")
    if (file.access(outputLoc,"6") == -1)
      stop("You do not have read+write access to location where the",
           "coreNLP package is installed! You must specify an output",
           "location with outputLoc.")
  }

  if (type == "base") {
    ret = download.file(paste0(baseURL,coreFile),destfile=paste0(outputLoc, coreFile, ".zip"))
    if (ret != 0) stop("Download error!")

    unzip(paste0(outputLoc, coreFile, ".zip"), exdir=outputLoc)
    file.remove(paste0(outputLoc, coreFile, ".zip"))
  }

  if (!file.exists(paste0(outputLoc, "/", coreFile)))
    stop("Must download base files to this location first! Set type='base'.")

  if (type == "spanish")
    download.file(paste0(baseURL, "stanford-spanish-corenlp-2015-01-08-models.jar"),
      destfile=paste0(outputLoc, coreFile, "/stanford-spanish-corenlp-2015-01-08-models.jar"))

  if (type == "chinese")
    download.file(paste0(baseURL, "stanford-chinese-corenlp-2015-01-30-models.jar"),
      destfile=paste0(outputLoc, coreFile, "/stanford-chinese-corenlp-2015-01-30-models.jar"))

  if (type == "sr")
    download.file(paste0(baseURL, "stanford-srparser-2014-10-23-models.jar"),
      destfile=paste0(outputLoc, coreFile, "/stanford-srparser-2014-10-23-models.jar"))

}

# http://nlp.stanford.edu/software/stanford-spanish-corenlp-2015-01-08-models.jar
# http://nlp.stanford.edu/software/stanford-chinese-corenlp-2015-01-30-models.jar
# http://nlp.stanford.edu/software/http://nlp.stanford.edu/software/

# http://nlp.stanford.edu/software/stanford-parser-full-2015-01-29.zip