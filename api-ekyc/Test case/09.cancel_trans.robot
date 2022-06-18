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
    [Arguments]     ${tran_id}
    ${response}=       PUT On Session     alias=${ALIAS}   
    ...         url=/v1/transactions/${tran_id}/cancel          headers=&{HEADER_CANCEL_TRANS}
    Log                 ${response.json()["status"]["code"]}          
    Log                 ${response.json()["status"]["message"]}            



***Test Cases***
Start Cancel Transaction
    Input_Unlock_user         EU2021031700007
