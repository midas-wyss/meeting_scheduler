set.seed(1234)

peeps <- c("rani", "jackie", "daniel", "pradeep", "miguel", "bianca", "nico")

meeting_dates <- seq(ymd("2020-02-12"), ymd("2020-05-31"), by = '2 weeks')

sel_week <- character(length = length(meeting_dates))
tmp1 <- character(length = length(peeps))
tmp2 <- character(length = length(meeting_dates) - length(peeps))
tmp1[1] <- "rani"
for (i in seq(2, length(peeps))) {
  
  past_presenters <- tmp1[-which(tmp1 == "")]
  if (length(tmp1[-which(tmp1 == "")]) != length(peeps)) {
    rem_peeps <- setdiff(peeps, past_presenters)
    tmp1[i] <- sample(rem_peeps, 1)
  } 
    
  
  tmp2 <- tmp1[1:(length(meeting_dates) - length(peeps))]
  sel_week <- c(tmp1, tmp2)
}

df <- tibble::tibble(meeting_date = meeting_dates,
                     presenter = sel_week)
                     
