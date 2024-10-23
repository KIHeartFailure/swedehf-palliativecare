rsnew <- rsnew %>%
  mutate(
    shf_indexdtm = coalesce(DATE_DISCHARGE, d_DATE_FOR_ADMISSION)
  ) %>%
  mutate() %>%
  select(LopNr, shf_indexdtm, PALLIATIVE_TREATMENT_GIVEN, PALLIATIVE_TREATMENT_CURRENT)

rep_func_new <- function(var) {
  var <- na_if(var, ".A")
  var <- na_if(var, ".N")
}

rsnew <- rsnew %>%
  mutate(across(where(is.character), rep_func_new)) %>%
  mutate(
    shf_palliative_indicated = factor(case_when(
      is.na(PALLIATIVE_TREATMENT_CURRENT) ~ NA_real_,
      PALLIATIVE_TREATMENT_CURRENT %in% c("YES") ~ 1,
      TRUE ~ 0
    ), levels = 0:1, labels = c("No", "Yes")),
    shf_palliative_given = factor(case_when(
      is.na(shf_palliative_indicated) ~ NA_real_,
      PALLIATIVE_TREATMENT_GIVEN %in% c("GENERAL_PALLIATIVE", "SPECIALIZED_PALLIATIVE") ~ 1,
      PALLIATIVE_TREATMENT_GIVEN %in% c("NO") | shf_palliative_indicated == "No" ~ 0
    ), levels = 0:1, labels = c("No", "Yes"))
  ) %>%
  select(-PALLIATIVE_TREATMENT_GIVEN, -PALLIATIVE_TREATMENT_CURRENT)

rsdata <- left_join(rsdata421,
  rsnew,
  by = c("lopnr" = "LopNr", "shf_indexdtm")
)
