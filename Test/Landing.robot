*** Settings ***
Documentation    This is Landing file for money control
Library    SeleniumLibrary
Library    String
Library    ExcelLibrary
Library     Collections
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
        ${share_value}  get text    (${index_value})[${index_row}]
        ${share_chng}  get text    (${index_prct_chng})[${index_row}]
        @{split}    split string    ${share_chng}
        ${index_row}    evaluate    ${index_row}+1
        #TODO   header to be added & set global variable    &  get excel out of the loop
        append to list      ${share_list}   ${share_name}   ${share_value}  ${split}[0]     ${split}[1]
        open excel document     Input/chart.xlsx      useTempDir=False
        write excel row    row_num=${index_row}     row_data=${share_list}   col_offset=0
        save excel document     Input/chart.xlsx
        close all excel documents
        remove from list    ${share_list}   3
        remove from list    ${share_list}   2
        remove from list    ${share_list}   1
        remove from list    ${share_list}   0

    END
    close all browsers