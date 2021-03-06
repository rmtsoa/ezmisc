% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/frame.R
\name{ez.2label}
\alias{ez.2label}
\title{wrapper of \code{\link[sjmisc]{to_label}}}
\usage{
ez.2label(x, col = NULL, add.non.labelled = TRUE, drop.is_na = FALSE, ...)
}
\arguments{
\item{x}{a data frame or a vector/col}

\item{col}{if x is a data frame, col is specified (e.g., "cond"), convert that col only
\cr        if x is a data frame, col is unspecified (i.e., NULL default), convert all possible cols in x
\cr        if x is not a data frame, col is ignored}

\item{drop.is_na}{ignore is_na attr, if yes, treat as NA}
}
\value{
returns a factor with string as its levels or a data frame with changed col(s)
}
\description{
continous/factorial number-->factorial level string, say, gender=0/1-->male/female
\cr more "agressive" than \code{\link{ez.2factor}}; opposite of \code{\link{ez.2value}}
}
\details{
Both value and variable label attributes will be removed when converting variables to factors.
}
\examples{

}
\seealso{
\code{\link[tidyr]{gather}}, \code{\link[tidyr]{spread}}, \code{\link[tidyr]{separate}}, \code{\link[tidyr]{unite}}
\cr \code{\link[dplyr]{select}}, \code{\link[dplyr]{slice}}
\cr \code{\link[dplyr]{distinct}}, \code{\link[dplyr]{arrange}}
\cr \code{\link[dplyr]{summarise}}, \code{\link[dplyr]{count}}, \code{\link[dplyr]{mutate}}
\cr \code{\link[dplyr]{group_by}}, \code{\link[dplyr]{left_join}}, \code{\link[dplyr]{right_join}}, \code{\link[dplyr]{inner_join}}, \code{\link[dplyr]{full_join}}, \code{\link[dplyr]{semi_join}}, \code{\link[dplyr]{anti_join}}
\cr \code{\link[dplyr]{intersect}}, \code{\link[dplyr]{union}}, \code{\link[dplyr]{setdiff}}
\cr \code{\link[dplyr]{bind_rows}}, \code{\link[dplyr]{bind_cols}}

Other data.transformation.functions: \code{\link{ez.2factor}},
  \code{\link{ez.2long}}, \code{\link{ez.2lower}},
  \code{\link{ez.2value}}, \code{\link{ez.2wide}},
  \code{\link{ez.compute}}, \code{\link{ez.delete}},
  \code{\link{ez.del}}, \code{\link{ez.label.get}},
  \code{\link{ez.label.set}}, \code{\link{ez.leftjoin}},
  \code{\link{ez.move}}, \code{\link{ez.newcol}},
  \code{\link{ez.recode2}}, \code{\link{ez.recode}},
  \code{\link{ez.recols}}, \code{\link{ez.recol}},
  \code{\link{ez.rename}}, \code{\link{ez.replace}},
  \code{\link{ez.rncols}}, \code{\link{ez.rncol}},
  \code{\link{ez.select}}, \code{\link{ez.sort}},
  \code{\link{ez.split}}, \code{\link{ez.unique}},
  \code{\link{ez.values.get}}, \code{\link{ez.values.set}}
}

