##
## DATA PRE-PROCESS
##

##
## CONTINUITY CORRECTION -------------------------------------------------------
##

correction <- function(data, value = 0.5,
                       type = c("all", "single")){

  type <- match.arg(type)

  if(type == "all"){

    if(any(c(data$TP,data$FN,data$FP,data$TN) == 0)){

      data$TP <- data$TP + value
      data$FN <- data$FN + value
      data$FP <- data$FP + value
      data$TN <- data$TN + value
    }
  }

  if(type == "single"){

    correction = ((((data$TP == 0)|(data$FN == 0))|(data$FP == 0))| (data$TN == 0)) * value

    data$TP <- correction + data$TP
    data$FN <- correction + data$FN
    data$FP <- correction + data$FP
    data$TN <- correction + data$TN

  }

  return(data)

}


##
## TRANSFORM DATA: TO GENERATE y1 y2 --------------------------------------------------------------
##

logit.data <- function(data){

  sens <- data$TP/(data$TP+data$FN)
  spec <- data$TN/(data$TN+data$FP)

  y1 <- qlogis(sens)  ##y1 <- log(sens/(1-sens))
  y2 <- qlogis(spec)  ##y2 <- log(spec/(1-spec))

  v1 <- (1/data$TP)+(1/data$FN)
  v2 <- (1/data$TN)+(1/data$FP)

  lnDOR <- y1+y2        ## log DOR
  seDOR <- sqrt(v1+v2)  ## SE DOR

  data.frame(sens = sens,
             spec = spec,
             y1 = y1,
             y2 = y2,
             v1 = v1,
             v2 = v2)

}


##
##  DELTA METHOD VAR-COV FOR SROC ----------------------------------------------------
##

QIQ <- function(x, u1, u2, t1, t2, r, inv.I.fun.m) {

  sapply(1: length(x), function(i){

    Q <- c(1, -r*t1/t2, -r/t2*(qlogis(x[i])+u2), r*t1/t2^2*(qlogis(x[i])+u2), -t1/t2*(qlogis(x[i])+u2))

    (Q %*% inv.I.fun.m %*% Q)

  })

}


##
##  DELTA METHOD VAR FOR SAUC ----------------------------------------------------
##

QIQ1 <- function(u1, u2, t1, t2, r, inv.I.fun.m){

  Q1 <- function(x) {

    g <- plogis(u1 - (t1*t2*r/(t2^2)) * (qlogis(x) + u2))
    g*(1-g)
  }

  Q2 <- function(x) {

    g <- plogis(u1 - (t1*t2*r/(t2^2)) * (qlogis(x) + u2))
    p.u2 <- (-r*t1/t2)*g*(1-g)
  }

  Q3 <- function(x) {

    g <- plogis(u1 - (t1*t2*r/(t2^2)) * (qlogis(x) + u2))
    p.t1 <- (-r/t2*(qlogis(x)+u2))*g*(1-g)

  }

  Q4 <- function(x) {

    g <- plogis(u1 - (t1*t2*r/(t2^2)) * (qlogis(x) + u2))
    p.t2 <- r*t1/t2^2*( qlogis(x)+u2)*g*(1-g)

  }

  Q5 <- function(x) {

    g <- plogis(u1 - (t1*t2*r/(t2^2)) * (qlogis(x) + u2))
    p.r  <- (-t1)/t2*(qlogis(x) + u2)*g*(1-g)
  }

  fd <- c(integrate(Q1, 0, 1)$value,
          integrate(Q2, 0, 1)$value,
          integrate(Q3, 0, 1)$value,
          integrate(Q4, 0, 1)$value,
          integrate(Q5, 0, 1)$value
  )

  (fd %*% inv.I.fun.m %*% fd)

}



