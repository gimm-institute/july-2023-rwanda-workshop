
# Macro assets

![[title-page]]

$$
\newcommand{\xfwy}{\mathit{fwy}}
\newcommand{\xfund}{\mathrm{fund}}
\newcommand{\xbubble}{\mathrm{bubble}}
\newcommand{\xcond}{\mathrm{cond}}
\newcommand{\xss}{\mathrm{ss}}
\newcommand{\xroc}{\mathrm{roc}}
\notag
$$


--------------------------------------------------------------------------------

### Proxy for real value of generic assets


Real value of generic assets $\xfwy_t$

$$
\xfwy_t = \xfwy_t^\xfund \cdot \xfwy_t^\xbubble
$$

where

* $\xfwy_t^\xfund$ is the fundamental value (based on the "correct" present
  value of future cash flows)

* $\xfwy_t^\xbubble$ is a "bubble", i.e. a persistent deviation of the
  observed (market) value from its fundamental value


--------------------------------------------------------------------------------


### Fundamental macro-based real value of assets

The value of existing assets is proportional to the (hypothetical)
present value of claims on future real economic activity (i.e. a discounted sum of future GDP. 

The discount factor depends on the
hypothetical (unobservable) level of lending rates that would cover all
lending costs and (expected) risks

<br/>

$$
\xfwy_t^\xfund = \left(1 - \delta_\xss \right)
\ \mathrm E_t \Bigl[
y_t \ +\ \delta_{t,t+1} \cdot \frac{y_{t+1}}{y_\xss^\xroc} \ +\ \delta_{t,t+1} \cdot \delta_{t+1,t+2}\cdot
\frac{y_{t+2}}{y_\xss^\xroc{\,}^2} \ +\  \cdots
\Bigr]
$$

<br/>


with the discount factor between $t$ and $t+1$ defined as

$$
\delta_{t,t+1} \equiv \frac{1}{1 + c_0 + c_1 \cdot r_t^\xcond}
$$

where

*  $\delta_\xss \equiv \frac{1}{1 + c_0}$  is the steady-state discount factor

*  $y_\xss^\xroc$ is the steady-state (gross) rate of growth in real output

--------------------------------------------------------------------------------

### Technical corrections for steady state 

For analytical and calibration convenience, we want

$$
\xfwy_\xss = y_\xss
$$

To achieve this, we make two types of technical corrections

$$
\xfwy_t = \boxed{\left(1 - \delta_\xss \right)}
\ \mathrm E_t \Bigl[
y_t \ +\ \delta_{t,t+1} \cdot \frac{y_{t+1}}{\boxed{y_\xss^\xroc}} \ +\ \delta_{t,t+1} \cdot \delta_{t+1,t+2}\cdot
\frac{y_{t+2}}{\boxed{y_\xss^\xroc{\,}^2}} \ +\  \cdots
\Bigr]
$$

--------------------------------------------------------------------------------

### Recursive representation of the present value

The model specification cannot handle infinite forward sums. The fundamental value of assets needs to be rewritten into forward recurive form

$$
\xfwy_t = \left(1 - \delta_\xss \right)
\ \mathrm E_t \Bigl[
y_t \ +\ \delta_{t,t+1} \cdot  \frac{\xfwy_{t+1}}{y_\xss^\xroc}
\Bigr]
$$

--------------------------------------------------------------------------------

### Asset price bubble

A bubble is a persistent (autocorrelated) deviation of the observed
(market) value of assets from the fundamental value

$$
\log \xfwy_t^\xbubble = c_0 \ \log \xfwy_{t-1}^\xbubble + \varepsilon_t
$$

In the long run, we assume that the value of assets is consistent with
their fundamental value, and bubble does not exist

$$
\begin{gathered}
\xfwy_\xss = \xfwy_\xss^\xfund \\[10pt]
\xfwy_\xss^\xbubble = 1
\end{gathered}
$$

