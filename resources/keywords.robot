*** Keywords ***
Begin Web Test
      Open Browser	about:blank	${BROWSER}
      Maximize Browser Window
      Go To Web Page
      Verify Page Loaded

End Web Test
    Close Browser

Go To Web Page
   Go To	${URL}

Verify Page Loaded
    ${link_text} =	Get Text	id:questionText
    Should Be Equal	${link_text}	When do you want to make your trip?

Click Button Login
	Click Button	xpath://button[@id="login"]

Enter Email
	Input Text	xpath://input[@id="email"]	${EMAIL}

Enter Password
	Input Text	xpath://input[@id="password"]	${PASSWORD}
	 				
Verify fail
	Wait Until Page Contains Element	xpath://label[@id="signInError"]
	Should be equal  Get Text  xpath://label[@id="signInError"] 		



	