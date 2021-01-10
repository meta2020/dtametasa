
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DTAsens

<!-- badges: start -->

<!-- badges: end -->

The goal of DTAsens is to conduct sensitivity analysis on DTA
meta-analysis

## Installation

You can install the released version of DTAsens from
[GitHub](https://github.com/meta2020/DTAsens) with:

``` r
devtools::install_git("meta2020/DTAsens")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(DTAsens)
## basic example code
```

### Example data 1

``` r

data(dta)
head(dta)
#>          se        sp        y1          y2          v1           v2    ldor.t
#> 1 0.9510276 0.8396135 2.9662854  1.65535514 0.555826531 3.7128034485  2.236928
#> 2 0.8257335 0.5916128 1.5556865  0.37063642 0.246941038 0.1324189287  3.127543
#> 3 0.7067179 0.8825029 0.8794969  2.01634880 0.089110776 0.0752104430  7.143789
#> 4 0.6869510 0.9043041 0.7859033  2.24599035 0.080006127 0.3296684348  4.736903
#> 5 0.9091995 0.8105749 2.3039001  1.45375029 0.806794794 0.1682579844  3.805417
#> 6 0.9158372 0.4905628 2.3870850 -0.03775331 0.001707562 0.0009358459 45.694322
```

### Optim 1

For a certain selection probability, e.g., p = 0.5

``` r
optim1(dta, p = 0.5)
#> $par
#>         u1         u2        t11        t22        t12          r        auc 
#>  0.6510398  1.8805357  1.0333049  0.7963031 -0.7996024 -0.8814966  0.8489931 
#>          b          a 
#>  0.5609655 -0.8193348 
#> 
#> $value
#> [1] 12.93627
#> 
#> $counts
#> function gradient 
#>       27       27 
#> 
#> $convergence
#> [1] 0
#> 
#> $message
#> [1] "CONVERGENCE: REL_REDUCTION_OF_F <= FACTR*EPSMCH"

optim1(dta, p = 0.5, p.hat = TRUE, auc.all = TRUE, show.data = TRUE)
#> $data
#>           se        sp         y1          y2          v1           v2
#> 1  0.9510276 0.8396135  2.9662854  1.65535514 0.555826531 3.7128034485
#> 2  0.8257335 0.5916128  1.5556865  0.37063642 0.246941038 0.1324189287
#> 3  0.7067179 0.8825029  0.8794969  2.01634880 0.089110776 0.0752104430
#> 4  0.6869510 0.9043041  0.7859033  2.24599035 0.080006127 0.3296684348
#> 5  0.9091995 0.8105749  2.3039001  1.45375029 0.806794794 0.1682579844
#> 6  0.9158372 0.4905628  2.3870850 -0.03775331 0.001707562 0.0009358459
#> 7  0.6591250 0.9240690  0.6593975  2.49896214 0.088017805 0.5998496950
#> 8  0.7786425 0.9353830  1.2577730  2.67247794 0.077570595 0.5673173038
#> 9  0.3869887 0.8704019 -0.4599880  1.90451700 0.109533713 0.0123399170
#> 10 0.6811776 0.8535040  0.7591888  1.76235225 0.064840400 0.4695429744
#> 11 0.6032696 0.6378862  0.4191072  0.56620130 0.098070418 1.8133319173
#> 12 0.9339466 0.5724648  2.6489553  0.29191454 0.222029552 0.2703020757
#> 13 0.8652860 0.8277565  1.8599057  1.56981005 0.096078493 0.6753723553
#> 14 0.8994698 0.4761892  2.1913478 -0.09531516 0.540810730 1.8426800013
#> 15 0.8148548 0.8467843  1.4818698  1.70959945 0.083138975 0.1938575798
#> 16 0.8950921 0.7107987  2.1438436  0.89926608 0.018136416 0.1821175891
#> 17 0.6061970 0.9335479  0.4313542  2.64251100 0.731141214 0.0567119941
#> 18 0.8895545 0.9120532  2.0861990  2.33896591 0.615501248 0.9758492198
#> 19 0.8584486 0.9289249  1.8024642  2.57029116 1.005957922 2.2815684255
#> 20 0.6710805 0.9727026  0.7130759  3.57328825 0.119566308 1.8055971484
#>        ldor.t
#> 1   2.2369275
#> 2   3.1275434
#> 3   7.1437885
#> 4   4.7369026
#> 5   3.8054174
#> 6  45.6943218
#> 7   3.8081074
#> 8   4.8941600
#> 9   4.1378182
#> 10  3.4493683
#> 11  0.7126827
#> 12  4.1912825
#> 13  3.9048468
#> 14  1.3576609
#> 15  6.0639203
#> 16  6.8002831
#> 17  3.4630771
#> 18  3.5078947
#> 19  2.4116849
#> 20  3.0892657
#> 
#> $opt
#> $opt$par
#>         u1         u2        t11        t22        t12          r        auc 
#>  0.6510398  1.8805357  1.0333049  0.7963031 -0.7996024 -0.8814966  0.8489931 
#>          b          a      p.hat 
#>  0.5609655 -0.8193348  0.5000049 
#> 
#> $opt$value
#> [1] 12.93627
#> 
#> $opt$counts
#> function gradient 
#>       27       27 
#> 
#> $opt$convergence
#> [1] 0
#> 
#> $opt$message
#> [1] "CONVERGENCE: REL_REDUCTION_OF_F <= FACTR*EPSMCH"
#> 
#> $opt$auc
#> 0.8489931 with absolute error < 1.1e-05
```

For a series of selection probabilities, e.g., p = 0.9, 0,8, …,0.1

``` r
p.seq <- seq(0.9, 0.4, -0.1)

estimates <- sapply(p.seq, function(p) optim2(dta, p)$par)
colnames(estimates)<- paste0("p = ", p.seq)
estimates
#>        p = 0.9    p = 0.8    p = 0.7    p = 0.6    p = 0.5    p = 0.4
#> u1   1.2923130  1.2770381  1.2771790  1.2822339  1.2901402  1.3006526
#> u2   1.4347096  1.4078922  1.3697392  1.3260561  1.2783590  1.2260003
#> t11  0.5502472  0.5511384  0.5490123  0.5489721  0.5507726  0.5541998
#> t22  0.5714027  0.5659383  0.5649176  0.5657411  0.5670369  0.5680480
#> t12 -0.4593506 -0.4592363 -0.4613885 -0.4661251 -0.4725881 -0.4804363
#> r   -0.8192081 -0.8222830 -0.8284822 -0.8364085 -0.8456505 -0.8562688
#> auc  0.8634662  0.8601522  0.8573096  0.8544561  0.8514883  0.8482902
#> b    1.0000000  0.8904273  0.7798244  0.7148587  0.6664560  0.6252317
#> a   -0.8039736 -1.2274166 -1.3818231 -1.5331987 -1.6849928 -1.8432643
#> c11  0.6711129  0.5881223  0.5015161  0.4390850  0.3945473  0.3612540
#> c22  0.3288871  0.4118777  0.4984839  0.5609150  0.6054527  0.6387460
```

### Optim 2, estimate contrast

For a certain selection probability, e.g., p = 0.5

``` r

optim2(dta, p = 0.5)
#> $par
#>         u1         u2        t11        t22        t12          r        auc 
#>  1.2901402  1.2783590  0.5507726  0.5670369 -0.4725881 -0.8456505  0.8514883 
#>          b          a        c11        c22 
#>  0.6664560 -1.6849928  0.3945473  0.6054527 
#> 
#> $value
#> [1] 10.9501
#> 
#> $counts
#> function gradient 
#>       31       31 
#> 
#> $convergence
#> [1] 0
#> 
#> $message
#> [1] "CONVERGENCE: REL_REDUCTION_OF_F <= FACTR*EPSMCH"

optim2(dta, p = 0.5, p.hat = TRUE, auc.all = TRUE, show.data = TRUE)
#> $data
#>           se        sp         y1          y2          v1           v2
#> 1  0.9510276 0.8396135  2.9662854  1.65535514 0.555826531 3.7128034485
#> 2  0.8257335 0.5916128  1.5556865  0.37063642 0.246941038 0.1324189287
#> 3  0.7067179 0.8825029  0.8794969  2.01634880 0.089110776 0.0752104430
#> 4  0.6869510 0.9043041  0.7859033  2.24599035 0.080006127 0.3296684348
#> 5  0.9091995 0.8105749  2.3039001  1.45375029 0.806794794 0.1682579844
#> 6  0.9158372 0.4905628  2.3870850 -0.03775331 0.001707562 0.0009358459
#> 7  0.6591250 0.9240690  0.6593975  2.49896214 0.088017805 0.5998496950
#> 8  0.7786425 0.9353830  1.2577730  2.67247794 0.077570595 0.5673173038
#> 9  0.3869887 0.8704019 -0.4599880  1.90451700 0.109533713 0.0123399170
#> 10 0.6811776 0.8535040  0.7591888  1.76235225 0.064840400 0.4695429744
#> 11 0.6032696 0.6378862  0.4191072  0.56620130 0.098070418 1.8133319173
#> 12 0.9339466 0.5724648  2.6489553  0.29191454 0.222029552 0.2703020757
#> 13 0.8652860 0.8277565  1.8599057  1.56981005 0.096078493 0.6753723553
#> 14 0.8994698 0.4761892  2.1913478 -0.09531516 0.540810730 1.8426800013
#> 15 0.8148548 0.8467843  1.4818698  1.70959945 0.083138975 0.1938575798
#> 16 0.8950921 0.7107987  2.1438436  0.89926608 0.018136416 0.1821175891
#> 17 0.6061970 0.9335479  0.4313542  2.64251100 0.731141214 0.0567119941
#> 18 0.8895545 0.9120532  2.0861990  2.33896591 0.615501248 0.9758492198
#> 19 0.8584486 0.9289249  1.8024642  2.57029116 1.005957922 2.2815684255
#> 20 0.6710805 0.9727026  0.7130759  3.57328825 0.119566308 1.8055971484
#>        ldor.t
#> 1   2.2369275
#> 2   3.1275434
#> 3   7.1437885
#> 4   4.7369026
#> 5   3.8054174
#> 6  45.6943218
#> 7   3.8081074
#> 8   4.8941600
#> 9   4.1378182
#> 10  3.4493683
#> 11  0.7126827
#> 12  4.1912825
#> 13  3.9048468
#> 14  1.3576609
#> 15  6.0639203
#> 16  6.8002831
#> 17  3.4630771
#> 18  3.5078947
#> 19  2.4116849
#> 20  3.0892657
#> 
#> $opt
#> $opt$par
#>         u1         u2        t11        t22        t12          r        auc 
#>  1.2901402  1.2783590  0.5507726  0.5670369 -0.4725881 -0.8456505  0.8514883 
#>          b          a        c11        c22      p.hat 
#>  0.6664560 -1.6849928  0.3945473  0.6054527  0.4999913 
#> 
#> $opt$value
#> [1] 10.9501
#> 
#> $opt$counts
#> function gradient 
#>       31       31 
#> 
#> $opt$convergence
#> [1] 0
#> 
#> $opt$message
#> [1] "CONVERGENCE: REL_REDUCTION_OF_F <= FACTR*EPSMCH"
#> 
#> $opt$auc
#> 0.8514883 with absolute error < 5.7e-05
```

For a series of selection probabilities, e.g., p = 0.9, 0.8, …,0.1

``` r
p.seq <- seq(0.9, 0.4, -0.1)

estimates <- sapply(p.seq, function(p) optim2(dta, p)$par)
colnames(estimates)<- paste0("p = ", p.seq)
estimates
#>        p = 0.9    p = 0.8    p = 0.7    p = 0.6    p = 0.5    p = 0.4
#> u1   1.2923130  1.2770381  1.2771790  1.2822339  1.2901402  1.3006526
#> u2   1.4347096  1.4078922  1.3697392  1.3260561  1.2783590  1.2260003
#> t11  0.5502472  0.5511384  0.5490123  0.5489721  0.5507726  0.5541998
#> t22  0.5714027  0.5659383  0.5649176  0.5657411  0.5670369  0.5680480
#> t12 -0.4593506 -0.4592363 -0.4613885 -0.4661251 -0.4725881 -0.4804363
#> r   -0.8192081 -0.8222830 -0.8284822 -0.8364085 -0.8456505 -0.8562688
#> auc  0.8634662  0.8601522  0.8573096  0.8544561  0.8514883  0.8482902
#> b    1.0000000  0.8904273  0.7798244  0.7148587  0.6664560  0.6252317
#> a   -0.8039736 -1.2274166 -1.3818231 -1.5331987 -1.6849928 -1.8432643
#> c11  0.6711129  0.5881223  0.5015161  0.4390850  0.3945473  0.3612540
#> c22  0.3288871  0.4118777  0.4984839  0.5609150  0.6054527  0.6387460
```

### Example data 2

``` r
library(mada)
#> Loading required package: mvtnorm
#> Loading required package: ellipse
#> 
#> Attaching package: 'ellipse'
#> The following object is masked from 'package:graphics':
#> 
#>     pairs
#> Loading required package: mvmeta
#> This is mvmeta 1.0.3. For an overview type: help('mvmeta-package').
data("AuditC")

head(AuditC)
#>    TP FN  FP   TN
#> 1  47  9 101  738
#> 2 126 51 272 1543
#> 3  19 10  12  192
#> 4  36  3  78  276
#> 5 130 19 211  959
#> 6  84  2  68   89

reitsma(AuditC)
#> Call:  reitsma.default(data = AuditC)
#> 
#> Fixed-effects coefficients:
#>               tsens     tfpr
#> (Intercept)  2.0997  -1.2637
#> 
#> 14 studies, 2 fixed and 3 random-effects parameters
#>   logLik       AIC       BIC  
#>  31.5640  -53.1279  -46.4669
optim1(AuditC, 0.7)
#> $par
#>         u1         u2        t11        t22        t12          r        auc 
#>  1.9420454  1.3591178  1.6934795  0.4199978 -0.7379118 -0.8749656  0.8906057 
#>          b          a 
#>  1.0000000 -1.6652240 
#> 
#> $value
#> [1] 4.012178
#> 
#> $counts
#> function gradient 
#>       45       45 
#> 
#> $convergence
#> [1] 0
#> 
#> $message
#> [1] "CONVERGENCE: REL_REDUCTION_OF_F <= FACTR*EPSMCH"
optim2(AuditC, 0.7)
#> $par
#>          u1          u2         t11         t22         t12           r 
#>  2.04618028  1.31443244  1.60456084  0.40106440 -0.69519931 -0.86661097 
#>         auc           b           a         c11         c22 
#>  0.89244364  1.00000000 -2.19687692  0.94569946  0.05430054 
#> 
#> $value
#> [1] 3.690833
#> 
#> $counts
#> function gradient 
#>       41       41 
#> 
#> $convergence
#> [1] 0
#> 
#> $message
#> [1] "CONVERGENCE: REL_REDUCTION_OF_F <= FACTR*EPSMCH"
```

### Plot ROC

One ROC

``` r
fit <- reitsma(AuditC)
par0 <- c(fit$coefficients[1], -fit$coefficients[2], fit$vcov[4], -fit$vcov[3])
par1 <- optim1(AuditC, 0.7)$par[c(1,2,4,5)]
par2 <- optim2(AuditC, 0.7)$par[c(1,2,4,5)]

sROC(par = par1, pch = 19)
sROC(par = par2, add = TRUE, col=2, pch = 19)
sROC(par = par0, add = TRUE, col=2, pch = 1, lty =3)

with(AuditC, points(FP/(FP+TN), TP/(TP+FN)))
legend("bottomright", c("optim1", "optim2", "reitsma"), col = c(1,2,2), lty = c(1,1,3), pch = c(19,19,1))
```

<img src="man/figures/README-unnamed-chunk-9-1.png" width="100%" />

A series of ROC

``` r

p.seq <- seq(0.9, 0.1, -0.1)
estimates1 <- sapply(p.seq, function(p) optim1(AuditC, p)$par)[c(1,2,4,5),]
estimates2 <- sapply(p.seq, function(p) optim2(AuditC, p)$par)[c(1,2,4,5),]

par(mfrow = c(1,2))
sROC.bunch(par.matrix = estimates1, p.vec  = p.seq)
sROC(par = par0, add = TRUE, col =2, pch = 1, lty =3)

title("optim1")
sROC.bunch(par.matrix = estimates2, p.vec = p.seq)
sROC(par = par0, add = TRUE, col = 2, pch = 1, lty =3)

title("optim2")
```

<img src="man/figures/README-unnamed-chunk-10-1.png" width="100%" />

``` r
par(mfrow = c(1,1))
```
