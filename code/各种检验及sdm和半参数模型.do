

LM检验，检验是否有空间效应
clear
cd "E:\文件\AAA论文2.0\数据7"
spatwmat using bbbxt, name(w1matrix) standardize
sort 序号 年份
reg 数字经济规模 数字基础 数字创新 数字交易 数字治理
spatdiag, weights(w1matrix)


#豪斯曼检验
spmat use matrix3 using "matrix2.spmat"

xtset 序号 年份
xsmle 数字经济规模 数字基础 数字创新 数字交易 数字治理,  noconstant fe model(sdm) wmat(matrix3) type(both) nolog effects
est store fe
xsmle 数字经济规模 数字基础 数字创新 数字交易 数字治理,  noconstant re model(sdm) wmat(matrix3) type(both) nolog effects
est store re
hausman fe re

#LR检验 用哪个模型
xsmle 数字经济规模 数字基础 数字创新 数字交易 数字治理, noconstant fe model(sdm) wmat(matrix3)type(both, leeyu) nolog effects
est store sdm
xsmle 数字经济规模 数字基础 数字创新 数字交易 数字治理, noconstant fe model(sar) wmat(matrix3)type(both, leeyu) nolog effects
est store sar
xsmle 数字经济规模 数字基础 数字创新 数字交易 数字治理, noconstant fe model(sem) emat(matrix3)type(both, leeyu) nolog effects
est store sem
lrtest sdm sar
lrtest sdm sem


#用时间、空间、双固定 用哪种效应
xsmle 数字经济规模 数字基础 数字创新 数字交易 数字治理,noconstant fe model(sdm) wmat(matrix3)type(ind) nolog effects
est store ind
xsmle 数字经济规模 数字基础 数字创新 数字交易 数字治理,noconstant fe model(sdm) wmat(matrix3)type(time) nolog effects
est store time
xsmle 数字经济规模 数字基础 数字创新 数字交易 数字治理,noconstant fe model(sdm) wmat(matrix3)type(both) nolog effects
est store both
lrtest both ind,df(18)
lrtest both time,df(18)
drop _est_fe _est_re _est_sdm _est_sar _est_sem _est_ind _est_time _est_both


%ols
xtset 序号 年份
xtreg 数字经济规模 数字基础 数字创新 数字交易 数字治理


%双固定sdm
xtset 序号 年份
xsmle 数字经济规模 数字基础 数字创新 数字交易 数字治理,  fe model(sdm)  wmat(matrix3) type(both) nolog effects


%半参数sdm
xtset 序号 年份
xtsemipar 数字经济规模 w数字经济规模 数字创新 数字交易 数字治理 wx2 wx3 wx4, nonpar(数字基础) bwidth(45) degree(3) gen(G res) 
gen dG = D.G 
gen d数字基础  = D.数字基础 
gen dGd数字基础  = dG/d数字基础 
twoway (scatter dGd数字基础  数字基础 ), ytitle(dG(*)/d数字基础)












