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