% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_edge_df.R
\name{create_edge_df}
\alias{create_edge_df}
\title{Create an edge data frame}
\usage{
create_edge_df(from, to, rel = NULL, ...)
}
\arguments{
\item{from}{a vector of node ID values from which
edges are outbound. The vector length must equal
that of the \code{to} vector.}

\item{to}{a vector of node ID values to which edges
are incoming. The vector length must equal that of
the \code{from} vector.}

\item{rel}{an optional \code{rel} label for each
edge.}

\item{...}{one or more named vectors for associated
attributes.}
}
\value{
an edge data frame (edf).
}
\description{
Combine several named vectors for edges
and their attributes into a data frame, which can be
combined with other similarly-generated data frames,
or, added to a graph object.
}
\examples{
# Create a simple edge data frame (edf) and
# view the results
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "a")

# Display the edge data frame
edf
#>   id from to rel
#> 1  1    1  4   a
#> 2  2    2  3   a
#> 3  3    3  1   a

# Create an edf with additional edge
# attributes (where their classes will be
# inferred from the input vectors)
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "a",
    length = c(50, 100, 250),
    color = "green",
    width = c(1, 5, 2))

# Display the edge data frame
edf
#>   id from to rel length color width
#> 1  1    1  4   a     50 green     1
#> 2  2    2  3   a    100 green     5
#> 3  3    3  1   a    250 green     2
}

