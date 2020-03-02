*** Settings ***
Documentation    Global documentation
Resource         ../resources/keywords.robot
Library          SeleniumLibrary
Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${BROWSER} =		chrome
${URL} =    		http://rental20.infotiv.net/
${SEARCH_TERM} =    	""
${EMAIL} =     		needtsleep@gmail.com
${PASSWORD} =  		murre123
${BAD_EMAIL} =		wrong@as.can.be
${BAD_PASSWORD} =	ClearlyWrong

*** Keywords ***
Click Link About
	Click Link			xpath://a[@id="about"]
	Location Should Contain		about.php

Click Logo
	Click Element	xpath://div[@id="logo"]
	Location Should Contain		index.php

Click Element And Verify Page
	[Arguments]	${url_should_contain}		${element_id}
	Click Element	xpath://div[@id="${element_id}"]
	Location Should Contain		${url_should_contain}

Click Link And Verify Page
	[Arguments]	${url_should_contain}		${link_id}
	Click Link	xpath://a[@id="${link_id}"]
	Location Should Contain		${url_should_contain}

Click Button And Verify Page
	[Arguments]	${url_should_contain}		${button_id}
	Click Button	xpath://button[@id="${button_id}"]
	Location Should Contain		${url_should_contain}

Click Documentation
       Click Link	xpath://a[@id="linkButton"]
       Switch Window	locator=NEW
       Location Should Contain		documentation
       Close Window

Click Selected Button 
	[Arguments]	${button_id}
	Click Button	xpath://button[@id="${button_id}"]

Check Page Contains
	[Arguments]	${text}
	Page Should Contain		${text}

Check Page Not Contains
	[Arguments]	${text}
	Page Should Not Contain		${text}

Book Car
	Input Text	xpath://input[@id="start"]	2020-03-03
	Input Text	xpath://input[@id="end"]	2020-04-03
	Click Selected Button				continue
	Wait Until Page Contains Element		xpath://input[@id="bookQ7pass5"]
	Click Element	xpath://*[@id="bookQ7pass5"]
	Wait Until Page Contains Element  xpath://input[@id="cardNum"]	timeout=12
	Input Text	xpath://input[@id="cardNum"]	0123456789012345	
	Input Text	xpath://input[@id="fullName"]	Anonymous Coward
	Click Element	xpath://*[@id="month3"]
	Click Element	xpath://*[@id="month2024"]
	Input Text	xpath://input[@id="cvc"]	123
	Click Button	xpath://button[@id="confirm"]
	Page Should Contain	is now ready for pickup
	Click Button	xpath://button[@id="mypage"]
	Page Should Contain	My bookings

Log Out
	Click Button	xpath://button[@id="logout"]

*** Test Cases ***
Verify URL loaded
    [Documentation]  Verifiera att sidan är laddad
    [Tags]  verify_loadad
    Go To Web Page
    Verify Page Loaded
    Enter Email  ${EMAIL}
    Enter Password  ${PASSWORD}
    Click Button Login
    Click Link And Verify Page		about.php	about
    Click Element And Verify Page	index.php	logo	
    Click Button And Verify Page	myPage.php	mypage
#    Set Selenium Speed    1 seconds		
    Click Selected Button     show
    Check Page Contains		Order history
    Click Selected Button     hide
    Check Page Not Contains		Order history	
    Click Element And Verify Page	index.php	logo	
    Book Car
    Log Out







