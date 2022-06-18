*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             JSONLibrary
Resource            ../keywords/Get_data_excel.robot

*** Keywords ***
Check_Last_Version
    [Arguments]             ${row_cid_for_Check}
    Get_data_excel.Get_cid_excel        ${row_cid_for_Check}          check_eligible            ##Get cid จา excel###

    Set To Dictionary       ${HEADER_API_INTEGRATE_MOBILE}      partner-secret=${GET_PARTNER_SECRET}

    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE} 
    ${response}=       GET On Session         alias=${ALIAS}          url=/tcrb-platform-apipartner/v1/customer/kyc_status?cid=${GET_CID}&ial=2.3      headers=&{HEADER_API_INTEGRATE_MOBILE}            expected_status=anything
    Log to console                   ${response.json()["status"]["code"]}  
    Set global variable              ${RESPONSE_CODE}                 ${response.json()["status"]["code"]}             
    Set global variable              ${RESPONSE_MESSAGE}              ${response.json()["status"]["message"]}             
    Set global variable              ${RESPONSE_REMARK}               ${response.json()["status"]["remark"]}   
    Set global variable              ${RESPONSE_CONSENTVERSION}       ${response.json()["data"]["consent_onetrust_version"]}   
    Set global variable              ${RESPONSE_API}                  ${response.content}

Get_Last_QR
    [Arguments]                         ${row_cid_for_Check}
    Get_data_excel.Get_cid_excel        ${row_cid_for_Check}          Get_last_QR           ##Get cid จา excel###

    Set To Dictionary       ${HEADER_API_INTEGRATE_MOBILE}      partner-secret=${GET_PARTNER_SECRET}
    # Set To Dictionary       ${HEADER_API_INTEGRATE_MOBILE}      x-apigw-api-id=ewxwnjcssh

    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE} 
    ${response}=       GET On Session        alias=${ALIAS}          url=/tcrb-platform-apipartner/v1/customer/last_qr?cid=${GET_CID}      headers=&{HEADER_API_INTEGRATE_MOBILE}       expected_status=anything
    Set global variable             ${RESPONSE_CODE}                ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}             ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}              ${response.json()["status"]["remark"]}   
    Set global variable             ${RESPONSE_API}                 ${response.content}
    ${qr_string}                    Convert JSON To String	        ${response.json()["data"]} 
    Set global variable             ${RESULT_QR}                    ${qr_string}


Get_Last_Transaction 
    [Arguments]             ${row_cid_for_Check}

    Get_data_excel.Get_cid_excel        ${row_cid_for_Check}          Get_last_transaction_status         ##Get cid จา excel###

    Set To Dictionary       ${HEADER_API_INTEGRATE_MOBILE}      partner-secret=${GET_PARTNER_SECRET}

    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE} 
    ${response}=       GET On Session        alias=${ALIAS}          url=/tcrb-platform-apipartner/v1/customer/last_transaction?cid=${GET_CID}      headers=&{HEADER_API_INTEGRATE_MOBILE}       expected_status=anything

    Set global variable             ${RESPONSE_CODE}                        ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                     ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                      ${response.json()["status"]["remark"]}   
    Set global variable             ${RESPONSE_API}                         ${response.content}

    Set global variable              ${RESULT_KYCTRANS_ID}                  ${response.json()["data"]["kyc_transaction"]}            
    Set global variable              ${RESULT_TRAN_STATUS}                  ${response.json()["data"]["transaction_status"]}            
    Set global variable              ${RESULT_STATE}                        ${response.json()["data"]["state"]}            
    Set global variable              ${RESULT_CHANNEL}                      ${response.json()["data"]["channel"]}            
    Set global variable              ${RESULT_ENTITY}                       ${response.json()["data"]["entity"]}            
    Set global variable              ${RESULT_REQ_TYPE}                     ${response.json()["data"]["request_type"]}            
    Set global variable              ${RESULT_IAL}                          ${response.json()["data"]["ial"]}            
    Set global variable              ${RESULT_KYC_EXPIRE}                   ${response.json()["data"]["kyc_expired_date"]}            
    Set global variable              ${RESULT_CREATE_DATE}                  ${response.json()["data"]["create_date"]}            
    Set global variable              ${RESULT_CREATE_BY}                    ${response.json()["data"]["create_by"]}            
    Set global variable              ${RESULT_UPDATE_DATE}                  ${response.json()["data"]["update_date"]}            
    Set global variable              ${RESULT_UPDATE_BY}                    ${response.json()["data"]["update_by"]}            

