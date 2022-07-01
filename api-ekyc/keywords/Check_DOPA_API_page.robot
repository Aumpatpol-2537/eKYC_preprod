*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ../Varriable/varriable.robot
Resource            ../keywords/Get_data_excel.robot
Resource            ../Keywords/Encrypt_page.robot
Resource            ../Keywords/Get_status_error.robot

# Suite Setup         Create Session    alias=${ALIAS}    url=${URL_CORE_SERVICE}

*** Keywords ***
Check_DOPA
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    Create_File_Keep_Text                                   {"kyc_trans_id":"${TRANS_ID}","laser":"${GET_LASER_CODE}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        


    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_CHECK_DOPA}   headers=&{HEADER_PLATFORM_KYC}    json=${body}     expected_status=anything
    # Request Should Be Successful    response=${response}
    # Run keyword if       '${response.status_code}' != '200'         Save_error_When_its_active          DOPA              

    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..code
	Set global variable             ${DOPA_RESPONSE_CODE}             ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..message
	Set global variable              ${DOPA_MESSAGE}                  ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..remark
	Set global variable              ${DOPA_REMARK}                   ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..remark
	Set global variable             ${RESPONSE_REMARK}                ${values_code[0]}


    Retry_if_dopa_offline
    # Retry_if_dopa_offline
    # Retry_if_dopa_offline
    
Check_DOPA_Card_Not_Found_Laser_Code
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}
    ${body}=        To Json         {"kyc_trans_id": "${TRANS_ID}", "laser": "JT2095eeeeee"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_CHECK_DOPA}      headers=&{HEADER_PLATFORM_KYC}      json=${body}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}             ${RESPONSE_CODE_DOPA_FAIL} 
    Should Be Equal                 ${response.json()["status"]["message"]}          ${RESPONSE_MESSAGE_2006_2}
    # Should Be Equal                 ${response.json()["status"]["remark"]}           ${RESPONSE_REMARK_NULL}
    # Should Be Equal                 ${response.json()["data"]}
    # Should Be Equal                 ${response.json()["data"]["trans_id"]}           ${TRANS_ID}
    # Should Be Equal                 ${response.json()["data"]["dopa_status"]}        ${RESPONSE_DOPA_STATUS_CARD_NOT_FOUND_LASER_CODE}
    # Should Be Equal                 ${response.json()["data"]["dopa_message"]}       ${RESPONSE_DOPA_MESSAGE_CARD_NOT_FOUND_LASER_CODE}
    Set global variable     ${DOPA_MESSAGE}         ${response.json()["status"]["message"]}             
    Set global variable     ${DOPA_REMARK}         ${response.json()["status"]["remark"]}             

Check_DOPA_Fail
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}
    Create_File_Keep_Text                                   {"kyc_trans_id":"${TRANS_ID}","laser" : "XXXXXXXXXXXX"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        


    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_CHECK_DOPA}   headers=&{HEADER_PLATFORM_KYC}    json=${body}     expected_status=anything


Retry_if_dopa_offline
    Run Keyword If          '${DOPA_RESPONSE_CODE}' == '1004'                Check_DOPA
