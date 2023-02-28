*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${departure}            Boston
${distination}          Cairo
${name}                 Mohamed
${address}              street1
${city}                 Tampere
${country}              Finland
${ZipCode}              33222
${creditCardNumber}     3329989989989984
${creditCardMonth}      2
${creditCardYear}       2022
${nameOnCard}           james bond


*** Test Cases ***
Test
    Open browser    http://www.blazedemo.com/
    Page should contain    Welcome to the Simple Travel Agency!
    Select From List By Value    xpath:/html/body/div[3]/form/select[1]    ${departure}
    Select From List by Value    xpath://select[@name='toPort']    ${distination}
    Click Button    css:input[type='submit']
    Wait until page contains    Flights from Boston to Cairo
    Page should contain    Flights from Boston to Cairo
    ${Airline}=    Get webelement    xpath:/html/body/div[2]/table/tbody/tr[2]/td[3]
    ${Number}=    Get webelement    xpath:/html/body/div[2]/table/tbody/tr[1]/td[2]
    ${Price}=    Get webelement    xpath:/html/body/div[2]/table/tbody/tr[1]/td[6]
    Click Button    Choose This Flight
    Sleep    3s
    ${TotalCost}=    Get webelement    xpath:/html/body/div[2]/p[5]/em
    Page should contain    United
    Page should contain    UA954
    Page should contain    400

    Input text    xpath://*[@id="inputName"]    ${name}
    Input text    xpath://*[@id="address"]    ${address}
    Input text    xpath://*[@id="city"]    ${city}
    Input text    xpath://*[@id="state"]    ${country}
    Input text    xpath://*[@id="zipCode"]    ${ZipCode}

Click element    id:cardType
    Select from list by label    id:cardType    Diner's Club
    List selection should be    id:cardType    Diner's Club

    Input text    xpath://*[@id="creditCardNumber"]    ${creditCardNumber}
    Input text    xpath://*[@id="creditCardMonth"]    ${creditCardMonth}
    Input text    xpath://*[@id="creditCardYear"]    ${creditCardYear}
    Input text    xpath://*[@id="nameOnCard"]    ${nameOnCard}
    Click element    //*[@id="rememberMe"]
    Click button    Purchase Flight
    Wait until page contains    Thank you for your purchase today!
    Page should contain    Thank you for your purchase today!
