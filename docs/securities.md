$$
\newcommand{\xfv}[1][t]{\mathit{FV}_{S,#1}}
\newcommand{\xpvs}[1][t]{\mathit{PV}_{S,#1}}
\newcommand{\xcr}[1][t]{\mathit{c}_{#1}}
\newcommand{\xsecdecay}{\theta_S}
$$

# Securities and Securities Dealers

* Consol(idated) Bond with Geometrically Decreasing Coupon
* Fair Market Value
* Macaulay's Duration

---

## Consol(idated) Bond with Geometrically Decreasing Coupon

. | Purchase $t=0$ | $t=1$ | $t=2$ 
---|---|---|--- 
Face value | $\xfv[0]$ | $\xfv[0]$ | $\xfv[0]$ 
Coupon rate | | $\xcr[0]$ | $(1-\xsecdecay)\, \xcr[0]$
Coupon payment | | $\xcr[0]\, \xfv[0]$ | $(1-\xsecdecay)\, \xcr[0]\,\xfv[0]$ 

---

## Fair Market Value

Price of unit face value at time $t=0$

$$
\xpvs[0] = \frac{\xcr[0]}{1+r_0} + \frac{\left(1-\xsecdecay\right)\, \xcr[0]}{\left(1+r_0\right)\,\left(1+r_1\right)} +\cdots
$$

$$
\xpvs[0] = 1
$$

---

## Macaulay's Duration in Steady State


$$
MD_S \quad =
\quad 1\cdot \frac{\xcr[ss]}{1 + r_{ss}} \quad 
+\quad 2\cdot \frac{\left(1-\xsecdecay\right)\,\xcr[ss]}{\left(1 + r_{ss}\right)^2} \quad + \quad \cdots \quad =
$$

