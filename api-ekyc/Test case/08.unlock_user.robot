***Settings***
Library         RequestsLibrary
Resource       ../keywords/Get_term_and_conditionAPI_page.robot
Resource       ../keywords/validate_customer_API_page.robot
Resource       ../keywords/Get_Consent_API_page.robot
Resource       ../keywords/sent_SMS(OTP)API_page.robot
Resource       ../keywords/verify_OTP_API_page.robot
Resource       ../keywords/Check_DOPA_API_page.robot
Resource       ../keywords/Validate_imageAPI_page.robot
Suite Setup         Create Session      alias=${ALIAS}      url=${URL_CORE_SERVICE}

   

***Keywords***
Input_Unlock_user
    [Arguments]     ${CID}
    ${response}=       PUT On Session     alias=${ALIAS}   
    ...         url=v1/customers/${CID}/unlock          headers=&{HEADER_UNLOCK}
    Log                 ${response.json()["status"]["code"]}          
    Log                 ${response.json()["status"]["message"]}            
    Log         ${response}
    Log         ${CID}


***Test Cases***
Start unlock customer
    Input_Unlock_user         1223456789123
