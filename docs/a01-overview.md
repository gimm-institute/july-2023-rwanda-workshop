
# Introduction and overview

![[title-page]]


--------------------------------------------------------------------------------

### What are we doing?

* Global Institute for Macroprudential Modeling [www.gimm.institute](https://www.gimm.institute): a (non-profit) network for finstab and macropru practitioners

* Running regional and technical workshops

* Developing and implementing an in-house finstab and macropru model framework

* Global macrofinancial scenario deliveries

--------------------------------------------------------------------------------


### What is the framework for?

[Keywords: big-picture, aggregative, medium term, solvency oriented]

* **Two-way** "behavioral" interactions between macro and the financial system with endogenous feedback

* Finstab **scenario** production and macropru **policy analysis**, cost-benefit analysis

* Top-layer **complement** to other existing models/tools; designed to help **synthesize** a variety of insights and inputs, including expert judgment

* Focus on **medium-term** time dimension of **solvency** risk (but flexible to
  judgmentally accommodate a range of other dimensions)

* **Customizable** and extensible to accommodate regional and jurisdictional
  specifics


--------------------------------------------------------------------------------

### What is the framework **not** meant to be?

* Forecasting framework 

* Formal probabilistic model or statistical prediction framework

* Deeply structural (aka DSGE) or "publishable" model

* Theory-based justification for macropru interventions (aggregate risk,
  money creation vs intermediation functions of banks, myopia, etc.)

* Framework for (stress) testing individual institutions


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

* Modular design (highly customizable) rather than fixed form

* The very basic model framework consists of three types of modules: macro,
  banking system, and connecting modules

* Examples of extension we implemented elsewhere: nonbank intermediaries (securities
  dealers), corporate fixed income markets, sovereign fixed income markets

* Keywords: Nonlinearities, asymmetries, stock-flow relationships, aggregate risk, macropru as robust
  not optimal policy


![Model structure](model-structure.png)


--------------------------------------------------------------------------------

### Core feedback

![Core feedback](feedback.png)

--------------------------------------------------------------------------------

### Semi-structual modeling approach 

* **Top-down** model building strategy: the properties of the model as a whole
  matter and are frequently the starting point for writing equations

* Explicit (but not microfounded) concepts of **supply and demand**

* **Unobserved components**: sustainability trends both in macro and
  financial parts (potential output, credit to GDP, excess comfort buffers,
  etc.)

* Forward-looking (model-consistent) **expectations**
  * Help introduce some financial concepts consistently (e.g. IFRS9, pricing of future anticipated risk, etc.)
  * Help construct scnearios with expliciti assumptions about future events and their anticipation

* Well-behaved *8steady state** (steady growth path)

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

1. **Delta scenarios: Macro stress scenarios** build with the macro baseline as the structural point of departure: input into further stress testing frameworks

1. Impact of (alternative) **macroprudential interventions** in such scenarios,
   aggregative input into cost-benefit analysis discussions

1. **Conceptual/"theoretical" simulations**, in particular policy
   interventions simulations for building insights, elevating discussions
   inside the institution, building macropru narrative for the public


--------------------------------------------------------------------------------

