***Settings***
Library         Process
Library         RequestsLibrary
Library         BuiltIn
Library         JSONLibrary
Library         OperatingSystem
Library         String
Library         DateTime


***Keywords***
Get_Time
    ${date} =	Get Current Date
    Set global variable         ${DATE_TIME}             ${date}

Save_error_When_its_active
    [Arguments]         ${error_step}
    Get_Time
    Append To File         saveLogError.txt          \n${error_step}_${DATE_TIME}
