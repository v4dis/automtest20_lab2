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

Delete Date
    Input Text	    xpath://input[@id="start"]	0000-00-00
    Click Button    xpath://button[@id="continue"]
    Element Attribute Value Should Be     xpath://*[@id="start"]  required  true

Click Reset button and go to the next page
    Click Button    xpath://button[@id="reset"]
    Click Button    xpath://button[@id="continue"]
    ${link_text} =	Get Text	id:questionText
    Should Be Equal	${link_text}	What would you like to drive?


*** Test Cases ***

Reset button on Date Selection
	[Documentation]		Reset button on date selection should go back to the to date for the test
	[Tags]			    Reset Button
	Go To Web Page
	Verify Page Loaded
    Delete Date
    Click reset button and go to the next page
