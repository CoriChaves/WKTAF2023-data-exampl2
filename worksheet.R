library(icesTAF)
library(stockassessment)
install.packages("stockassessment", repos = "https://fishfollower.r-universe.dev")

taf.skeleton()
setwd("D:/Corina/MeoCloud/000 A/WKTAF/WKTAF2023-data-exampl2")

cat('library(stockassessment)
# download model from stockassessment.org
fit <- fitfromweb("WBCod_2021_cand01")
# save to model folder
save(fit, file = "fit.rData")
',
    file = "bootstrap/sam_fit.R"
)

cat('sam_assessment <- "WBCod_2021_cand01"
sam_dir <-
  paste0(
    "https://stockassessment.org/datadisk/stockassessment/userdirs/user3/",
    sam_assessment,
    "/data/"
  )
files <-
  paste0(
    c("cn", "cw", "dw", "lf", "lw", "mo", "nm", "pf", "pm", "survey", "sw"),
    ".dat"
  )
for (file in files) {
  download(paste0(sam_dir, file))
}
',
file = "bootstrap/sam_data.R"
)

draft.data(
  data.files = NULL,
  data.scripts = c("sam_data", "sam_fit"),
  originator = "WGBFAS",
  title = c("SAM input data for ...", "SAM fitted object for ..."),
  year = 2021,
  period = "1985-2020",
  file = TRUE,
  append = FALSE
)

taf.bootstrap()


