
$$
\newcommand{\xpvs}{\mathit{pvu}}
\newcommand{\xcr}[1][t]{\mathit{c}_{#1}}
\newcommand{\xsecdecay}{\theta_S}
\newcommand{\ac}{\mathrm{ac}}
\newcommand{\gg}{\mathrm{gg}}
\newcommand{\dg}{\mathit{dg}}
\newcommand{\rdg}{\mathit{\widehat r}}
\newcommand{\ytm}{\mathit{ytm}}
$$


## Consolidated bond with geometrically distributed amortized cost

|                             | Origination    | $t=1$               | $t=2$                               |
| --------------              | -------------- | ------------------- | ----------------------------------- |
| Amortized cost (Book value) | $dg_0^\Delta$         | $(1-\theta_{dg})\, dg_0^\Delta$           | $(1-\theta_{dg})^2 \, dg_0^\Delta$             |
| Coupon rate                 | $c_0$          |                                  |                                     |
| Coupon payment              |                | $c_0 \, dg_0^\Delta$                    | $(1-\theta_{dg}) \, c_0 \, dg_0^\Delta$
| Principal paydown           |                | $\theta_{dg} \, dg_0^\Delta$   | $(1-\theta_{dg}) \, \theta_{dg} \, dg_0^\Delta$



## Fair market value of newly originated bonds

Price of unit face value at time $t=0$

$$
\xpvs_{0} = \mathrm E_0 \left[ \frac{\xcr[0]+\theta_{dg}}{1+\rdg_0} + \frac{\left(1-\xsecdecay\right)\, (\xcr[0] + \theta_{dg})}{\left(1+\rdg_0\right)\,\left(1+\rdg_1\right)} +\cdots \right]
$$

where the discount rate is given by

$$
1 + \rdg_t \equiv \mathrm E_t \left[ \frac{1 + r_t + prem_t}{1 - q^\gg_{t+1}} \right]
$$

Calculate $c_0$ such that

$$
\xpvs_0 = 1
$$


## Face value (approx amortized cost value) of the stock of existing bonds (no default)

$$
\dg_t = (1 -\theta_\dg) \ \dg_{t-1} + \dg^\Delta_t
$$


## Yield to maturity


$$
\xpvs_{0} = \mathrm E_0 \left[ \frac{\xcr[0]+\theta_{dg}}{1+\ytm_0} + \frac{\left(1-\theta_{dg}\right)\, (\xcr[0] + \theta_{dg})}{\left(1+\ytm_0\right)\,\left(1+\ytm_1\right)} +\cdots \right]
$$

## Macaulay's duration in steady state


$$
MD_S \quad =
\quad 1\cdot \frac{\xcr[ss]}{1 + \rdg_{ss}} \quad 
+\quad 2\cdot \frac{\left(1-\theta_{dg}\right)\,\xcr[ss]}{\left(1 + \rdg_{ss}\right)^2} \quad + \quad \cdots \quad =
$$


