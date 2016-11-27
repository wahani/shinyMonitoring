path <- '/var/log'

## Settings for what is displayed:
pattern <- "log$"
recursive <- FALSE
allProperties <- c(
  "size", "isdir", "mode", "mtime", "ctime", "atime", "uid", 
  "gid", "uname", "grname"
)
properties <- allProperties[c(1, 4, 8, 9, 10)]
