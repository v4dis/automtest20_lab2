*** Settings ***
Documentation    Global documentation
Resource         ../resources/Keywords.robot
Library          SeleniumLibrary
Test Setup       
Test Teardown    

*** Variables ***
${BROWSER} =    firefox
${URL} =    http://amazon.com
${SEARCH_TERM} =    ferrari 458


*** Test Cases ***
User can access amazon.com
	[Documentation]  Local documentation about the test
    [Tags]  Test 1
    Go To Web Page

User can conduct a search
    [Documentation]  Local documentation about the test
    [Tags]  Test 2
    Go To Web Page
    Search For Product    ferrari 458    results for "ferrari 458"

User can conduct another search
    [Documentation]  Local documentation about the test
    [Tags]  Test 3
    Go To Web Page
    Search For Product    tesla model x    results for "tesla model x"

User can conduct yet another search
	[Documentation]  Testdocumentation about this test
	[Tags]  Test 4
	Go To Web Page
	Search For Product  volvo 850    results for "volvo 850"
