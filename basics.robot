*** Settings ***
Library     String
Library     Dialogs
Library     Collections


*** Variables ***
${one}      donald
${two}      trump
${list}     1    2    3    4


*** Test Cases ***
check var
    ${three}    Set Variable    donald trump
    Should Be Equal    ${one} ${two}    ${three}

get variable from user
    ${user}    Get Value From User    please input value
    Should Be Equal    ${user}    Hello World

get value from list
    ${number}    Set Variable    ${list}[0]
    Should Be Equal    ${number}    1

length of list
    ${length}=    Get Length    ${list}
    ${expected}=    Convert To Integer    4
    Should Be Equal    ${length}    ${expected}
