# Variables for baseline tables -----------------------------------------------

tabvars <- c(
  # demo
  "shf_palliative_given",
  "shf_indexyear_cat",
  "shf_sex",
  "shf_age",
  "shf_age_cat",

  # organizational
  "shf_location",
  "shf_followuphfunit",
  "shf_followuplocation_cat",

  # clinical factors
  "shf_durationhf",
  "shf_ef_cat",
  "shf_nyha",
  "shf_nyha_cat",
  "shf_bmi",
  "shf_bmi_cat",
  "shf_bpsys",
  "shf_bpsys_cat",
  "shf_bpdia",
  "shf_map",
  "shf_heartrate",
  "shf_heartrate_cat",

  # comorbs
  "shf_smoke_cat",
  "shf_sos_com_diabetes",
  "shf_sos_com_hypertension",
  "shf_sos_com_ihd",
  "sos_com_stroke",
  "shf_sos_com_af",
  "shf_anemia",
  "sos_com_valvular",
  "sos_com_liver",
  "sos_com_copd",
  "sos_com_cancer3y",
  "sos_com_muscoloskeletal3y",
  "sos_com_charlsonci",
  "sos_com_charlsonci_cat",

  # treatments
  "shf_rasiarni",
  "shf_bbl",
  "shf_mra",
  "shf_sglt2",
  "shf_diuretic",
  "shf_nitrate",
  "shf_digoxin",
  "shf_anticoagulantia",
  "shf_asaantiplatelet",
  "shf_statin",
  "shf_device_cat",

  # lab measurements
  "shf_gfrckdepi",
  "shf_gfrckdepi_cat",
  "shf_potassium",
  "shf_potassium_cat",
  "shf_hb",
  "shf_ntprobnp",
  "shf_ntprobnp_cat",

  # socec
  "scb_famtype",
  "scb_child",
  "scb_education",
  "scb_dispincome_cat",
  "shf_qol",
  "shf_qol_cat"
)

# Variables for models (imputation, log, cox reg) ----------------------------

tabvars_not_in_mod <- c(
  "sos_com_liver",
  "scb_child",
  "shf_palliative_given",
  "shf_age",
  "shf_nyha",
  "shf_bpsys",
  "shf_bpdia",
  "shf_map",
  "shf_map_cat",
  "shf_heartrate",
  "shf_gfrckdepi",
  "shf_hb",
  "shf_ntprobnp",
  "shf_potassium",
  "shf_bmi",
  "sos_com_charlsonciage",
  "sos_com_charlsonciage_cat",
  "shf_qol",
  "shf_qol_cat",
  "shf_sglt2",
  "sos_com_charlsonci",
  "sos_com_charlsonci_cat"
)

modvars <- tabvars[!(tabvars %in% tabvars_not_in_mod)]

outvars <- tibble(
  var = c("sos_out_death", "sos_out_deathcvhosphf", "sos_out_deathcv", "sos_out_hosphf", "sos_out_counthosphf", "sos_out_hospany", "sos_out_counthospany"),
  time = c("sos_outtime_death", "sos_outtime_hosphf", "sos_outtime_death", "sos_outtime_hosphf", "sos_outtime_death", "sos_outtime_hospany", "sos_outtime_death"),
  shortname = c("Death", "CV death/1st HFH", "CV death", "1st HFH", "HFH", "1st hospitalization", "Hospitalization"),
  name = c("Death", "Composite CV death or First HF hospitalization", "CV death", "First HF hospitalization", "Total HF hospitalization", "First hospitalization", "Total hospitalization"),
  composite = c(F, T, F, F, F, F, F),
  rep = c(F, F, F, F, T, F, T),
  primary = c(T, F, F, F, F, F, F),
  order = c(1, 2, 3, 4, 5, 6, 7)
) %>%
  arrange(order)

stratavars <- c("shf_location", "shf_durationhf")

metavars <- bind_rows(
  metavars,
  tibble(
    variable = c(
      "shf_palliative_indicated",
      "shf_palliative_given"
    ),
    label = c(
      "Palliative care indicated",
      "Palliative care given"
    )
  )
)
