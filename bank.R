library(naniar)
library(ggplot2)
library(dplyr)
library(tidyr)
library(VIM)
#BankData <- read.csv("bank-full.csv")
bankData <- read.csv("bank-additional-full.csv",sep=";")
bankData[bankData=="unknown"] <- NA

ggplot(bankData, aes(factor(job), fill = factor(marital))) +
  geom_bar(position = "dodge2")

ggplot(bankData, aes(factor(job), fill = factor(education))) +
  geom_bar(position = "dodge2")

df <- bankData %>%
  group_by(job) %>%
  summarise(counts = n())
df

ggplot(df, aes(x = job, y = counts)) +
  geom_bar(fill = "#0073C2FF", stat = "identity") +
  geom_text(aes(label = counts), vjust = -0.3) 

aggr_plot <- aggr(bankData, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE, labels=names(bankData), cex.axis=.7, gap=3, ylab=c("Histogram of missing data","Pattern"))
