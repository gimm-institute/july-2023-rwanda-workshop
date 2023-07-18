
# Introduction and overview

![[title-page]]


--------------------------------------------------------------------------------

### A bit of context: What are we doing?

* Global Institute for Macroprudential Modeling [www.gimm.institute](https://www.gimm.institute): a (non-profit) network for finstab and macropru practitioners

* Running regional and technical **workshops**

* **Bilateral technical cooperation** in developing and implementing  in-house finstab and macropru model frameworks

* Producing and delivering **global scenarios** of macrofinancial stress

--------------------------------------------------------------------------------


### What is the framework designed for?

* **Top-down aggregative two-way "behavioral"** interactions between macro and the financial system with endogenous feedback (Why? ...)

* Main focus on **medium-term** time dimension of **threats to solvency** (credit risk, interest rate risk, exchange rate risk, market risk)

* Finstab **scenario** production and macropru **policy analysis** (cost-benefit analysis, etc.)

* **Customizable** and extensible to accommodate regional and jurisdictional
  specifics

* Usable for structural interpretation and impact analysis of **climate risks**

---

### How does the framework fit in?

* Top-layer **complement** to other existing models/tools

* Help **synthesize** a variety of insights and inputs

* Operationalize expert **judgmental calls**


--------------------------------------------------------------------------------

### What is the framework **not** meant to be?

* Forecasting framework 

* Formal probabilistic model or statistical prediction framework

* Deeply structural (aka DSGE) or "publishable" model

* Econometric ("estimated") model or regression model

* Theory-based justification for macropru interventions (aggregate risk,
  money creation vs intermediation functions of banks, myopia, etc.)

* Framework for (stress) testing individual institutions

* Detailed accounting framework


--------------------------------------------------------------------------------

### Digression: Theoretical foundations


* A large amount of insights from our work on macropru DSGE models 

* Converted to semi-structural form

* Evolving form, based on our implementation expercience


--------------------------------------------------------------------------------


### Use cases and place in finstab and macropru

*After we see the structure of the model*


--------------------------------------------------------------------------------

### Basic structure of the framework

![[model-structure-canvas.canvas|model-structure-canvas]]

* **Modular** design (highly customizable) rather than fixed form

* The very basic model framework consists of **three types of modules**: macro,
  financial system, and connecting modules

* Examples of extensions we implemented elsewhere
	* nonbank intermediaries (securities dealers)
	* corporate fixed income markets
	* sovereign fixed income markets


--------------------------------------------------------------------------------

### Core feedback mechanism between macro and bank balance sheets

![[lending-conditions-feedback-canvas.canvas|lending-conditions-feedback]]

--------------------------------------------------------------------------------

### Semi-structural modeling approach 

* **Top-down** model building strategy
    * the properties of the model as a whole matter and are frequently the starting point for writing equations
    * the narrative to explain aggregate behavior based on top-down logic, not on proximate causes

* Explicit (but not microfounded) concepts of **supply and demand**

* **Unobserved components**: sustainability trends both in macro and
  financial parts (potential output, credit to GDP, excess comfort buffers,
  etc.)

* Forward-looking (model-consistent) **expectations**
    * help introduce some financial concepts consistently (e.g. IFRS9, pricing of future anticipated risk, etc.)
    * help construct scenarios with explicit assumptions about future events and their anticipation

* Well-behaved **steady state** (steady growth path)

* Calibration heavily based on the properties of the model as **a whole
  system** ("smell test" simulations, policy trade-offs)

* Simplifying assumptions to mimic real word in an analytically tractable
  way (loan repayment schedule, present value calculations, asset valuation)


--------------------------------------------------------------------------------

### Operational flexibility

* Not a traditional econometric or research model with fixed form

* Needs to be maintained as a live evolving project, reacting to needs and
  questions arising over time

* Some equations and parameters may change as part of scenario assumptions


--------------------------------------------------------------------------------


### Typical use cases


1. **Data-based baseline projections**, e.g. scenarios consistent with
   macroeconomic assumptions (e.g. central bank macro forecast) and the
   current state of the financial sector

1. **Delta scenarios: Macro stress scenarios** build with the macro baseline as the structural point of departure: input into further stress testing frameworks (direct, reverse, conditioning, etc...)

1. Impact of (alternative) **macroprudential interventions** in such scenarios,
   aggregative input into cost-benefit analysis discussions

1. **Conceptual/"theoretical" simulations**, in particular policy
   interventions simulations for building insights, elevating discussions
   inside the institution, building macropru narrative for the public


--------------------------------------------------------------------------------

