# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# environment, file, folder, os
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# options(warn=-1)  # turn off warning
# options(warn=0)  # turn back on warning

#' alias of \code{\link{stop}}
#' @param
#' @return
#' @examples
#' @export
ez.error = stop

#' print the version of a package
#' @param pkg package name in quotes, default is NULL
#' @return if pkg not provided, prints only R version
#' @examples
#' @export
ez.ver = function(pkg=NULL){
    if (!is.null(pkg)) {
        cat(sprintf("%s\n%s: %s", R.version.string, pkg, as.character(packageVersion(pkg))))
    } else {
        cat(R.version.string)
    }
}

#' alias of \code{\link{library}}
#' @param
#' @return
#' @examples
#' @export
ez.import = library

#' alias of \code{\link{library}}
#' @param
#' @return
#' @examples
#' @export
ez.include = ez.import

#' alias of \code{\link{install.packages}}
#' @param
#' @return
#' @examples
#' @export
ez.install = install.packages

#' require a package, if not exist auto install and auto load
#' @param pkg pkg name in string
#' @param autoload auto load or not (default=TRUE)
#' @return
#' @examples
#' @export
ez.require = function(pkg, autoload=TRUE){
    tt = sprintf("require('%s')",pkg)
    if (!eval(parse(text = tt))) {
        tt = sprintf("install.packages('%s')",pkg)
        eval(parse(text = tt))
    }
    if (autoload) {
        tt = sprintf("require('%s')",pkg)
        eval(parse(text = tt))
    }
}

#' unload a package, wrapper of detach(pkg, unload=TRUE, character.only = TRUE)
#' @param pkg pkg name in string
#' @return
#' @examples
#' @export
ez.unload = function(pkg){
    character.only = TRUE
    if(!character.only){
        pkg <- deparse(substitute(pkg))
        }
    search_item <- paste("package", pkg, sep = ":")
    while(search_item %in% search()){
        detach(search_item, unload = TRUE, character.only = TRUE)
        cat(sprintf('unloaded %s',search_item))
    }
}

#' alias of \code{\link{devtools::install_github}}
#' @param
#' @return
#' @examples
#' @export
ez.github = devtools::install_github

#' alias of \code{\link{remove.packages}}
#' @param
#' @return
#' @examples
#' @export
ez.remove = remove.packages

#' alias of \code{\link{remove.packages}}
#' @param
#' @return
#' @examples
#' @export
ez.uninstall = remove.packages

#' clear, clean  console, workspace, plot or variable(s)
#' @param area 0 all, \cr
#'             1 console only \cr
#'             2 workspace only \cr
#'             3 plot only \cr
#'             'var' particular var \cr
#'             c('var1','var2') particular vars
#' @return
#' @examples
#' @export
ez.clear = function(area=0) {
    # area[1] used, to work around when c('var1','var2') provided
    if (area[1] == 0) {console = TRUE; workspace = TRUE; plot = TRUE}
    else if (area[1] == 1) {console = TRUE; workspace = FALSE; plot = FALSE}
    else if (area[1] == 2) {console = FALSE; workspace = TRUE; plot = FALSE}
    else if (area[1] == 3) {console = FALSE; workspace = FALSE; plot = TRUE}
    else {rm(list=area, envir = .GlobalEnv); console = FALSE; workspace = FALSE; plot = FALSE}

    if (console) {
        # cat("\014")  # clear console ctrl+l
        cat(rep("\n",50)) # "visually" clear
    }
    if (workspace) {
        # rm(list=ls()) # clear workspace
        # rm(list = ls(all=TRUE, .GlobalEnv), envir = .GlobalEnv) # clear also .hidden objects
        rm(list = ls(.GlobalEnv), envir = .GlobalEnv)
    }
    if (plot) {
        try(dev.off(), silent=TRUE)  # clear plot
        # dev.off(dev.list()["RStudioGD"])
    }
    null = gc()  # call garbage collection
}

#' clear, clean  console, workspace, plot or variable(s)
#' @param area 0 all, \cr
#'             1 console only \cr
#'             2 workspace only \cr
#'             3 plot only \cr
#'             'var' particular var \cr
#'             c('var1','var2') particular vars
#' @return
#' @examples
#' @export
ez.clean = ez.clear

#' alias of \code{\link{find}}
#' @param
#' @return
#' @examples
#' @export
ez.which = find

#' alias of \code{\link{sessionInfo}}, \code{\link{ez.who}}
#' @param
#' @return Print version information about R, the OS and attached or loaded packages.
#' @examples
#' @export
#' @seealso \code{\link{objects}}
ez.whos = sessionInfo

#' alias of \code{\link{sessionInfo}}, \code{\link{ez.whos}}
#' @param
#' @return Print version information about R, the OS and attached or loaded packages.
#' @examples
#' @export
#' @seealso \code{\link{objects}}
ez.who = ez.whos

#' user path like in Matlab
#' @description alias of \code{\link{search}}
#' @param
#' @return
#' @examples
#' @export
ez.path = search

#' alias of \code{\link{system}}
#' @param
#' @return
#' @examples
#' @export
ez.execute = system

#' alias of \code{\link{file.path}}
#' @param
#' @return
#' @examples
#' paste(..., sep=.Platform$file.sep)
#' @export
ez.joinpath = file.path

#' splitpath
#' @param
#' @return
#' @examples
#' ez.splitpath(path)
#' returns
#' $dir
#' [1] "/Users/jerry/Downloads"
#'
#' $file
#' [1] "026999397379845a"
#'
#' $ext
#' '.pdf
#' @export
ez.splitpath = function(path){
    dir = dirname(path)
    file = basename(path)
    # file = strsplit(file, "\\.")[[1]][1]
    file = tools::file_path_sans_ext(file)
    # ext = tools::file_ext(path)  # does not have . i.e., 'pdf' instead of '.pdf'
    ext = substring(basename(path),nchar(file)+1)  # substring to extract ext, see ?substring
    return(list(dir=dir, file=file, ext=ext))
}

#' parentdir
#' @param
#' @return
#' @examples
#' @export
ez.parentdir = function(path){dirname(path)}

#' alias of \code{\link{setwd}}
#' @param
#' @return
#' @examples
#' @export
ez.cd = setwd;

#' alias of \code{\link{getwd}}
#' @param
#' @return
#' @examples
#' @export
ez.cwd = getwd

#' alias of \code{\link{getwd}}
#' @param
#' @return
#' @examples
#' @export
ez.pwd = getwd

#' current script file (in full path)
#' @param
#' @return
#' @examples
#' works with Rscript, source() or in RStudio Run selection
#' @export
ez.csf <- function() {
    # http://stackoverflow.com/a/32016824/2292993
    cmdArgs = commandArgs(trailingOnly = FALSE)
    needle = "--file="
    match = grep(needle, cmdArgs)
    if (length(match) > 0) {
        # Rscript via command line
        return(normalizePath(sub(needle, "", cmdArgs[match])))
    } else {
        ls_vars = ls(sys.frames()[[1]])
        if ("fileName" %in% ls_vars) {
            # Source'd via RStudio
            return(normalizePath(sys.frames()[[1]]$fileName)) 
        } else {
            if (!is.null(sys.frames()[[1]]$ofile)) {
            # Source'd via R console
            return(normalizePath(sys.frames()[[1]]$ofile))
            } else {
                # RStudio Run Selection
                # http://stackoverflow.com/a/35842176/2292993  
                return(normalizePath(rstudioapi::getActiveDocumentContext()$path))
            }
        }
    }
}

#' current script dir (in full path)
#' @param
#' @return
#' @examples
#' works with Rscript, source() or in RStudio Run selection
#' @export
ez.csd <- function() {
    return(dirname(ez.csf()))
}

#' lsd
#' @param
#' @return
#' @examples
#' can also include .folders
#' all.files--hidden files, include.dirs--subdirs, no..--. and .. folders
#' @export
ez.lsd = function(path='.', pattern=NULL){
    folders = dir(path=path, pattern=pattern, all.files=TRUE, full.name=FALSE,
                  recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, no.. = TRUE)
    fullFolders = file.path(path,folders)
    infos = file.info(fullFolders)
    isdirs = infos$isdir
    return(folders[isdirs])
}

#' ls
#' @param
#' @return
#' @examples
#' @export
ez.ls = function(path='.', pattern=NULL){
    files = list.files(path = path, pattern = pattern, all.files = TRUE,
                       full.names = TRUE, recursive = FALSE,
                       ignore.case = FALSE, include.dirs = FALSE, no.. = TRUE)
    isfiles = !(file.info(files)$isdir)
    return(files[isfiles])
}

#' fls
#' @param
#' @return
#' @examples
#' @export
ez.fls = function(path='.', pattern=NULL){
    files = list.files(path = path, pattern = pattern, all.files = TRUE,
                       full.names = TRUE, recursive = TRUE,
                       ignore.case = FALSE, include.dirs = FALSE, no.. = TRUE)
    isfiles = !(file.info(files)$isdir)
    return(files[isfiles])
}

#' mkdir, no warning for exisiting folder
#' @param
#' @return
#' @examples
#' @export
ez.mkdir = function(path){
    result = dir.create(path, showWarnings = FALSE, recursive = TRUE)
}

#' alias of \code{\link{file.exists}}
#' @param
#' @return
#' @examples
#' @export
ez.exists = file.exists

#' remove a file, wrapper of \code{\link{unlink}}
#' @param
#' @return
#' @examples
#' support c('a.txt','b.txt')
#' x, a character vector with the names of the file(s) or directories to be deleted.
#' Wildcards (normally ‘*’ and ‘?’) are allowed.
#' 0 for success, 1 for failure.
#' @export
ez.rm = function(x){
    result = unlink(x, recursive = TRUE, force = TRUE)
}

#' rename
#' @param
#' @return
#' @examples
#' support c('a.txt','b.txt'), c('d.txt','e.txt')
#' to parent folder must exist already; otherwise error
#' in case new name exists
#'       if old and new both folders, move old to new as subfolder
#'       if old and new both files, overwrite the new file with old file without prompt
#' @export
ez.rn = function(from,to){
    todir <- dirname(to)
    if (!isTRUE(file.info(todir)$isdir)) stop("Destination parent folder does not exist")
    # both from and to are exisiting folders
    if ((nchar(tools::file_ext(from)) == 0) && (nchar(tools::file_ext(to)) == 0)) {
        if ((isTRUE(file.info(from)$isdir)) && (isTRUE(file.info(to)$isdir))) {
            result = ez.mv(from,to)
        }
        else {
            result = file.rename(from,to)
        }
    }
    else {
        result = file.rename(from,to)
    }
}

#' copy
#' @param
#' @return
#' @examples
#' support c('a.txt','b.txt')
#' to folder does not have to exist already
#' e.g.,
#' 1) both works ez.cp('a.txt','folder'), ez.cp('a.txt','folder/b.txt')
#' the former copy still has the same name 'a.txt', the latter copy new name 'b.txt'
#' also ez.cp(c('a.txt','b.txt'),'folder')
#' 2) folder: ez.cp('a','b')-->if b not exists, cp contents of a to b; if b exist, a becomes subfolder of b
#' kinda combines rn and mv
#' 3) regular expression
#' flist <- list.files("patha", "^filea.+[.]csv$", full.names = TRUE)
#' file.copy(flist, "pathb")
#' @export
ez.cp = function(from,to){
    # if from is file
    if (!(file.info(from)$isdir[1])) {
        # both works file.copy('a.txt','folder'), file.copy('a.txt','folder/b.txt')
        # the former copy still has the same name 'a.txt', the latter copy new name 'b.txt'

        # if to is folder-like
        if (nchar(tools::file_ext(to)) == 0) {
            # if to not exist
            if (!isTRUE(file.info(to)$isdir)) dir.create(to, recursive=TRUE)
        }
        else {
            # if to parent not exist
            todir <- dirname(to)
            if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
        }
        result = file.copy(from, to, overwrite = TRUE, recursive = FALSE)
    }
    else {
        # if to exist, from becomes a subfolder of to
        if (isTRUE(file.info(to)$isdir)) {
            result = file.copy(from, to, overwrite = TRUE, recursive = TRUE)
        }
        # else copy each individual file
        else {
            dir.create(to, recursive=TRUE)
            allFiles = dir(from)
            result = sapply(allFiles, function(x) {
                file.copy(from=file.path(from, x),
                          to=file.path(to, x),
                          overwrite=TRUE) })
        }
    }
}

#' move
#' @param
#' @return
#' @examples
#' support c('a.txt','b.txt')
#' to parent folder does not have to exist already
#' ez.mv('a.txt','folder'), ez.mv('a.txt','folder/a.txt'), ez.mv('a.txt','folder/b.txt')
#' ez.mv('a','b')-->get b/a, b now has a as subfolder, regardless of b exists or not
#'                  use ez.rn('a','b') to change name a->b
#' @export
ez.mv = function(from,to){
    # if to is folder-like
    if (nchar(tools::file_ext(to)) == 0) {
        # if to not exist
        if (!isTRUE(file.info(to)$isdir)) dir.create(to, recursive=TRUE)
        to = file.path(to, basename(from))
    }
    else {
        # if to parent not exist
        todir <- dirname(to)
        if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
    }
    result = file.rename(from = from, to = to)
}
