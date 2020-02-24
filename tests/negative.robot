*** Settings ***
Documentation    Global documentation
Resource         ../resources/keywords.robot
Library          SeleniumLibrary
Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${BROWSER} =    firefox
${URL} =    http://rental19.infotiv.net/
${SEARCH_TERM} =    ""
${EMAIL} =     test@test.test
${PASSWORD} =  password

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

Given 