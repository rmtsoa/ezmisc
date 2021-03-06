% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{ggmultiplot}
\alias{ggmultiplot}
\title{Multiple plot function}
\usage{
ggmultiplot(..., plotlist = NULL, file, cols = 1, layout = NULL)
}
\arguments{
\item{ggplot}{objects can be passed in ..., or to plotlist (as a list of ggplot objects)}

\item{cols:}{Number of columns in layout}

\item{layout:}{A matrix specifying the layout. If present, 'cols' is ignored.
\cr If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
\cr then plot 1 will go in the upper left, 2 will go in the upper right, and
\cr 3 will go all the way across the bottom.}
}
\value{
returns nothing (NULL)
}
\description{
Multiple plot function
}
\examples{
plots <- list()  # new empty list
for (i in 1:6) {
    p1 = qplot(1:10, rnorm(10), main = i)
    plots[[i]] <- p1  # add each plot into plot list
}
ggmultiplot(plotlist = plots, cols = 3)



plots <- list()
for (i in 1:5) {
    p1 = qplot(1:10, rnorm(10), main = i)
    plots[[i]] <- p1
}
layout <- matrix(c(1, 1, 2, 3, 4, 5), nrow = 2, byrow = TRUE)
ggmultiplot(plotlist = plots, layout = layout)

}
\references{
\href{http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/}{Cookbook R}
}

