
# Macro

![[title-page]]
$$
\newcommand{\loan}{l}
\newcommand{\xnewrl}[1][t]{rl^\Delta_{#1}}
\newcommand{\xnewrd}[1][t]{rd^\Delta_{#1}}
\newcommand{\xnewrlone}[1][t]{rl^{\Delta s1}_{#1}}
\newcommand{\xrl}[1][t]{rl_{#1}}
\newcommand{\xrd}[1][t]{rd_{#1}}
\newcommand{\xrs}[1][t]{\mathit{rs}_{#1}}
\newcommand{\psirl}{\psi_{rl}}
\newcommand{\lp}[1][t]{\loan p_{#1}}
\newcommand{\lpo}[1][t]{\loan p^0_{#1}}
\newcommand{\newl}[1][t]{\loan^\Delta_{#1}}
\newcommand{\xbase}{\mathrm{base}}
\newcommand{\xicr}{\mathrm{icr}}
\newcommand{\xnewrlbase}[1][t]{rl^{\Delta\xbase}_{#1}}
\newcommand{\xnewrdbase}[1][t]{rd^{\Delta\xbase}_{#1}}
\newcommand{\xnewrlicr}[1][t]{rl^{\Delta\xicr}_{#1}}
\newcommand{\xpvcbase}[1][t]{pvc^\xbase_{#1}}
\newcommand{\xpvxbase}[1][t]{pvx^\xbase_{#1}}
\newcommand{\xpvpbase}[1][t]{pvp^\xbase_{#1}}
\newcommand{\xpvnbase}[1][t]{pvn^\xbase_{#1}}
\newcommand{\xfcy}{\mathrm{fcy}}
\newcommand{\xlcy}{\mathrm{lcy}}
\newcommand{\xrlapm}[1][t]{rl_{#1}^\mathrm{apm}}
\newcommand{\xpsirl}[1][t]{\psi_{rl}}
\newcommand{\xapm}{\mathrm{apm}}
\newcommand{\xfull}{\mathrm{full}}
\newcommand{\xnewrlfull}[1][t]{rl^{\Delta\xfull}_{#1}}
\newcommand{\xss}{\mathrm{ss}}
\newcommand{\xfws}{\mathrm{fws}}
\notag
$$


### Overview	

The macro block follows the standard blueprint of Quarterly Projection
Model (QPM), widely used by central banks for monetary policy analysis and
forecast.

We present only the important deviations from the standard blueprint.

The macro block can be tailored to fit already existing macro models.

### Aggregate demand

Output (GDP) decomposition
$$
y_t = \bar y_t \ \cdot \ \hat y_t
$$


Extra effect of lending conditions (price and non-price) on the output gap



$$
\begin{aligned}
\log \hat y_t &= \ldots \\[10pt]
&- \ \color{red}{c_3 \ \hat r^{\Delta \xfull}_t} \\[10pt]
&+ \ldots
\end{aligned}
$$



### Aggregate supply

Possible **hysteresis** effect of the output gap on potential output


$$
\Delta \log \bar y_t
= c_0 \ \Delta \log \bar y_{t-1}
+ (1 - c_0) \ \log y^\mathrm{roc}_\xss
+ \color{red}{c_1 \ \log \hat y_t}
+ \epsilon_{\bar y,t}
$$



### Forward sum of discounted real income


Capture long-term expectations of real income (GDP), sensitive to lending conditions

$$
y_t^\xfws = \left(1 - \tfrac{1}{c_0}\right) \left[\
%
y_t 
+ \tfrac{1}{(c_0 + c_1 \ \hat r^{\Delta\xfull}_t) \ y^\mathrm{roc}_\xss} \ \ y_{t+1}
+ \cdots\
%
\right]
$$



Normalize for analytical convenience so that

$$
y_\xss^\xfws = y_\xss
$$



### Exchange rate and country premium

Risk-adjusted interest parity

$$
1 + rs^{\xlcy}_t = (1 + rs_t^\xfcy) \ \tfrac{e_{t+1}}{e_t}
\ (1 + prem_t)
\ \exp \epsilon_{e, t}
$$



Country premium sensitive to lending conditions

$$
prem_t = \overline{prem}
\ +\ \color{red}{c_1 \ \hat r^{\Delta \xfull}_t}
\ +\ \epsilon_{prem,t}
$$




---

