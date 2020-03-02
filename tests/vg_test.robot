*** Settings ***
Documentation    Global documentation
Resource         ../resources/keywords.robot
Library          SeleniumLibrary
Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${BROWSER} =		firefox
${URL} =    		http://rental19.infotiv.net/
${SEARCH_TERM} =    	""
${EMAIL} =     		d@jdd.nu
${PASSWORD} =  		monkey
${BAD_EMAIL} =		wrong@as.can.be
${BAD_PASSWORD} =	ClearlyWrong

*** Keywords ***


*** Test Cases ***
	[Documentation]
	[Tags]	VG_test
	Given that user is already registered
	When user logs in and navigates to mypage
	Then the user wants to be able to click a button to see the documentation for the site.
	