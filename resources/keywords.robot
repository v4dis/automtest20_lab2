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
	[Arguments]	${email}
	Input Text	xpath://input[@id="email"]	${email}

ENTER PASSWORD
	[Arguments]	${password}
	INPUT Text	xpath://input[@id="password"]	${password}
	 				
Verify fail
	Wait Until Page Contains Element	xpath://label[@id="signInError"]
	Should be equal  Get Text  xpath://label[@id="signInError"] 		

Click Button Mypage
	Click Button	xpath://button[@id="mypage"]
	${title_value} =	    Get Title
    	Should Be Equal	    ${title_value}	Mypage	

Verify Login Page Loaded
       Wait Until Page Contains Element 	xpath://label[@id="welcomePhrase"]

Verify Login Failed
       Wait Until Page Contains Element 	xpath://label[@id="signInError"]
       ${status_message} = 	Get Text	xpath://label[@id="signInError"]
       Should Be Equal	 ${status_message}	Wrong e-mail or password 

Given That User Already Registered
	Go To Web Page	
	Verify Page Loaded	

When User Logs In And Clicks My Page
	Enter Email  ${EMAIL}
	Enter Password  ${PASSWORD}
	Click Button Login 
	Verify Login Page Loaded	

Then The User Expects To See Page
	Click Button MyPage


	