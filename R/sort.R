# kate: default-dictionary en_US

## This file is part of the 'stringi' package for R.
## Copyright (c) 2013-2025, Marek Gagolewski <https://www.gagolewski.com/>
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions are met:
##
## 1. Redistributions of source code must retain the above copyright notice,
## this list of conditions and the following disclaimer.
##
## 2. Redistributions in binary form must reproduce the above copyright notice,
## this list of conditions and the following disclaimer in the documentation
## and/or other materials provided with the distribution.
##
## 3. Neither the name of the copyright holder nor the names of its
## contributors may be used to endorse or promote products derived from
## this software without specific prior written permission.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
## 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
## BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
## FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
## HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
## SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
## PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
## OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
## WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
## OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
## EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


#' @title String Sorting
#'
#' @description
#' This function sorts a character vector according to a locale-dependent
#' lexicographic order.
#'
#' @details
#' For more information on \pkg{ICU}'s Collator and how to tune it up
#' in \pkg{stringi}, refer to \code{\link{stri_opts_collator}}.
#'
#' As usual in \pkg{stringi}, non-character inputs are coerced to strings,
#' see an example below for a somewhat non-intuitive behavior of lexicographic
#' sorting on numeric inputs.
#'
#' This function uses a stable sort algorithm (\pkg{STL}'s \code{stable_sort}),
#' which performs up to \eqn{N*log^2(N)} element comparisons,
#' where \eqn{N} is the length of \code{str}.
#'
#' @param str a character vector
#' @param decreasing a single logical value; should the sort order
#'    be nondecreasing (\code{FALSE}, default, i.e., weakly increasing)
#'    or nonincreasing (\code{TRUE})?
#' @param na_last a single logical value; controls the treatment of \code{NA}s
#'    in \code{str}. If \code{TRUE}, then missing values in \code{str} are put
#'    at the end; if \code{FALSE}, they are put at the beginning;
#'    if \code{NA}, then they are removed from the output
#' @param opts_collator a named list with \pkg{ICU} Collator's options,
#' see \code{\link{stri_opts_collator}}, \code{NULL}
#' for default collation options
#' @param ... additional settings for \code{opts_collator}
#'
#' @return
#' The result is a sorted version of \code{str},
#' i.e., a character vector.
#'
#' @references
#' \emph{Collation} - ICU User Guide,
#' \url{https://unicode-org.github.io/icu/userguide/collation/}
#'
#' @family locale_sensitive
#' @export
#' @rdname stri_sort
#'
#' @examples
#' stri_sort(c('hladny', 'chladny'), locale='pl_PL')
#' stri_sort(c('hladny', 'chladny'), locale='sk_SK')
#' stri_sort(sample(LETTERS))
#' stri_sort(c(1, 100, 2, 101, 11, 10))  # lexicographic order
#' stri_sort(c(1, 100, 2, 101, 11, 10), numeric=TRUE)  # OK for integers
#' stri_sort(c(0.25, 0.5, 1, -1, -2, -3), numeric=TRUE)  # incorrect
stri_sort <- function(str, decreasing = FALSE, na_last = NA, ..., opts_collator = NULL)
{
    if (!missing(...))
        opts_collator <- do.call(stri_opts_collator, as.list(c(opts_collator, ...)))
    .Call(C_stri_sort, str, decreasing, na_last, opts_collator)
}


#' @title Ordering Permutation
#'
#' @description
#' This function finds a permutation which rearranges the
#' strings in a given character vector into the ascending or descending
#' locale-dependent lexicographic order.
#'
#' @details
#' For more information on \pkg{ICU}'s Collator and how to tune it up
#' in \pkg{stringi}, refer to \code{\link{stri_opts_collator}}.
#'
#' As usual in \pkg{stringi}, non-character inputs are coerced to strings,
#' see an example below for a somewhat non-intuitive behavior of lexicographic
#' sorting on numeric inputs.
#'
#' This function uses a stable sort algorithm (\pkg{STL}'s \code{stable_sort}),
#' which performs up to \eqn{N*log^2(N)} element comparisons,
#' where \eqn{N} is the length of \code{str}.
#'
#' For ordering with regards to multiple criteria (such as sorting
#' data frames by more than 1 column), see \code{\link{stri_rank}}.
#'
#' @param str a character vector
#' @param decreasing a single logical value; should the sort order
#'    be nondecreasing (\code{FALSE}, default)
#'    or nonincreasing (\code{TRUE})?
#' @param na_last a single logical value; controls the treatment of \code{NA}s
#'    in \code{str}. If \code{TRUE}, then missing values in \code{str} are put
#'    at the end; if \code{FALSE}, they are put at the beginning;
#'    if \code{NA}, then they are removed from the output
#' @param opts_collator a named list with \pkg{ICU} Collator's options,
#' see \code{\link{stri_opts_collator}}, \code{NULL}
#' for default collation options
#' @param ... additional settings for \code{opts_collator}
#'
#' @return The function yields an integer vector that gives the sort order.
#'
#' @references
#' \emph{Collation} - ICU User Guide,
#' \url{https://unicode-org.github.io/icu/userguide/collation/}
#'
#' @family locale_sensitive
#' @export
#' @rdname stri_order
#'
#' @examples
#' stri_order(c('hladny', 'chladny'), locale='pl_PL')
#' stri_order(c('hladny', 'chladny'), locale='sk_SK')
#'
#' stri_order(c(1, 100, 2, 101, 11, 10))  # lexicographic order
#' stri_order(c(1, 100, 2, 101, 11, 10), numeric=TRUE)  # OK for integers
#' stri_order(c(0.25, 0.5, 1, -1, -2, -3), numeric=TRUE)  # incorrect
stri_order <- function(str, decreasing = FALSE, na_last = TRUE, ..., opts_collator = NULL)
{
    if (!missing(...))
        opts_collator <- do.call(stri_opts_collator, as.list(c(opts_collator, ...)))
    .Call(C_stri_order, str, decreasing, na_last, opts_collator)
}


#' @title Extract Unique Elements
#'
#' @description
#' This function returns a character vector like \code{str},
#' but with duplicate elements removed.
#'
#' @details
#' As usual in \pkg{stringi}, no attributes are copied.
#' Unlike \code{\link{unique}}, this function
#' tests for canonical equivalence of strings (and not
#' whether the strings are just bytewise equal). Such an operation
#' is locale-dependent. Hence, \code{stri_unique} is significantly
#' slower (but much better suited for natural language processing)
#' than its base R counterpart.
#'
#' See also \code{\link{stri_duplicated}} for indicating non-unique elements.
#'
#' @param str a character vector
#' @param opts_collator a named list with \pkg{ICU} Collator's options,
#' see \code{\link{stri_opts_collator}}, \code{NULL}
#' for default collation options
#' @param ... additional settings for \code{opts_collator}
#'
#' @return Returns a character vector.
#'
#' @examples
#' # normalized and non-Unicode-normalized version of the same code point:
#' stri_unique(c('\u0105', stri_trans_nfkd('\u0105')))
#' unique(c('\u0105', stri_trans_nfkd('\u0105')))
#'
#' stri_unique(c('gro\u00df', 'GROSS', 'Gro\u00df', 'Gross'), strength=1)
#'
#' @references
#' \emph{Collation} - ICU User Guide,
#' \url{https://unicode-org.github.io/icu/userguide/collation/}
#'
#' @family locale_sensitive
#' @export
stri_unique <- function(str, ..., opts_collator = NULL)
{
    if (!missing(...))
        opts_collator <- do.call(stri_opts_collator, as.list(c(opts_collator, ...)))
    .Call(C_stri_unique, str, opts_collator)
}


#' @title
#' Determine Duplicated Elements
#'
#' @description
#' \code{stri_duplicated()} determines which strings in a character vector
#' are duplicates of other elements.
#'
#' \code{stri_duplicated_any()} determines if there are any duplicated
#' strings in a character vector.
#'
#' @details
#' Missing values are regarded as equal.
#'
#' Unlike \code{\link{duplicated}} and \code{\link{anyDuplicated}},
#' these functions test for canonical equivalence of strings
#' (and not whether the strings are just bytewise equal)
#' Such operations are locale-dependent.
#' Hence, \code{stri_duplicated} and \code{stri_duplicated_any}
#' are significantly slower (but much better suited for natural language
#' processing) than their base R counterparts.
#'
#' See also \code{\link{stri_unique}} for extracting unique elements.
#'
#' @param str a character vector
#' @param from_last a single logical value;
#'    indicates whether search should be performed from the last to the
#'    first string
#' @param fromLast [DEPRECATED] alias of \code{from_last}
#' @param opts_collator a named list with \pkg{ICU} Collator's options,
#' see \code{\link{stri_opts_collator}}, \code{NULL}
#' for default collation options
#' @param ... additional settings for \code{opts_collator}
#'
#' @return
#' \code{stri_duplicated()} returns a logical vector of the same length
#' as \code{str}. Each of its elements indicates whether a canonically
#' equivalent string was already found in \code{str}.
#'
#' \code{stri_duplicated_any()} returns a single non-negative integer.
#' Value of 0 indicates that all the elements in \code{str} are unique.
#' Otherwise, it gives the index of the first non-unique element.
#'
#' @references
#' \emph{Collation} - ICU User Guide,
#' \url{https://unicode-org.github.io/icu/userguide/collation/}
#'
#' @examples
#' # In the following examples, we have 3 duplicated values,
#' # 'a' - 2 times, NA - 1 time
#' stri_duplicated(c('a', 'b', 'a', NA, 'a', NA))
#' stri_duplicated(c('a', 'b', 'a', NA, 'a', NA), from_last=TRUE)
#' stri_duplicated_any(c('a', 'b', 'a', NA, 'a', NA))
#'
#' # compare the results:
#' stri_duplicated(c('\u0105', stri_trans_nfkd('\u0105')))
#' duplicated(c('\u0105', stri_trans_nfkd('\u0105')))
#'
#' stri_duplicated(c('gro\u00df', 'GROSS', 'Gro\u00df', 'Gross'), strength=1)
#' duplicated(c('gro\u00df', 'GROSS', 'Gro\u00df', 'Gross'))
#'
#' @rdname stri_duplicated
#' @family locale_sensitive
#' @export
stri_duplicated <- function(str, from_last = FALSE,
    fromLast = from_last, ..., opts_collator = NULL) {
    if (!missing(fromLast)) {
        warning("The 'fromLast' argument in stri_duplicated is a deprecated alias of 'from_last' and will be removed in a future release of 'stringi'.")
        from_last <- fromLast
    }
    if (!missing(...))
        opts_collator <- do.call(stri_opts_collator, as.list(c(opts_collator, ...)))
    .Call(C_stri_duplicated, str, from_last, opts_collator)
}


#' @rdname stri_duplicated
#' @export
stri_duplicated_any <- function(str, from_last = FALSE, fromLast = from_last, ...,
    opts_collator = NULL) {
    if (!missing(fromLast)) {  # DEPRECATED
        warning("The 'fromLast' argument in stri_duplicated_any is a deprecated alias of 'from_last' and will be removed in a future release of 'stringi'.")
        from_last <- fromLast
    }
    if (!missing(...))
        opts_collator <- do.call(stri_opts_collator, as.list(c(opts_collator, ...)))
    .Call(C_stri_duplicated_any, str, from_last, opts_collator)
}


#' @title
#' Sort Keys
#'
#' @description
#' This function computes a locale-dependent sort key, which is an alternative
#' character representation of the string that, when ordered in the C locale
#' (which orders using the underlying bytes directly), will give an equivalent
#' ordering to the original string. It is useful for enhancing algorithms
#' that sort only in the C locale (e.g., the \code{strcmp} function in libc)
#' with the ability to be locale-aware.
#'
#' @details
#' For more information on \pkg{ICU}'s Collator and how to tune it up
#' in \pkg{stringi}, refer to \code{\link{stri_opts_collator}}.
#'
#' See also \code{\link{stri_rank}} for ranking strings with a single character
#' vector, i.e., generating relative sort keys.
#'
#' @param str a character vector
#' @param opts_collator a named list with \pkg{ICU} Collator's options,
#' see \code{\link{stri_opts_collator}}, \code{NULL}
#' for default collation options
#' @param ... additional settings for \code{opts_collator}
#'
#' @return
#' The result is a character vector with the same length as \code{str} that
#' contains the sort keys. The output is marked as \code{bytes}-encoded.
#'
#' @references
#' \emph{Collation} - ICU User Guide,
#' \url{https://unicode-org.github.io/icu/userguide/collation/}
#'
#' @examples
#' stri_sort_key(c('hladny', 'chladny'), locale='pl_PL')
#' stri_sort_key(c('hladny', 'chladny'), locale='sk_SK')
#'
#' @family locale_sensitive
#' @export
#' @rdname stri_sort_key
stri_sort_key <- function(str, ..., opts_collator = NULL)
{
    if (!missing(...))
        opts_collator <- do.call(stri_opts_collator, as.list(c(opts_collator, ...)))
    .Call(C_stri_sort_key, str, opts_collator)
}



#' @title
#' Ranking
#'
#' @description
#' This function ranks each string in a character vector according to a
#' locale-dependent lexicographic order.
#' It is a portable replacement for the base \code{xtfrm} function.
#'
#' @details
#' Missing values result in missing ranks and tied observations receive
#' the same ranks (based on min).
#'
#' For more information on \pkg{ICU}'s Collator and how to tune it up
#' in \pkg{stringi}, refer to \code{\link{stri_opts_collator}}.
#'
#' @param str a character vector
#' @param opts_collator a named list with \pkg{ICU} Collator's options,
#' see \code{\link{stri_opts_collator}}, \code{NULL}
#' for default collation options
#' @param ... additional settings for \code{opts_collator}
#'
#' @return
#' The result is a vector of ranks corresponding to each
#' string in \code{str}.
#'
#' @references
#' \emph{Collation} -- ICU User Guide,
#' \url{https://unicode-org.github.io/icu/userguide/collation/}
#'
#' @examples
#' stri_rank(c('hladny', 'chladny'), locale='pl_PL')
#' stri_rank(c('hladny', 'chladny'), locale='sk_SK')
#'
#' stri_rank("a" %s+% c(1, 100, 2, 101, 11, 10))  # lexicographic order
#' stri_rank("a" %s+% c(1, 100, 2, 101, 11, 10), numeric=TRUE)  # OK
#' stri_rank("a" %s+% c(0.25, 0.5, 1, -1, -2, -3), numeric=TRUE)  # incorrect
#'
#' # Ordering a data frame with respect to two criteria:
#' X <- data.frame(a=c("b", NA, "b", "b", NA, "a", "a", "c"), b=runif(8))
#' X[order(stri_rank(X$a), X$b), ]
#'
#' @family locale_sensitive
#' @export
#' @rdname stri_rank
stri_rank <- function(str, ..., opts_collator=NULL)
{
    if (!missing(...))
        opts_collator <- do.call(stri_opts_collator, as.list(c(opts_collator, ...)))

    .Call(C_stri_rank, str, opts_collator)
}
