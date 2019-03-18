# install.packages("RSelenium")
library(RSelenium)
rd <- rsDriver(browser = "chrome")
rem_dr <- rd[["client"]]


url <- "https://twitter.com/"
rem_dr$navigate(url) # Navigate to login page

## Manually enter username and password here
user <- rem_dr$findElement(using = "name", value = "session[username_or_email]")$clickElement() # Click the "Authorize" button to continue logging in
rem_dr$sendKeysToActiveElement(list("Prakash24411125"))

## Manually enter password here
pwd <- rem_dr$findElement(using = "name", value = "session[password]")$clickElement() # Click the "Authorize" button to continue logging in
rem_dr$sendKeysToActiveElement(list("****"))


rem_dr$findElement(using = "css", value = ".js-submit")$clickElement()


search <- rem_dr$findElement(using = "css", value = "#search-query")$clickElement() # Click the "Authorize" button to continue logging in
rem_dr$sendKeysToActiveElement(list("#AvengersEndgame"))

subm <- rem_dr$findElement(using = "css", value = ".nav-search")$clickElement()

Sys.sleep(10)

t <- rem_dr$findElements(using = 'css', ".tweet-text")
tweets=list()
tweets=sapply(t, function(x){x$getElementText()})
for(i in 1:6){
  print(tweets[i])
}

tweets_sub <- unlist(tweets)

View(data.frame(tweets_sub))

     

#PT_PAGETITLElbl

#Webscrapping IMDB Website to get movie title, rank and description of the movie.
library(rvest)
url <- 'http://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'

#Reading the HTML code from the website
webpage <- read_html(url)
rank_data_html <- html_nodes(webpage,'.text-primary')

#Converting the ranking data to text
rank_data <- html_text(rank_data_html)
rank_data <- as.numeric(rank_data)

# Title

title_html <- html_nodes(webpage,'.lister-item-header a')
title_data <- html_text(title_html)
title_data

#
# Title

review_body <- html_nodes(webpage,'.ratings-bar+ .text-muted')
review_body <- html_text(review_body)
review_body <- str_trim(review_body)

df <- data.frame(rank_data,title_data,review_body)
View(df)
