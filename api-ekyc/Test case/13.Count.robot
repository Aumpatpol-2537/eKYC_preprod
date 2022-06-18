***Settings***
Library         BuiltIn
Library         Collections
Library         String

***Variables***
${COUNT1}               1
${COUNT2}               1
@{LIST}                 1

*** Keywords ***
DEMO
    ${ln}       Create List	        aaa         bbb
    ${fr}       Create List	        pass
    ${ln_length}        Get Length      ${ln}
    ${cal}      Evaluate       ${ln_length} + 1


ADD VALUE
    [Arguments]         @{add_value}
    @{test}             Create List        1   2   3
    Append To List	    ${test}         @{add_value}
    Log to console     ${test}

Sub String Demo
    ${data}     Get Substring	        1234567     1       3
    Log to console          ${data}


Backoffice
    ${total_row}        Evaluate        2 + 2      #คำนวนจำนวน row ทั้งหมด
    Log to console      ${total_row}

    FOR     ${row}        IN RANGE        1       ${total_row}  
        Log to console     ${row}   #save to excel  ตามบรรทัด
    END


*** Test Cases ***
test1
    Backoffice
