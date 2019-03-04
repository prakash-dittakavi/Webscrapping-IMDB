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
