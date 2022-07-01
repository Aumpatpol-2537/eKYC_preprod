*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ../Varriable/varriable.robot
Resource            ../keywords/Validate_customer_API_page.robot
Resource            ../Keywords/Encrypt_page.robot
Resource            ../Keywords/Get_status_error.robot

*** Keywords ***
Liveness_and_FR_Pass
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    # Create_File_Keep_Text_Facial                            {"image_source":"aaaaaaa","kyc_trans_id":"${TRANS_ID}"}

    Create_File_Keep_Text_Facial                            {"image_source":"${IMG_SOURCE}","kyc_trans_id":"${TRANS_ID}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_facial_body.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${resp}=        POST On Session      alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}        expected_status=anything
    Log             ${resp.status_code}
    Run keyword if       '${resp.status_code}' != '200'         Save_error_When_its_active          FACIAL              


    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${resp.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..code
	# Set global variable             ${DOPA_RESPONSE_CODE}             ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..message
	Set global variable              ${MESS_STATUS}                  ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..message
	Set global variable              ${LN_FR_RESPONE_MESSAGE}         ${values_code[0]}
    

    # Set global variable             ${MESS_STATUS}                               ${resp.json()["status"]["message"]}
    # Set global variable             ${LN_FR_RESPONE_MESSAGE}                     ${resp.json()["status"]["message"]}

Liveness_fail
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    Create_File_Keep_Text_Facial                 {"image_source":"${IMG_NOT_MATCH}","kyc_trans_id" : "${TRANS_ID}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_facial_body.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${resp}=    POST On Session    alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}     expected_status=anything 
    # Request Should Be Successful    response=${resp}

    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${resp.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	                                ${convert_result}	    $..code
	Set global variable             ${RESPONSE_CODE_LIVENESS_DETECT_FAILED}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	                   ${convert_result}	                 $..message
	Set global variable             ${LN_RETURN_MESSAGE_FAILS}             ${values_code[0]}


Liveness_fail_2
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    Create_File_Keep_Text                 {"image_source":"${IMG_NOT_MATCH}","kyc_trans_id" : "${TRANS_ID}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_facial_body.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${resp}=    POST On Session    alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}

    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${resp.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	                                ${convert_result}	    $..code
	Set global variable             ${RESPONSE_CODE_LIVENESS_DETECT_FAILED}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	                   ${convert_result}	                 $..message
	Set global variable             ${LN_RETURN_MESSAGE_FAILS_2}             ${values_code[0]}

Liveness_fail_3
    ${body}=        To Json         {"image_source":"${LN_LOW_SCORE}","kyc_trans_id" : "${TRANS_ID}"}     
    ${resp}=    POST On Session    alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful    response=${resp}
    Should Be Equal As Integers     ${resp.json()["status"]["code"]}             ${RESPONSE_CODE_LIVENESS_DETECT_FAILED}
    Should Be Equal                 ${resp.json()["status"]["message"]}          ${RESPONSE_MESSAGE_2009}
    Set Global Variable            ${LN_RETURN_MESSAGE_FAILS_3}                           ${resp.json()["status"]["message"]}
    # Should Be Equal    ${resp.json()["data"]["liveness_score"]}                  ${RESPONSE_LIVENESS_SCORE}

Liveness_fail_3times
    Liveness_fail
    Liveness_fail
    Liveness_fail
    # Run Keyword If          '${RESULT_LIVENESS}' == '2009'        Return_Error_Liveness_Detect_Failed
    #     ...      ELSE IF    '${RESULT_LIVENESS}' == '2008'        Return_Error_Liveness_reached_maximum
    #     ...      ELSE IF    '${RESULT_LIVENESS}' == '2005'        Return_Error_Trans_Fail
 
    # END

Liveness_Timeout
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    ${body}=        To Json              {"image_source":"livenesstimeout","kyc_trans_id" : "${TRANS_ID}"}     
    ${resp}=     POST On Session        alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful        response=${resp}
    Should Be Equal As Integers         ${resp.json()["status"]["code"]}            ${RESPONSE_CODE_REQUEST_TIMEOUT}
    Should Be Equal                     ${resp.json()["status"]["message"]}         ${RESPONSE_MESSAGE_1004}
    Set global variable                 ${LN_RETURN_MESSAGE_TIME_OUT}               ${resp.json()["status"]["message"]}


Liveness_Timeout_2
    ${body}=        To Json              {"image_source":"livenesstimeout","kyc_trans_id" : "${TRANS_ID}"}     
    ${resp}=     POST On Session        alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful        response=${resp}
    Should Be Equal As Integers         ${resp.json()["status"]["code"]}            ${RESPONSE_CODE_REQUEST_TIMEOUT}
    Should Be Equal                     ${resp.json()["status"]["message"]}         ${RESPONSE_MESSAGE_1004}
    Set global variable                 ${LN_RETURN_MESSAGE_TIME_OUT_2}               ${resp.json()["status"]["message"]}

Liveness_Timeout_3
    ${body}=        To Json              {"image_source":"livenesstimeout","kyc_trans_id" : "${TRANS_ID}"}     
    ${resp}=     POST On Session        alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful        response=${resp}
    Should Be Equal As Integers         ${resp.json()["status"]["code"]}            ${RESPONSE_CODE_REQUEST_TIMEOUT}
    Should Be Equal                     ${resp.json()["status"]["message"]}         ${RESPONSE_MESSAGE_1004}
    Set global variable                 ${LN_RETURN_MESSAGE_TIME_OUT_3}               ${resp.json()["status"]["message"]}


Liveness_Timeout3times
    # FOR  ${Liveness_TimeOut}  IN    {"image_source":"livenesstimeout","kyc_trans_id" : "${TRANS_ID}"}     
    # ...                          {"image_source":"livenesstimeout","kyc_trans_id" : "${TRANS_ID}"}
    # ...                          {"image_source":"livenesstimeout","kyc_trans_id" : "${TRANS_ID}"}
    # ...                          {"image_source":"livenesstimeout","kyc_trans_id" : "${TRANS_ID}"}
    # ${body}=     To Json   ${Liveness_TimeOut} 
    # ${resp}=    POST On Session    alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    # Request Should Be Successful    response=${resp}
    # Set global variable              ${RESULT_LIVENESS}                                 ${resp.json()["status"]["code"]}
    # Set global variable              ${RESULT_MESSAGE}                                  ${resp.json()["status"]["message"]}  
    # Set global variable              ${LN_RETURN_MESSAGE_TIME_OUT_3_TIMES}              ${resp.json()["status"]["message"]}  
    # Set global variable              ${MESS_STATUS}                                     ${resp.json()["status"]["remark"]}
    Liveness_Timeout
    Liveness_Timeout
    Liveness_Timeout
    # Run Keyword If          '${RESULT_LIVENESS}' == '1004'        Return_Error_LN_Request_Timeout
    #     ...      ELSE IF    '${RESULT_LIVENESS}' == '2008'        Return_Error_Liveness_reached_maximum
    #     ...      ELSE IF    '${RESULT_LIVENESS}' == '2005'        Return_Error_Trans_Fail
    # END

LN_reached_max
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}


    Create_File_Keep_Text                 {"image_source":"${IMG_NOT_MATCH}","kyc_trans_id" : "${TRANS_ID}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_facial_body.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${resp}=    POST On Session    alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful    response=${resp}

    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${resp.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	                                ${convert_result}	    $..message
	Set global variable             ${MESS_STATUS}                                      ${values_code[0]}
    ${values_code}          	    Get Value From Json	                                ${convert_result}	    $..message
	Set global variable             ${RESULT_MESSAGE}                                   ${values_code[0]}
    ${values_code}          	    Get Value From Json	                                ${convert_result}	    $..message
	Set global variable             ${LN_FR_RESPONE_MESSAGE}                            ${values_code[0]}


    # Should Be Equal As Integers     ${resp.json()["status"]["code"]}             ${RESPONSE_CODE_LIVENESS_REACHED_MAX_TIME}   
    # Should Be Equal                 ${resp.json()["status"]["message"]}          ${RESPONSE_MESSAGE_2008}
    # Set global variable             ${MESS_STATUS}                               ${resp.json()["status"]["message"]}       
    # Set global variable             ${RESULT_MESSAGE}                               ${resp.json()["status"]["message"]} 
    # Set global variable             ${LN_FR_RESPONE_MESSAGE}                     ${resp.json()["status"]["message"]}

LN_timeOut_reached_max
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    ${body}=        To Json         {"image_source":"success","kyc_trans_id" : "${TRANS_ID}"}     
    ${resp}=    POST On Session    alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful    response=${resp}
    Should Be Equal As Integers     ${resp.json()["status"]["code"]}             2016 
    # Should Be Equal                 ${resp.json()["status"]["message"]}          ${RESPONSE_MESSAGE_2008}
    Set global variable             ${MESS_STATUS}                               ${resp.json()["status"]["message"]}       
    Set global variable             ${RESULT_MESSAGE}                               ${resp.json()["status"]["message"]} 
    Set global variable             ${LN_FR_RESPONE_MESSAGE}                     ${resp.json()["status"]["message"]}
    Log                             ${resp.json()["status"]["code"]}


Return_Error_LN_Request_Timeout
    Log         Return_Error_LN_Request_Timeout
    Should Be Equal As Integers     ${RESULT_LIVENESS}              ${RESPONSE_CODE_REQUEST_TIMEOUT}    
    Should Be Equal                 ${RESULT_MESSAGE}               ${RESPONSE_MESSAGE_1004}

Return_Error_Liveness_reached_maximum
    Log         Return_Error_Liveness_reached_maximum
    Should Be Equal As Integers     ${RESULT_LIVENESS}              ${RESPONSE_CODE_LIVENESS_REACHED_MAX_TIME}    
    Should Be Equal                 ${RESULT_MESSAGE}                  ${RESPONSE_MESSAGE_2008}

Return_Error_Liveness_Detect_Failed
    Log         Return_Error_Liveness_Detect_Failed
    Should Be Equal As Integers     ${RESULT_LIVENESS}              ${RESPONSE_CODE_LIVENESS_DETECT_FAILED}    
    Should Be Equal                 ${RESULT_MESSAGE}               ${RESPONSE_MESSAGE_2009}

Return_Error_Trans_Fail
    Log         Return_Error_Trans_Fail
    Should Be Equal As Integers     ${RESULT_LIVENESS}              $${RESPONSE_CODE_TRANS_CAN_NOT_PROCESSED}     
    # Should Be Equal                 ${MESS_STATUS}               ${RESPONSE_MESSAGE_2005}


Liveness_and_FR_Pass_BU_Journey
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    # Create_File_Keep_Text_Facial                            {"image_source":"aaaaaaa","kyc_trans_id":"${TRANS_ID}"}

    Create_File_Keep_Text_Facial                            {"image_source":"${${VAR_SELFIE}}","kyc_trans_id":"${TRANS_ID}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_facial_body.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${resp}=        POST On Session      alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_PLATFORM_KYC}    json=${body}        expected_status=anything
    Log             ${resp.status_code}

    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${resp.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
	Set global variable             ${RESPONSE_CODE}                  ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
	Set global variable             ${FACIAL_RESPONSE_CODE}           ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${RESPONSE_MESSAGE}               ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..remark
	Set global variable             ${RESPONSE_REMARK}                ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
	Set global variable             ${LAST_RESPONSE_CODE}             ${values_code[0]}

    Retry_if_facial_offline


Retry_if_facial_offline
    Run Keyword If          '${FACIAL_RESPONSE_CODE}' == '1004'                Liveness_and_FR_Pass_BU_Journey
