# Inclusion/exclusion criteria --------------------------------------------------------

flow <- flow[c(1:8, 10), 1:2]

names(flow) <- c("Criteria", "N")

flow <- flow %>%
  mutate(Criteria = case_when(
    Criteria == "Exclude posts with with index date > 2023-12-31 (SwedeHF)/2021-12-31 (NPR HF, Controls)" ~ "Exclude posts with index date > 2023-12-31",
    Criteria == "Exclude posts censored end fu < index" ~ "Exclude posts with end of follow-up < index",
    Criteria == "Exclude posts with with index date < 2000-01-01" ~ "Exclude posts with index date < 2000-01-01",
    TRUE ~ Criteria
  ))

flow <- rbind(c("General inclusion/exclusion criteria", ""), flow)

flow <- rbind(flow, c("Project specific inclusion/exclusion criteria", ""))

rsdata <- rsdata %>%
  filter(shf_indexdtm >= ymd("2017-05-01"))
flow <- rbind(flow, c("Include posts >= 2017-05-01 (Palliative care included in the CRF)", nrow(rsdata)))

rsdata <- rsdata %>%
  filter(!is.na(shf_palliative_indicated))
flow <- rbind(flow, c("Exclude posts with missing palliative care indicated", nrow(rsdata)))

rsdata <- rsdata %>%
  group_by(lopnr) %>%
  arrange(shf_indexdtm) %>%
  slice(n()) %>%
  ungroup()

flow <- rbind(flow, c("Last post / patient", nrow(rsdata)))

rm(rsdata421)
gc()
