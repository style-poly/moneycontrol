*** Settings ***
Documentation    This is input file for money control
Library    SeleniumLibrary
#https://www.moneycontrol.com/stocks/marketstats/top100.php
*** Variables ***
${Website}=     https://www.moneycontrol.com/stocks/marketstats/top100.php
${top100_col1}=   xpath=//tr/*[contains(text(), 'Index')]
${top100_col2}=   xpath=//*[contains(text(), 'Current Value')]
${top100_col3}=   //*[contains(text(), 'Change ')]
${index_name}=      //table[@class="tbl_brdmt glb_th"]//tr//td/a
${index_value}=     //table[@class="tbl_brdmt glb_th"]//tr//td/b
${index_prct_chng}=
@{columnhead}=  Index   'Current Value'   Change

@{row_val} =    ${index_name}   ${index_value}