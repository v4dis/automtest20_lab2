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

Log in wrong credentials
	[Documentation]		Login to site
	[Tags]			login
	Go To Web Page
	Verify Page Loaded
	Enter Email
	Enter Password
	Click Button Login

Test My Page
	[Documentation]		Given that user is registered, the user logs in and clicks the My Page button expecting to see their personal page.
	[Tags]			test_my_page
	Given That User Already Registered
	When User Logs In And Clicks My Page
	Then The User Expects To See Page
















