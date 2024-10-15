*** Settings ***
Library    ExcelLibrary
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${path_excel}   C:\\Users\\James\\Desktop\\python\\DNE\\sn.xlsx

*** Test Cases ***
Test1
    Test the ExcelData

*** Keywords ***

Test the ExcelData
    ${my_data_as_list_a}=    Create List
    ${my_data_as_list_b}=    Create List
    #open the Excel  ${path_excel}
    open excel document   ${path_excel}    login    
    #from row 1+1 to end col
    FOR  ${i}  IN RANGE    1    108
        ${rownum}=    Set Variable    ${${i} + ${1}}
        ${my_data_cola}=  Read Excel Cell  row_num=${rownum}  col_num=1
        ${my_data_colb}=  Read Excel Cell  row_num=${rownum}  col_num=2
        Append To List    ${my_data_as_list_a}      ${my_data_cola}
        Append To List    ${my_data_as_list_b}      ${my_data_colb}
    END
    #total length should be == end row number of excel -1
    ${lena}=    Get Length    ${my_data_as_list_a}
    ${lenb}=    Get Length    ${my_data_as_list_b}
    Log To Console    \n
    Log To Console    ${my_data_as_list_a}
    Log To Console    \n
    Log To Console    ${my_data_as_list_b}
    Log To Console    Total length of list A: ${lena}
    Log To Console    Total length of list B: ${lenb}
    
    