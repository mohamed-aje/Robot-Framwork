*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem


*** Variables ***
${name}         Mohamed
${email}        mohammed@test.com
${message}      Hello i found your portoflio interesting!!!


*** Test Cases ***
testing my own portofolio
    Open Browser    https://mohaaje.netlify.app/    chrome
    Page Should Contain    Hi, I'm Mohamed.
    Click Element    xpath://*[@id="root"]/main/header/div/nav/a[2]
    Page Should Contain    Projects I've Built and Participated in:
    Click Element    xpath://*[@id="root"]/main/header/div/nav/a[3]
    Page Should Contain Element    xpath://*[@id="contact"]/div/div[2]/div
    Input Text    xpath://*[@id="name"]    ${name}
    Input Text    xpath://*[@id="email"]    ${email}
    Input Text    xpath://*[@id="message"]    ${message}
    Click Button    xpath://*[@id="contact"]/div/div[2]/div/div[2]/form/button
