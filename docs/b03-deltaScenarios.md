
# Delta scenarios

![[title-page]]

---

### Introduction

* Simple technique to create consistent and comprehensive model-based scenarios derived from a particular macro baseline

* The macro baseline is usually delivered by someone else (typically monetary policy department) and describes the paths for subset of GIMM variables

* The model-based scenario is derived from the macro baseline but does not keep the input variables fixed: all respond endogenously to extra assumptions


---

### Use cases

Conceptually and technically simple, with a range of applications:

* Baseline for macrofinancial and banking variables consistent with macro

* Production of macro stress scenarios

* Analysis of policy interventions, past and future


---

### Inputs

* Baseline scenario from external source
    * Can be macro+world only, or macro+world+some parts of financial
    * Does not need to cover all variables in the model
    * Typical example: monetary policy forecast (GDP, inflation, short rates, exchange rate)
 
* Data on current position of the macroeconomy and financial sector (initial condition)

* Model calibrated to the current position of the economy

---

### Conceptual explanation

###### Step 1 (Hands-free)
Simulation starting from the current conditions

###### Step 2 (Inversion)
Reproduce macro baseline using add-factors (tunes), simulating the paths for the rest of the model variables consistent with the macro baseline

###### Steps 3...N (Own scenario assumptions)
Keep the tunes from Step 2, and incorporate any number of assumptions on top of the baseline
* structural shocks
* policy interventions
* changes in long-term sustainability assumptions
* etc...

---

### Technical explanation 

* Assume you want to build a macrofinancial scenario consistent with externally provided macro forecast

$$
\left( \begin{matrix} m_t \\ 
                      f_t 
       \end{matrix} 
\right)
 = A \cdot
 \left( \begin{matrix} m_{t-1} \\ 
                      f_{t-1} 
       \end{matrix} 
\right)
 +
 \left( \begin{matrix} \epsilon^m_{t-1} \\ 
                      \epsilon^f_{t-1} 
       \end{matrix} 
\right)
$$
* where: 
    * $m$ and $\epsilon^m$ are vectors of macro variables and shocks 
    * $f$ and $\epsilon^f$ are vectors of financial variables and shocks
 
* Assume $m_t$ is given for $t=0, \ldots, T$ (external scenario, baseline macro forecast)

* Find shocks $\epsilon^m$ that replicate given path of $m$ using model inversion 

* Simulate the model with shocks $\epsilon^m$ to obtain financial sector variables $f$ consistent with external macro input $m$

---

### Technical explanation, cont.

* Add additional macro assumptions (modify vector $\epsilon^m$). Examples:
    * Interest hike
    * GDP growth decline
    * FX depreciation
 
* Add additional financial sector assumptions (vector $\epsilon^f$). Examples:
    * Worsening credit performance
    * Tightening of lending conditions
 
* Or combine multiple inputs to create a more complex scenario
    * Very easy to code and implement all kinds of scenarios

---

### Result

* Simulate again with updated set of shocks
    * Incorporates the shocks that replicate the baseline macro scenarion **plus** your additional inputs
 
* The resulting scenario:
    * Is based on the external input (baseline scenario)
    * Differs from the baseline scenario in simple, clearly defined way
    * Provides consistent projection for macro and financial variables
 
* Advantages:
    * Incorporates all feedback loops built into the model
    * Perfect foresight on macro variables, but also possibility of unexpected shocks on top of that

---

### Practical application: EU-wide stress-testing

![EBA|700](assets/eba-design.png)


--- 

### Traditional stress testing vs Macro stress testing and macropru policy

* Bottom up vs Top down

* Static pool vs Dynamic pool vs Behavioral

* Exogenous vs endogenous expectations

* No feedback (macro given) vs Feedback  

---

### Static balance sheets

![|750](assets/eba-cutout-1.jpg) ![|750](assets/eba-cutout-2.jpg)

---

### Exogenous expectations

![|750](assets/eba-cutout-3.jpg) ![|750](assets/eba-cutout-4.jpg)



