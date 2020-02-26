*** Settings ***

Documentation    Global documentation
Resource         ../resources/keywords.robot
Library          SeleniumLibrary
Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${BROWSER} =    chrome
${URL} =    http://rental20.infotiv.net/
${SEARCH_TERM} =    ""
${EMAIL} =     needtsleep@gmail.com
${PASSWORD} =  murre123
${BAD_EMAIL} =	wrong@as.can.be
${BAD_PASSWORD} =	ClearlyWrong

*** Keywords ***

*** Test Cases ***

Reset button on Date Selection
	[Documentation]		Reset button on date selection should go back to the to date for the test
	[Tags]			    Reset Button
	Go To Web Page
	Verify Page Loaded
	Click Button Login