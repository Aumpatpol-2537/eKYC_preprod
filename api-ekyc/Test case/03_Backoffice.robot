***Settings***
Library         RequestsLibrary
Library             Collections
Resource       ../keywords/Get_term_and_conditionAPI_page.robot
Resource       ../keywords/validate_customer_API_page.robot
Resource       ../keywords/Get_Consent_API_page.robot
Resource       ../keywords/sent_SMS(OTP)API_page.robot
Resource       ../keywords/verify_OTP_API_page.robot
Resource       ../keywords/Check_DOPA_API_page.robot
Resource       ../keywords/Validate_imageAPI_page.robot
# Suite Setup         Create Session    alias=${ALIAS}    url=${URL_CORE_SERVICE}

***Variables***
@{LIST_DATA}            ABC     EDF     EEE     XXX     ZZZ


***Keywords***
Set_row
    ${sum_row}      Set Variable           1

    FOR     ${data}         IN          @{LIST_DATA}
            # Log to console     ${data}

            ${sum_row}        Evaluate        ${sum_row} + 1  
            Log to console      ${sum_row}
    END

***Test Cases***
DEMO_excel
    Set_row