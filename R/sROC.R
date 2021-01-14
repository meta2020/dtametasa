#' Single ROC plot
#'
#' @description Single ROC plot
#'
#' @param par.vec c(u1, u2, t1, t2, r)
#' @param add par
#' @param s.point par
#' @param ... par
#'
#' @return plot
#'
#' @importFrom grDevices gray.colors
#' @importFrom graphics curve lines points

#' @examples
#' par.vec <- c(1,1, 0.5, 0.5, -0.6)
#' sROC(par.vec)
#'
#' @export

sROC <- function(par.vec = NULL,
                 add = FALSE,
                 s.point = TRUE,
                 ...) {

  if (!is.null(par.vec)) {

    u1 <- par.vec[1]
    u2 <- par.vec[2]
    t1 <- par.vec[3]
    t2 <- par.vec[4]
    r  <- par.vec[5]

  }

  auc <- function(x) plogis(u1 - (r*t1/t2) * (qlogis(x) + u2))

  curve(auc, xlab = "FPR", ylab = "TPR", add = add, ...)

  if(s.point) points(plogis(-u2), plogis(u1),...)


}

#' Multiple ROC curves
#'
#' @description Multiple ROC curves
#' @param par.matrix cbind(u1, u2, t1, t2, r)
#' @param s.point s.point
#' @param s.line s.line
#' @param new.plot new.plot
#' @param legend legend
#' @param p.vec p.vec
#' @param ... par
#'
#' @return plot
#'
#' @examples
#' par.matrix <-matrix(c(1,1,0.5, 0.5, -0.6, 1,1,1, 2, -0.6), 5,2)
#' mROC(par.matrix, legend = TRUE, p.vec = c(0.9, 0.5))
#'
#' @export

mROC <- function(par.matrix,  ## u1 u2 t12 t22
                       s.point=TRUE, s.line = FALSE,
                       new.plot =TRUE,legend = FALSE, p.vec,...) {

  if (new.plot) plot(NULL, xlim=c(0,1), ylim=c(0,1), xlab = "FPR", ylab = "TPR")

  cols <- gray.colors(ncol(par.matrix), gamma = 1, start = 0, end = 0.8)

  for (i in 1:ncol(par.matrix)) {

    u1 = par.matrix[1,i]
    u2 = par.matrix[2,i]
    t1 = par.matrix[3,i]
    t2 = par.matrix[4,i]
    r  = par.matrix[5,i]

    auc <- function(x) plogis(u1 - (r*t1/t2) * (qlogis(x) + u2))
    curve(auc, 0, 1, col = cols[i], add = TRUE, xlab = "FPR", ylab = "TPR", ...)
  }

  if (legend) legend("bottomright",
                      legend = p.vec,
                      col = cols[1:ncol(par.matrix)],
                     lty = rep(1, ncol(par.matrix)))

  if (s.point) {
    sens <- plogis(par.matrix[1,])
    spec <- plogis(par.matrix[2,])
    points(1-spec, sens, col=cols, pch = 19)
  }

  if (s.line)  lines(1-spec, sens)

}

