# kate: default-dictionary en_US

## This file is part of the R package 'stringi'.
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


#' @title Fast and Portable Character String Processing in R
#'
#' @description
#' \pkg{stringi} is THE R package for fast, correct, consistent,
#' and convenient string/text manipulation.
#' It gives predictable results on every platform, in each locale,
#' and under any native character encoding.
#'
#' \bold{Keywords}: R, text processing, character strings,
#' internationalization, localization, ICU, ICU4C, i18n, l10n, Unicode.
#'
#' \bold{Homepage}: \url{https://stringi.gagolewski.com/}
#'
#' \bold{License}: The BSD-3-clause license for the package code,
#' the ICU license for the accompanying ICU4C distribution,
#' and the UCD license for the Unicode Character Database.
#' See the COPYRIGHTS and LICENSE file for more details.
#'
#' @details
#' Manual pages on general topics:
#' \itemize{
#' \item \link{about_encoding} -- character encoding issues, including
#'    information on encoding management in \pkg{stringi}, as well as
#'    on encoding detection and conversion.
#'
#' \item \link{about_locale} -- locale issues, including locale
#'    management and specification in \pkg{stringi}, and the list of
#'    locale-sensitive operations. In particular, see
#'    \code{\link{stri_opts_collator}} for a description of the string
#'    collation algorithm, which is used for string comparing, ordering,
#'    ranking, sorting, case-folding, and searching.
#'
#' \item \link{about_arguments} -- information on how \pkg{stringi}
#'    handles the arguments passed to its function.
#' }
#'
#'
#' @section Facilities available:
#'
#' Refer to the following:
#' \itemize{
#' \item \link{about_search} for string searching facilities;
#' these include pattern searching, matching, string splitting, and so on.
#' The following independent search engines are provided:
#' \itemize{
#' \item \link{about_search_regex} -- with ICU (Java-like) regular expressions,
#' \item \link{about_search_fixed} -- fast, locale-independent, byte-wise pattern
#'    matching,
#' \item \link{about_search_coll} -- locale-aware pattern matching
#'    for natural language processing tasks,
#' \item \link{about_search_charclass} -- seeking elements of
#'    particular character classes, like ``all whites-paces'' or ``all digits'',
#' \item \link{about_search_boundaries} -- text boundary analysis.
#' }
#'
#' \item \code{\link{stri_datetime_format}} for date/time formatting
#' and parsing. Also refer to the links therein for other date/time/time zone-
#' related operations.
#'
#' \item \code{\link{stri_stats_general}} and \code{\link{stri_stats_latex}}
#' for gathering some fancy statistics on a character vector's contents.
#'
#' \item \code{\link{stri_join}}, \code{\link{stri_dup}}, \code{\link{\%s+\%}},
#' and \code{\link{stri_flatten}} for concatenation-based operations.
#'
#' \item \code{\link{stri_sub}} for extracting and replacing substrings,
#' and \code{\link{stri_reverse}} for a joyful function
#' to reverse all code points in a string.
#'
#' \item \code{\link{stri_length}} (among others) for determining the number
#' of code points in a string. See also \code{\link{stri_count_boundaries}}
#' for counting the number of Unicode characters
#' and \code{\link{stri_width}} for approximating the width of a string.
#'
#' \item \code{\link{stri_trim}} (among others) for
#' trimming characters from the beginning or/and end of a string,
#' see also \link{about_search_charclass}, and \code{\link{stri_pad}}
#' for padding strings so that they are of the same width.
#' Additionally, \code{\link{stri_wrap}} wraps text into lines.
#'
#' \item \code{\link{stri_trans_tolower}} (among others) for case mapping,
#' i.e., conversion to lower, UPPER, or Title Case,
#' \code{\link{stri_trans_nfc}} (among others) for Unicode normalization,
#' \code{\link{stri_trans_char}} for translating individual code points,
#' and \code{\link{stri_trans_general}} for other universal
#' text transforms, including transliteration.
#'
#' \item \code{\link{stri_cmp}}, \code{\link{\%s<\%}}, \code{\link{stri_order}},
#' \code{\link{stri_sort}}, \code{\link{stri_rank}}, \code{\link{stri_unique}},
#' and \code{\link{stri_duplicated}} for collation-based,
#' locale-aware operations, see also \link{about_locale}.
#'
#' \item \code{\link{stri_split_lines}} (among others)
#' to split a string into text lines.
#'
#' \item \code{\link{stri_escape_unicode}} (among others) for escaping
#' some code points.
#'
#' \item \code{\link{stri_rand_strings}}, \code{\link{stri_rand_shuffle}},
#' and \code{\link{stri_rand_lipsum}} for generating (pseudo)random strings.
#'
#' \item \code{\link{stri_read_raw}},
#' \code{\link{stri_read_lines}}, and  \code{\link{stri_write_lines}}
#' for reading and writing text files.
#' }
#'
#' Note that each man page provides many further links to other
#' interesting facilities and topics.
#'
#' @docType package
#' @author Marek Gagolewski,
#' with contributions from Bartek Tartanus and many others.
#' ICU4C was developed by IBM, Unicode, Inc., and others.
#'
#' @references
#' \emph{\pkg{stringi} Package Homepage},
#' \url{https://stringi.gagolewski.com/}
#'
#' Gagolewski M., \pkg{stringi}: Fast and portable character string
#' processing in R, \emph{Journal of Statistical Software} 103(2), 2022, 1-59,
#' \doi{10.18637/jss.v103.i02}
#'
#' \emph{ICU -- International Components for Unicode},
#' \url{https://icu.unicode.org/}
#'
#' \emph{ICU4C API Documentation},
#' \url{https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/}
#'
#' \emph{The Unicode Consortium},
#' \url{https://home.unicode.org/}
#'
#' \emph{UTF-8, A Transformation Format of ISO 10646} -- RFC 3629,
#' \url{https://www.rfc-editor.org/rfc/rfc3629}
#'
#' @family stringi_general_topics
#' @useDynLib stringi, .registration = TRUE
#' @importFrom tools md5sum
#' @importFrom utils packageVersion
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @importFrom stats runif
#' @importFrom stats rnorm
"_PACKAGE"
