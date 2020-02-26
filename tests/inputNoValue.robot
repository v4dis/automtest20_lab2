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

Input No Value
	[Documentation]		Submit field with no value
	[Tags]			    submit no value
	Go To Web Page
	Verify Page Loaded
	Click Button Login
