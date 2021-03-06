% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nlp_flow.R
\name{document_term_matrix}
\alias{document_term_matrix}
\alias{document_term_matrix.data.frame}
\alias{document_term_matrix.DocumentTermMatrix}
\alias{document_term_matrix.TermDocumentMatrix}
\alias{document_term_matrix.simple_triplet_matrix}
\title{Create a document/term matrix from a data.frame with 1 row per document/term}
\usage{
document_term_matrix(x, vocabulary, ...)

\method{document_term_matrix}{data.frame}(x, vocabulary, ...)

\method{document_term_matrix}{DocumentTermMatrix}(x, ...)

\method{document_term_matrix}{TermDocumentMatrix}(x, ...)

\method{document_term_matrix}{simple_triplet_matrix}(x, ...)
}
\arguments{
\item{x}{a data.frame with columns document, term and freq indicating how many times a term occurred in that specific document.
This is what \code{\link{document_term_frequencies}} returns.}

\item{vocabulary}{a character vector of terms which should be present in the document term matrix even if they did not occur in the \code{x}}

\item{...}{further arguments currently not used}
}
\value{
an sparse object of class dgCMatrix with in the rows the documents and in the columns the terms containing the frequencies
provided in \code{x} extended with terms which were not in \code{x} but were provided in \code{vocabulary}.
The rownames of this resulting object contain the doc_id from \code{x}
}
\description{
Create a document/term matrix from a data.frame with 1 row per document/term as returned
by \code{\link{document_term_frequencies}}
}
\section{Methods (by class)}{
\itemize{
\item \code{data.frame}: Construct a document term matrix from a data.frame with columns doc_id, term, freq

\item \code{DocumentTermMatrix}: Convert an object of class \code{DocumentTermMatrix} from the tm package to a sparseMatrix

\item \code{TermDocumentMatrix}: Convert an object of class \code{TermDocumentMatrix} from the tm package to a sparseMatrix with
the documents in the rows and the terms in the columns

\item \code{simple_triplet_matrix}: Convert an object of class \code{simple_triplet_matrix} from the slam package to a sparseMatrix
}}

\examples{
x <- data.frame(doc_id = c(1, 1, 2, 3, 4), 
 term = c("A", "C", "Z", "X", "G"), 
 freq = c(1, 5, 7, 10, 0))
document_term_matrix(x)
document_term_matrix(x, vocabulary = LETTERS)

## Example on larger dataset
data(brussels_reviews_anno)
x <- document_term_frequencies(brussels_reviews_anno[, c("doc_id", "lemma")])
dtm <- document_term_matrix(x)
dim(dtm)

## example showing the vocubulary argument
## allowing you to making sure terms which are not in the data are provided in the resulting dtm
allterms <- unique(x$term)
dtm <- document_term_matrix(head(x, 1000), vocabulary = allterms)
}
\seealso{
\code{\link[Matrix]{sparseMatrix}}, \code{\link{document_term_frequencies}}
}
