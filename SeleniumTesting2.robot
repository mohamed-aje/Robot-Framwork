*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${name}                 Moha
${company}              Aje
${email_address}        achoo.lmfao@yahoo
${password}             123456
${confirm_password}     123456


*** Test Cases ***
Register in website
    Open browser    http://www.blazedemo.com/    chrome
    Page shouldcontain    Welcome to the Simple Travel Agency!
    Click Element    xpath:/html/body/div[1]/div/div/a[3]
    Click Element    xpath://*[@id="app-navbar-collapse"]/ul[2]/li[2]/a

    Input Text    xpath://*[@id="name"]    ${name}
    Input Text    xpath://*[@id="company"]    ${company}
    Input Text    xpath://*[@id="email"]    ${email_address}
    Input Text    xpath://*[@id="password"]    ${password}
    Input Text    xpath://*[@id="password-confirm"]    ${confirm_password}
    Click Button    xpath://*[@id="app"]/div/div/div/div/div[2]/form/div[6]/div/button
