#! /usr/local/bin/Rscript

#############
# Load Data #
#############
# Load full data set
data.f = read.csv("muse_randomized.csv")

###############
# Score PHQ-4 #
###############
# Note 1: Missing value codes 66/77/88/99
# Note 2: HV07, HV08 (2-item anx.); HV09, HV10 (2-item dep.)

# Set missing values to system missing
data.f$HV07[data.f$HV07==66] <- NA
data.f$HV07[data.f$HV07==77] <- NA
data.f$HV07[data.f$HV07==88] <- NA
data.f$HV07[data.f$HV07==99] <- NA
data.f$HV08[data.f$HV08==66] <- NA
data.f$HV08[data.f$HV08==77] <- NA
data.f$HV08[data.f$HV08==88] <- NA
data.f$HV08[data.f$HV08==99] <- NA
data.f$HV09[data.f$HV09==66] <- NA
data.f$HV09[data.f$HV09==77] <- NA
data.f$HV09[data.f$HV09==88] <- NA
data.f$HV09[data.f$HV09==99] <- NA
data.f$HV10[data.f$HV10==66] <- NA
data.f$HV10[data.f$HV10==77] <- NA
data.f$HV10[data.f$HV10==88] <- NA
data.f$HV10[data.f$HV10==99] <- NA

# NOTE: data was coded as 1-4 instead of 0-3
# Recode data for accurate scoring
data.f$HV07.corrected<-NA
data.f$HV08.corrected<-NA
data.f$HV09.corrected<-NA
data.f$HV10.corrected<-NA
data.f$HV07.corrected[data.f$HV07 == 1] <- 0
data.f$HV07.corrected[data.f$HV07 == 2] <- 1
data.f$HV07.corrected[data.f$HV07 == 3] <- 2
data.f$HV07.corrected[data.f$HV07 == 4] <- 3
data.f$HV08.corrected[data.f$HV08 == 1] <- 0
data.f$HV08.corrected[data.f$HV08 == 2] <- 1
data.f$HV08.corrected[data.f$HV08 == 3] <- 2
data.f$HV08.corrected[data.f$HV08 == 4] <- 3
data.f$HV09.corrected[data.f$HV09 == 1] <- 0
data.f$HV09.corrected[data.f$HV09 == 2] <- 1
data.f$HV09.corrected[data.f$HV09 == 3] <- 2
data.f$HV09.corrected[data.f$HV09 == 4] <- 3
data.f$HV10.corrected[data.f$HV10 == 1] <- 0
data.f$HV10.corrected[data.f$HV10 == 2] <- 1
data.f$HV10.corrected[data.f$HV10 == 3] <- 2
data.f$HV10.corrected[data.f$HV10 == 4] <- 3

# Score
# Restrict to only those with full data
data.f$PHQ4.t<-data.f$HV07.corrected+data.f$HV08.corrected+data.f$HV09.corrected+data.f$HV10.corrected
data.f$PHQ4.a<-data.f$HV07.corrected+data.f$HV08.corrected
data.f$PHQ4.d<-data.f$HV09.corrected+data.f$HV10.corrected


# Save data
write.csv(data.f,"muse_randomized_scored.csv", row.names = FALSE)
