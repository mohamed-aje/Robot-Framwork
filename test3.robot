*** Settings ***
Library     Collections


*** Variables ***
@{list}     1    2    3    4
@{names}    Donald    Mickey    Goofy    Daisy    Scrooge


*** Test Cases ***
Check value from list
    ${number}=    set variable    ${list}[2]
    should be equal    ${number}    3

Add value to the list
    ${addition}=    set variable    333
    Append to list    ${list}    ${addition}
    should be equal    ${list}[4]

List lenght
    ${length}=    get length    ${list}
    ${expected}=    convert to integer    4
    Should be equal    ${length}    ${expected}
    ${new}=    set variable    ${list}[4]

Sort list in alphabetical order
    Sort list    ${names}
    Should be equal    ${names}[0]    Daisy

Remove name from list
    Remove from list    ${names}    0
    Should be equal    ${names}[0]    Mickey

Loop through the number
    FOR    ${INDEX}    IN RANGE    1    10
        ${new}=    set variable    ${INDEX}
    END

Loop through the lise
    FOR    ${ITEM}    IN    ${names}
        ${new}=    set variable    ${ITEM}
    END
