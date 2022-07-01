*** Settings ***
Library         RequestsLibrary
Library         Collections
Resource        ../Varriable/varriable.robot
Resource        ../keywords/Sent_SMS(OTP)API_page.robot
# Suite Setup     Create Session    alias=${ALIAS}    url=${URL_CORE_SERVICE}
Resource            ../Keywords/Encrypt_page.robot


***Variables***
${VALUE_1}              111111
${VALUE_2}              222222
${VALUE_3}              333333
${VALUE_VALID}          999999


*** Keywords ***
Verify_OTP
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    Create_File_Keep_Text                                    {"kyc_trans_id":"${TRANS_ID}","otp_value":"${VALUE_OTP}","otp_ref":"${OTP_REF_NUMBER}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        
    ${body}=        To Json          {"data": "${RESULT_ENCRYPT_DATA}"}
    
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VERIFY_OTP}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful        response=${response}

    Set global variable            ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    # ${values_code}          	  Get Value From Json	              ${convert_result}	    $..code
	# Set global variable             ${RESPONSE_CODE}        ${values_code[0]}

    ${values_code}          	     Get Value From Json	              ${convert_result}	    $..message
	Set global variable              ${RESULT_OTP_STATUS}        ${values_code[0]}

    # ${values_code}          	  Get Value From Json	              ${convert_result}	    $..remark
	# Set global variable              ${SEND_OTP_REMARK}        ${values_code[0]}

    # Should Be Equal As Integers     ${response.json()["status"]["code"]}             ${RESPONSE_CODE_SUCCESS}   
    # Should Be Equal                 ${response.json()["status"]["message"]}          ${RESPONSE_MESSAGE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["remark"]}           ${RESPONSE_REMARK_NULL}
    # Should Be Equal                 ${response.json()["data"]["kyc_trans_id"]}           ${TRANS_ID}
    # Should Be Equal                 ${response.json()["data"]["verify_result"]}      ${RESPONSE_VERIFY_RESULT}
    # Log to console      ${response.json()["data"]["verify_result"]} 
    # Set Global Variable         ${RESULT_OTP_STATUS}        ${response.json()["status"]["message"]} 

Verify_OTP_Value_not_match
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    Create_File_Keep_Text                                    {"kyc_trans_id":"${TRANS_ID}","otp_value":"111111","otp_ref":"${OTP_REF_NUMBER}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        
    ${body}=        To Json          {"data": "${RESULT_ENCRYPT_DATA}"}

    # Encrypt_page.Encrypt_Function        {\\"kyc_trans_id\\":\\"${TRANS_ID}\\",\\"otp_value\\":\\"111111\\",\\"otp_ref\\":\\"${OTP_REF_NUMBER}\\"}
    ${body}=        To Json          {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VERIFY_OTP}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    # Request Should Be Successful    response=${response}

    Set global variable            ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	     Get Value From Json	              ${convert_result}	    $..message
	Set global variable              ${RESULT_OTP_STATUS}                 ${values_code[0]}

    # Should Be Equal                 ${response.json()["data"]["kyc_trans_id"]}           ${TRANS_ID}
    # Should Be Equal                 ${response.json()["data"]["verify_result"]}      ${RESPONSE_VERIFY_RESULT}
    # Log to console      ${response.json()["data"]["verify_result"]} 
    # Set Global Variable         ${RESULT_OTP_STATUS}        ${response.json()["status"]["message"]} 

Verify_OTP_Error2_times
		Verify_OTP_Value_not_match
		Verify_OTP_Value_not_match

Verify_OTP_Error3_times
		Verify_OTP_Value_not_match
		Verify_OTP_Value_not_match
		Verify_OTP_Value_not_match
		Verify_OTP_Value_not_match
        
Verify_OTP_Done_2_0f_3
		Verify_OTP_Value_not_match
		Verify_OTP_Value_not_match

Verify_OTP_Done_3_0f_3
		Verify_OTP_Value_not_match
		Verify_OTP_Value_not_match
		Verify_OTP_API_page.Verify_OTP


Return_Error_OTP_trial_reached_maximum_times
    Log         Error_OTP_trial_reached_maximum_times
    Should Be Equal As Integers     ${RESULT_VERIFY}                ${RESPONSE_CODE_OTP_TRAL_MAX_TIME}   
    Should Be Equal                 ${RESULT_MESSAGE}               ${RESPONSE_MESSAGE_2002}

Return_Error_OTP_value_not_match
    Log         Error_OTP_value_not_match
    Should Be Equal As Integers     ${RESULT_VERIFY}                ${RESPONSE_CODE_OTP_NOT_MATCH}   
    Should Be Equal                 ${RESULT_MESSAGE}               ${RESPONSE_MESSAGE_2001}
