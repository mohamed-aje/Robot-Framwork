*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem


*** Variables ***
${OriginalScreenShot}       C:/Users/moham/OneDrive/Documents/VisualTesting/Original/
${TestScreenShot}           C:/Users/moham/OneDrive/Documents/VisualTesting/TestShot/
${Diffrence}                C:/Users/moham/OneDrive/Documents/VisualTesting/Difference/
${Fontcolor}                rgb(41, 41, 58)
${Font}                     SZSansDigital, Neue Helvetica, Helvetica, sans-serif
${BackgroungColor}          rgb(3, 164, 145)


*** Test Cases ***
image Testing
    Open Browser    https://www.sueddeutsche.de/
    Set screenshot directory    ${TestScreenShot}
    Empty directory    ${TestScreenShot}
    Capture element screenshot
    ...    css:html body.homepage header#szde.sz-header div.sz-header-logo h1#header-logo-img.product-title.sz-header-logo--desktop a.product-link svg g path
    ${difference}=    Run and return rc and output
    ...    magick ${OriginalScreenShot}Original_element.png ${TestscreenShot}selenium-element-screenshot-1.png -metric RMSE -compare -format "%[distortion]" info:
    ${difference}=    Set variable    ${difference}[1]
    IF    ${difference}>0
        run
        ...    magick ${OriginalScreenShot}Original_element.png ${TestScreenShot}selenium-element-screenshot-1.png -metric RMSE -compare ${Diffrence}difference.png
    END

colour Testing
    ${count}=    Get element count    xpath:/html/body/div[3]/main/section[3]/ul/li[*]/div
    ${atname}=    Set variable    color
    FOR    ${INDEX}    IN RANGE    1    ${count}+1
        ${element}=    Get webelement    xpath:/html/body/div[3]/main/section[3]/ul/li[${INDEX}]/div
        ${prop_val}=    Call method    ${element}    value_of_css_property    ${atname}
        Should be equal    ${prop_val}    ${fontcolor}
    END

font Testing
    ${count}=    Get element count    xpath:/html/body/div[3]/main/section[3]/ul/li[*]/div
    ${atname}=    Set variable    font-family
    FOR    ${INDEX}    IN RANGE    1    ${count}+1
        ${element}=    Get webelement    xpath:/html/body/div[3]/main/section[3]/ul/li[${INDEX}]/div
        ${prop_val}=    Call method    ${element}    value_of_css_property    ${atname}
        Should be equal    ${prop_val}    ${font}
    END
