*** Settings ***
Documentation    This is Landing file for money control
Library    SeleniumLibrary
Library    String
Library    ExcelLibrary
Resource    ../Input/variable_list.robot

*** Test Cases ***
TC01
    Test2
*** Keywords ***
Test2
    open browser    about:blank     chrome
    maximize browser window
    go to      https://www.moneycontrol.com/stocks/marketstats/top100.php
    scroll element into view    xpath= //h2[text()='FII DII Trading Activity']
    ${count}    get element count   ${index_value}
    ${count}    evaluate     ${count}+1

    FOR     ${index_row}    IN RANGE    1   ${count}
        #to print the data for the share names
        ${share_name}  get element attribute   (${index_name})[${index_row}]    text
        open excel document     Input/chart.xlsx      useTempDir=False
        write excel cell    row_num=${index_row}   col_num=1   value=${share_name}
        save excel document     Input/chart.xlsx
#        close all excel documents
    END
    FOR     ${index_ro}    IN RANGE    1   ${count}
        ${share_value}  get element attribute   (${index_value})[${index_ro}]  label
        open excel document     Input/chart.xlsx      useTempDir=False
        write excel cell    row_num=${index_row}   col_num=2   value=${share_value}
        save excel document     Input/chart.xlsx
        close all excel documents
    END
    close all browsers
#ToDo         Get Green_class and use string library to seperate the nums