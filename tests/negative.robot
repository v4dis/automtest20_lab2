*** Settings ***
Documentation    Global documentation
Resource         ../resources/keywords.robot
Library          SeleniumLibrary
Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${BROWSER} =    firefox
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

InputNoValue
	[Documentation]		Submit field with no value
	[Tags]			submit_no_value
	Go To Web Page
	Verify Page Loaded
	Click Button Login

Log in with the wrong credentials
	[Documentation]		User logging in with the wrong credentials
	[Tags]			negative
	Go To Web Page
	Verify Page Loaded
	Enter Email  ${BAD_EMAIL}
	Enter Password  ${BAD_PASSWORD}
	Click Button Login
	Verify Login Failed

Test MyPage
	[Documentation]		Given that user is registered, the user logs in and clicks the My Page button expecting to see their personal page.
	[Tags]			gherkin
	Given That User Already Registered
	When User Logs In And Clicks My Page
	Then The User Expects To See Page

