install.packages("rvest")
install.packages("XML")
library(rvest)
library(XML)
library(magrittr)

###Amazon Reviews#####
aurl<-"https://www.amazon.in/OnePlus-Mirror-Black-128GB-Storage/dp/B07DJD1Y3Q/ref=sr_1_1?s=amazon-devices&ie=UTF8&qid=1542162876&sr=8-1&keywords=oneplus+6t"
amazon_reviews <- NULL
for (i in 1:13){
  murl <- read_html(as.character(paste(aurl,i,sep="=")))
  rev <- murl %>%
    html_nodes(".review-text") %>%
    html_text()
  amazon_reviews <- c(amazon_reviews,rev)
}
write.table(amazon_reviews,"oneplus6t.txt",row.names = F)
