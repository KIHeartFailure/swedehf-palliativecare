source(here::here("setup/setup.R"))

# load data
load(here("data/clean-data/rsdata.RData"))

dataass <- mice::complete(imprsdata, 3)
dataass <- mice::complete(imprsdata, 6)

# check assumptions for cox models ----------------------------------------

# palliative care indicated
i <- 1
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_indicated + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")

ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)

i <- 2
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_indicated + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")

ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)

i <- 3
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_indicated + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")


ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)

i <- 4
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_indicated + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")

ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)

i <- 6
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_indicated + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")

ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)

# palliative care given
i <- 1
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_given + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")

ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)

i <- 2
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_given + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")

ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)

i <- 3
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_given + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")


ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)

i <- 4
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_given + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")

ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)

i <- 6
mod <- coxph(formula(paste0(
  "Surv(", outvars$time[i], ",", outvars$var[i], " == 'Yes') ~ shf_palliative_given + ", paste(modvars, collapse = " + ")
)), data = dataass)

# prop hazard assumption
testpat <- cox.zph(mod)
print(sig <- testpat$table[testpat$table[, 3] < 0.05, ])

x11()
plot(testpat[1], resid = T, col = "red")
plot(testpat[5], resid = T, col = "red")
plot(testpat[8], resid = T, col = "red")

ggcoxdiagnostics(mod,
  type = "dfbeta",
  linear.predictions = FALSE, ggtheme = theme_bw()
)


# For log reg models

# palliative care indicated

ormod <- glm(formula(paste0("shf_palliative_indicated == 'Yes' ~ ", paste0(modvars, collapse = " + "))),
  family = binomial(link = "logit"), data = dataass
)

# vif
print(car::vif(ormod))

# outliers
cooks <- cooks.distance(ormod)
plot(cooks)
abline(h = 4 / nrow(dataass), lty = 2, col = "red") # add cutoff line

# palliative care given

ormod <- glm(formula(paste0("shf_palliative_given == 'Yes' ~ ", paste0(modvars, collapse = " + "))),
  family = binomial(link = "logit"), data = dataass
)

# vif
print(car::vif(ormod))

# outliers
cooks <- cooks.distance(ormod)
plot(cooks)
abline(h = 4 / nrow(dataass), lty = 2, col = "red") # add cutoff line
