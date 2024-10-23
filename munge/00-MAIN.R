# Project specific packages, functions and settings -----------------------

source(here::here("setup/setup.R"))

# Load data ---------------------------------------------------------------

load(here(shfdbpath, "data/v421/rsdata421.RData"))
# rsdata421 <- rsdata421 %>%
#  head(10000)
load(here(shfdbpath, paste0("/data/", datadate, "/rawData_rs.RData")))

# Meta data ect -----------------------------------------------------------

metavars <- read.xlsx(here(shfdbpath, "metadata/meta_variables.xlsx"))
load(here(paste0(shfdbpath, "data/v421/meta_statreport.RData")))

# Munge data --------------------------------------------------------------

source(here("munge/01-vars.R"))
source(here("munge/02-add-palliativecare.R"))
source(here("munge/03-pop-selection.R"))
source(here("munge/04-fix-vars.R"))
source(here("munge/05-npr-outcome.R"))
source(here("munge/06-mi.R"))

# Cache/save data ---------------------------------------------------------

save(
  file = here("data/clean-data/rsdata.RData"),
  list = c(
    "rsdata",
    "imprsdata",
    "imprsdata0",
    "rsdatarephf",
    "rsdatarepany",
    "flow",
    "modvars",
    "tabvars",
    "outvars",
    "stratavars",
    "metavars",
    "deathmeta",
    "outcommeta"
  )
)

# create workbook to write tables to Excel
wb <- openxlsx::createWorkbook()
openxlsx::addWorksheet(wb, sheet = "Information")
openxlsx::writeData(wb, sheet = "Information", x = "Tables in xlsx format for tables in Statistical report: Palliative care in heart failure: extent of use, predictors of use, and association with cause-specific outcomes", rowNames = FALSE, keepNA = FALSE)
openxlsx::saveWorkbook(wb,
  file = here::here("output/tabs/tables.xlsx"),
  overwrite = TRUE
)

# create powerpoint to write figs to PowerPoint
figs <- officer::read_pptx()
print(figs, target = here::here("output/figs/figs.pptx"))
