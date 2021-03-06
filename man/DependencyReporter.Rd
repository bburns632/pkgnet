% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DependencyReporter.R
\name{DependencyReporter}
\alias{DependencyReporter}
\title{Recursive Package Dependency Reporter}
\description{
This reporter looks at the recursive network of its dependencies
   on other packages. This allows a developer to understand how individual
   dependencies might lead to a much larger set of dependencies, potentially
   informing decisions on including or removing them.
}
\section{Class Constructor}{

\preformatted{DependencyReporter$new()}


\describe{
    \item{\code{}}{
        \itemize{
            \item{Initialize an instance of the reporter.}
            \item{\bold{Returns:}}{
                \itemize{
                    \item{Instantiated reporter object. Note that this
                       reporter object isn't useful yet until you use the
                       \code{set_package} method to set a package.
                    }
                }
            }
        }
    }
}
}

\section{Public Methods}{

\describe{
    \item{\code{set_package(pkg_name, pkg_path = NULL)}}{
        \itemize{
            \item{Set the package that the reporter will analyze. This can
                only be done once for a given instance of a reporter.
                Instantiate a new copy of the reporter if you need to analyze
                a different package.
            }
            \item{\bold{Args:}}{
                \itemize{
                    \item{\bold{\code{pkg_name}}: character string, name of
                     package
                 }
                    \item{\bold{\code{pkg_path}}: character string, optional
                    directory path to source code of the package. It is used
                    for calculating test coverage. It can be an absolute or
                    relative path.
                 }
                }
            }
            \item{\bold{Returns:}}{
                \itemize{
                    \item{Self, invisibly.}
                }
            }
        }
    }
    \item{\code{get_summary_view()}}{
        \itemize{
            \item{Returns an htmlwidget object that summarizes the analysis
                of the reporter. Used when creating a
                \link[=CreatePackageReport]{package report}.
            }
            \item{\bold{Returns:}}{
                \itemize{
                    \item{\link[htmlwidgets:htmlwidgets-package]{htmlwidget}
                        object
                    }
                }
            }
        }
    }
}


\describe{
    \item{\code{calculate_default_measures()}}{
        \itemize{
            \item{Calculates the default node and network measures for this
               reporter.
            }
            \item{\bold{Returns:}}{
                \itemize{
                    \item{Self, invisibly.}
                }
            }
        }
    }
}
}

\section{Public Fields}{

\describe{
    \item{\bold{\code{pkg_name}}}{: character string, name of set package.
        Read-only.
    }
    \item{\bold{\code{report_markdown_path}}}{: character string, path to
        R Markdown template for this reporter. Read-only.
    }
}


\describe{
    \item{\bold{\code{nodes}}}{: a data.table, containing information about
       the nodes of the network the reporter is analyzing. The \code{node}
       column acts the identifier. Read-only.
    }
    \item{\bold{\code{edges}}}{: a data.table, containing information about
       the edge connections of the network the reporter is analyzing. Each
       row is one edge, and the columns \code{SOURCE} and \code{TARGET}
       specify the node identifiers. Read-only.
    }
    \item{\bold{\code{network_measures}}}{: a list, containing any measures
       of the network calculated by the reporter. Read-only.
    }
    \item{\bold{\code{pkg_graph}}}{: a graph model object. See \link{DirectedGraph}
       for additional documentation. Read-only.
    }
    \item{\bold{\code{graph_viz}}}{: a graph visualization object. A
       \code{\link[visNetwork:visNetwork]{visNetwork::visNetwork}} object.
       Read-only.
    }
    \item{\bold{\code{layout_type}}}{: a character string, the current layout
       type for the graph visualization. Can be assigned a new valid layout
       type value. Use use
       \code{grep("^layout_\\\\S", getNamespaceExports("igraph"), value = TRUE)}
       to see valid options.
    }
}
}

\section{Special Methods}{

\describe{
    \item{\code{clone(deep = FALSE)}}{
        \itemize{
            \item{Method for copying an object. See
                \href{https://adv-r.hadley.nz/r6.html#r6-semantics}{\emph{Advanced R}}
                for the intricacies of R6 reference semantics.
            }
            \item{\bold{Args:}}{
                \itemize{
                    \item{\bold{\code{deep}}: logical. Whether to recursively
                    clone nested R6 objects.
                 }
                }
            }
            \item{\bold{Returns:}}{
                \itemize{
                    \item{Cloned object of this class.}
                }
            }
        }
    }
}
}

\examples{
\donttest{

# Instantiate an object
reporter <- DependencyReporter$new()

# Seed it with a package
reporter$set_package("ggplot2")

# plot it up
reporter$plot_network()
}
}
\seealso{
Other Network Reporters: \code{\link{FunctionReporter}},
  \code{\link{InheritanceReporter}}

Other Package Reporters: \code{\link{FunctionReporter}},
  \code{\link{InheritanceReporter}},
  \code{\link{SummaryReporter}}
}
\concept{Network Reporters}
\concept{Package Reporters}
