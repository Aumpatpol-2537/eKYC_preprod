*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource    ../Varriable/varriable.robot
Resource    ../keywords/Validate_customer_API_page.robot


# Suite Setup         Create Session    alias=${ALIAS}    url=${URI_IMAGE_SERVICE} 

*** Keywords ***
Face_Rec_fail 
    Set To Dictionary       ${HEADER_VALIDATE_IMAGE}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_VALIDATE_IMAGE}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}


    Create_File_Keep_Text_Facial                            {"image_source":"${FACEREC_FAIL}","kyc_trans_id" : "${TRANS_ID}"}  
    Encrypt_page.Encrypt_Function_with_long_Text            keep_facial_body.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}

    ${resp}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    Request Should Be Successful    response=${resp}
    
    Set global variable             ${RESPONSE_ENCRYPT_TYPE}         ${resp.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	     Get Value From Json	              ${convert_result}	    $..remark
	Set global variable              ${MESS_STATUS}                       ${values_code[0]}

    ${values_code}          	     Get Value From Json	              ${convert_result}	    $..message
	Set global variable              ${FR_RETURN_MESSAGE_FAIL}            ${values_code[0]}

    ${values_code}          	     Get Value From Json	              ${convert_result}	    $..message
	Set global variable              ${LN_FR_RESPONE_MESSAGE}             ${values_code[0]}

    
    # Should Be Equal As Integers     ${resp.json()["status"]["code"]}              ${RESPONSE_CODE_FACE_MATCH_FAILED}   
    # Should Be Equal                 ${resp.json()["status"]["message"]}           ${RESPONSE_MESSAGE_2011}
    # Log         ${resp.json()["status"]["message"]}
    # Set global variable             ${MESS_STATUS}                               ${resp.json()["status"]["remark"]}
    # Set global variable             ${FR_RETURN_MESSAGE_FAIL}                    ${resp.json()["status"]["message"]}
    # Set global variable             ${LN_FR_RESPONE_MESSAGE}                    ${resp.json()["status"]["message"]}

    # Log         ${resp.json()["status"]["remark"]}

Face_Rec_fail_2  
    Set To Dictionary       ${HEADER_VALIDATE_IMAGE}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_VALIDATE_IMAGE}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    ${body}=        To Json      {"image_source":"${FR_LOW_SCORE}","kyc_trans_id" : "${TRANS_ID}"}  
    ${resp}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    Request Should Be Successful    response=${resp}
    Should Be Equal As Integers     ${resp.json()["status"]["code"]}              ${RESPONSE_CODE_FACE_MATCH_FAILED}   
    Should Be Equal                 ${resp.json()["status"]["message"]}           ${RESPONSE_MESSAGE_2011}
    Set global variable             ${MESS_STATUS}                               ${resp.json()["status"]["remark"]}
    Set global variable             ${FR_RETURN_MESSAGE_FAIL_2}                    ${resp.json()["status"]["message"]}
    Log         ${resp.json()["status"]["remark"]}

Face_Rec_fail_3  
    Set To Dictionary       ${HEADER_VALIDATE_IMAGE}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_VALIDATE_IMAGE}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    ${body}=        To Json      {"image_source":"${FR_LOW_SCORE}","kyc_trans_id" : "${TRANS_ID}"}  
    ${resp}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    Request Should Be Successful    response=${resp}
    Should Be Equal As Integers     ${resp.json()["status"]["code"]}                ${RESPONSE_CODE_FACE_MATCH_FAILED}   
    Should Be Equal                 ${resp.json()["status"]["message"]}             ${RESPONSE_MESSAGE_2011}
    Set global variable             ${MESS_STATUS}                                  ${resp.json()["status"]["remark"]}
    Set global variable             ${FR_RETURN_MESSAGE_FAIL_3}                     ${resp.json()["status"]["message"]}
    Log         ${resp.json()["status"]["remark"]}

Face_Rec_fail_3time  
    Set To Dictionary       ${HEADER_VALIDATE_IMAGE}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_VALIDATE_IMAGE}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    FOR  ${FR_Detect_failed}  IN         {"image_source":"low_score","kyc_trans_id" : "${TRANS_ID}"}     
    ...                                  {"image_source":"low_score","kyc_trans_id" : "${TRANS_ID}"}
    ...                                  {"image_source":"low_score","kyc_trans_id" : "${TRANS_ID}"}
    ...                                  {"image_source":"low_score","kyc_trans_id" : "${TRANS_ID}"}  
    ${body}=     To Json     ${FR_Detect_failed} 
    ${resp}=    POST On Session          alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    Request Should Be Successful         response=${resp}
    # Should Be Equal As Integers     ${resp.json()["status"]["code"]}             ${RESPONSE_CODE_REQUEST_TIMEOUT}
    # Should Be Equal                 ${resp.json()["status"]["message"]}          ${RESPONSE_MESSAGE_1004}
    Set global variable               ${RESULT_CODE}         ${resp.json()["status"]["code"]}
    Set global variable              ${RESULT_MESSAGE}          ${resp.json()["status"]["message"]}      
    Run Keyword If          '${RESULT_FACE_REC}' == '2011'        Return_Error_Face_Match_Failed
        ...      ELSE IF    '${RESULT_FACE_REC}' == '2010'        Return_Error_Face_Match_reached_maximum
        ...      ELSE IF    '${RESULT_FACE_REC}' == '2005'        Return_Error_Trans_Fail
    END

Face_Rec_Timeout
    Set To Dictionary       ${HEADER_VALIDATE_IMAGE}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_VALIDATE_IMAGE}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}
    ${body}=        To Json              {"image_source":"facetimeout","kyc_trans_id" : "${TRANS_ID}"}     
    ${resp}=     POST On Session         alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    Request Should Be Successful        response=${resp}
    Should Be Equal As Integers         ${resp.json()["status"]["code"]}            ${RESPONSE_CODE_REQUEST_TIMEOUT}
    Should Be Equal                     ${resp.json()["status"]["message"]}         ${RESPONSE_MESSAGE_1004}
    Set global variable                 ${FR_RETURN_TIMEOUT}                ${resp.json()["status"]["message"]} 

Face_Rec_Timeout_2
    Set To Dictionary       ${HEADER_VALIDATE_IMAGE}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_VALIDATE_IMAGE}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}
    ${body}=        To Json              {"image_source":"facetimeout","kyc_trans_id" : "${TRANS_ID}"}     
    ${resp}=     POST On Session         alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    Request Should Be Successful        response=${resp}
    Should Be Equal As Integers         ${resp.json()["status"]["code"]}            ${RESPONSE_CODE_REQUEST_TIMEOUT}
    Should Be Equal                     ${resp.json()["status"]["message"]}         ${RESPONSE_MESSAGE_1004}
    Set global variable                 ${FR_RETURN_TIMEOUT_2}                ${resp.json()["status"]["message"]} 

Face_Rec_Timeout_3
    Set To Dictionary       ${HEADER_VALIDATE_IMAGE}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_VALIDATE_IMAGE}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    ${body}=        To Json              {"image_source":"facetimeout","kyc_trans_id" : "${TRANS_ID}"}     
    ${resp}=     POST On Session         alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    Request Should Be Successful        response=${resp}
    Should Be Equal As Integers         ${resp.json()["status"]["code"]}            ${RESPONSE_CODE_REQUEST_TIMEOUT}
    Should Be Equal                     ${resp.json()["status"]["message"]}         ${RESPONSE_MESSAGE_1004}
    Set global variable                 ${FR_RETURN_TIMEOUT_3}                ${resp.json()["status"]["message"]} 

Face_Rec_Timeout3times
    Set To Dictionary       ${HEADER_VALIDATE_IMAGE}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_VALIDATE_IMAGE}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    FOR  ${FR_TimeOut}  IN       {"image_source":"facetimeout","kyc_trans_id" : "${TRANS_ID}"}     
    ...                          {"image_source":"facetimeout","kyc_trans_id" : "${TRANS_ID}"}
    ...                          {"image_source":"facetimeout","kyc_trans_id" : "${TRANS_ID}"}
    ...                          {"image_source":"facetimeout","kyc_trans_id" : "${TRANS_ID}"}
    ${body}=     To Json   ${FR_TimeOut} 
    ${resp}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    Request Should Be Successful    response=${resp}
    # Set global variable              ${RESULT_FACE_REC}             ${resp.json()["status"]["code"]}
    # Set global variable              ${RESULT_MESSAGE}          ${resp.json()["status"]["message"]}      
    # Run Keyword If          '${RESULT_FACE_REC}' == '1004'        Return_Error_FR_Request_Timeout
    #     ...      ELSE IF    '${RESULT_FACE_REC}' == '2010'        Return_Error_Face_Match_reached_maximum
    #     ...      ELSE IF    '${RESULT_FACE_REC}' == '2005'        Return_Error_Trans_Fail
    END

Face_Rec_reached_max
    Set To Dictionary       ${HEADER_VALIDATE_IMAGE}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_VALIDATE_IMAGE}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    ${body}=        To Json      {"image_source":"success","kyc_trans_id" : "${TRANS_ID}"} 
    ${resp}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    Request Should Be Successful    response=${resp}
    Should Be Equal As Integers     ${resp.json()["status"]["code"]}              ${RESPONSE_CODE_FACE_MATCH_REACHED_MAX_TIME}   
    # Should Be Equal                 ${resp.json()["status"]["message"]}           ${RESPONSE_MESSAGE_2010}
    Set global variable             ${MESS_STATUS}                                  ${resp.json()["status"]["message"]} 
    Log             ${resp.json()["status"]["code"]}

    Set global variable             ${LN_FR_RESPONE_MESSAGE}                     ${resp.json()["status"]["message"]}

Return_Error_FR_Request_Timeout
    Log         Return_Error_FR_Request_Timeout
    Should Be Equal As Integers     ${RESULT_FACE_REC}              ${RESPONSE_CODE_REQUEST_TIMEOUT}    
    Should Be Equal                 ${RESULT_MESSAGE}               ${RESPONSE_MESSAGE_1004}

Return_Error_Face_Match_reached_maximum
    Log         Return_Error_Face_Match_reached_maximum
    Should Be Equal As Integers     ${RESULT_FACE_REC}              ${RESPONSE_CODE_FACE_MATCH_REACHED_MAX_TIME}     
    Should Be Equal                 ${RESULT_MESSAGE}               ${RESPONSE_MESSAGE_2010}

Return_Error_Face_Match_Failed
    Log         Return_Error_Face_Match_Failed
    Should Be Equal As Integers     ${RESULT_FACE_REC}              ${RESPONSE_CODE_FACE_MATCH_FAILED}    
    Should Be Equal                 ${RESULT_MESSAGE}               ${RESPONSE_MESSAGE_2011}

Return_Error_Trans_Fail
    Log         Return_Error_Trans_Fail
    Should Be Equal As Integers     ${RESULT_FACE_REC}              $${RESPONSE_CODE_TRANS_CAN_NOT_PROCESSED}     
    # Should Be Equal                 ${RESULT_MESSAGE}               ${RESPONSE_MESSAGE_2009}
