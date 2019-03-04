# Webscrapping Twitter for a particular hashtag
# install.packages("RSelenium")
library(RSelenium)
rd <- rsDriver(browser = "chrome")
rem_dr <- rd[["client"]]


url <- "https://catalyst.uc.edu"
rem_dr$navigate(url) # Navigate to login page

## Manually enter username and password here
user <- rem_dr$findElement(using = "name", value = "j_username")$clickElement() # Click the "Authorize" button to continue logging in
rem_dr$sendKeysToActiveElement(list("****")) #---- UserName

## Manually enter password here
pwd <- rem_dr$findElement(using = "name", value = "j_password")$clickElement() # Click the "Authorize" button to continue logging in
rem_dr$sendKeysToActiveElement(list("*****"))


rem_dr$findElement(using = "name", value = "_eventId_proceed")$clickElement()
rem_dr$findElement()


rem_dr$findElement(using = "id", "win0divPTNUI_LAND_REC_GROUPLET$0")$clickElement()

rem_dr$findElement(using = "id", value = "PTGP_STEP_DVW_PTGP_STEP_LABEL$1")$clickElement()
rem_dr$findElement(using = "id", value = "PTGP_STEP_DVW_PTGP_STEP_LABEL$11$$1")$clickElement()

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
