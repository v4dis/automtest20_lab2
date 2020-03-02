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

*** Test Cases ***
Load URL
    [Documentation]  Laddar sidan
    [Tags]  Laddar sidan
    Go To Web Page
    Verify Page Loaded

Log in with the wrong credentials
	[Documentation]		User logging in with the wrong credentials
	[Tags]			Testfall 1: Negative
	Go To Web Page
	Verify Page Loaded
	Enter Email  ${BAD_EMAIL}
	Enter Password  ${BAD_PASSWORD}
	Click Button Login
	Verify Login Failed


