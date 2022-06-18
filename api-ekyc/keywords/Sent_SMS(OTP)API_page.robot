*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         BuiltIn
Library         String
Resource        ../Keywords/Encrypt_page.robot

Resource        ..//Varriable/varriable.robot
Resource        ../keywords/Validate_customer_API_page.robot
# Suite Setup     Create Session    alias=${ALIAS}    url=${URL_CORE_SERVICE}

*** Keywords ***

Sent_OTP
    Set To Dictionary       ${HEADER_OTP}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_OTP}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 

    Create_File_Keep_Text                                   {"kyc_trans_id":"${TRANS_ID}","language":"TH","mobile_no":"${MOBILE_NO}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    &{body}=      Create dictionary        data=${RESULT_ENCRYPT_DATA}

    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_SEND_OTP}    headers=&{HEADER_OTP}    json=${body}
    Request Should Be Successful        response=${response}
    # Should Be Equal As Strings	          ${response.json()["data"]["send_otp_result"]}           ${RESPONSE_SEND_OTP_TESULT}
    # Set global variable                   ${RESPONSE_MESSAGE_SENTOTP}          ${response.json()["status"]["message"]}
    # Set global variable                   ${RESPONSE_CODE}          ${response.json()["status"]["code"]}
    # Set global variable                     ${OTP_REF_NUMBER}          ${response.json()["data"]["otp_ref"]}
    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..code
	Set global variable             ${RESPONSE_CODE}        ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..code
	Set global variable             ${SEND_OTP_RESPONE_CODE}        ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..message
	Set global variable              ${SEND_OTP_MESSAGE}        ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..remark
	Set global variable              ${SEND_OTP_REMARK}        ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..user_code
	Set global variable              ${USER_CODE}        ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..user_message_en
	Set global variable              ${USER_MESSAGE_EN}        ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..user_message_th
	Set global variable              ${USER_MESSAGE_TH}        ${values_code[0]}

    ${values_code}          	  Get Value From Json	              ${convert_result}	    $..otp_ref
	${ref}      Run Keyword And Ignore Error        Set global variable              ${OTP_REF_NUMBER}        ${values_code[0]}


    Sleep           1

Sent_OTP_Check_Maximum_times
    ${body}=        To Json         {"kyc_trans_id" : "${TRANS_ID}", "language" : "TH" , "mobile_no" : "0800000003"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_SEND_OTP}    headers=&{HEADER_OTP}    data=${body}
    Request Should Be Successful        response=${response}
    Should Be Equal As Integers         ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_OTP_RESEND_MAX_TIME}   
    Log to console      ${response.json()["status"]["code"]}

Sent_OTP_Error5times
    ${body}=        To Json         {"kyc_trans_id" : "${TRANS_ID}", "language" : "TH" , "mobile_no" : "0812345678"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_SEND_OTP}    headers=&{HEADER_OTP}    json=${body}
    Request Should Be Successful        response=${response}
    Should Be Equal As Integers         ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_SUCCESS}   
    # Should Be Equal                     ${response.json()["status"]["message"]}              ${RESPONSE_MESSAGE_SUCCESS}
    # Should Be Equal                     ${response.json()["status"]["remark"]}               ${RESPONSE_REMARK_NULL}
    # Should Be Equal                     ${response.json()["data"]["trans_id"]}               ${TRANS_ID}           
    Set global variable                 ${OTP_REF_NUMBER}                                    ${response.json()["data"]["otp_ref"]}


Sent_OTP_Mobile_Not_Found
    ${body}=        To Json         {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "0800000001", "language" : "TH"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_SEND_OTP}    headers=&{HEADER_OTP}    json=${body}
    Should Be Equal As Integers         ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_NOT_FOUND}   
    Should Be Equal                     ${response.json()["status"]["message"]}              ${RESPONSE_MESSAGE_1003}
    # Should Be Equal                     ${response.json()["data"]["send_top_result"]}        ${RESPONSE_CODE_FAIL}
    # Set global variable                 ${TRANS_ID}       ${response.json()["data"]["trans_id"]}               
    # Set global variable                 ${OTP_REF_NUMBER}       ${response.json()["data"]["otp_ref"]}

Sent_OTP_Invalid_Number_3_times
    FOR    ${tel-number}   IN  {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "${MOBILE_NO}", "language" : "TH"}
    ...             {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "${MOBILE_NO}", "language" : "TH"}
    ...             {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "${MOBILE_NO}", "language" : "TH"} 
        ${body}=        To Json         ${tel-number}
        ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_SEND_OTP}    headers=&{HEADER_OTP}    json=${body}
        Should Be Equal As Integers         ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_NOT_FOUND}   
        Should Be Equal                     ${response.json()["status"]["message"]}              ${RESPONSE_MESSAGE_1003}
        # Should Be Equal                     ${response.json()["data"]["send_top_result"]}        ${RESPONSE_CODE_FAIL}
        # Set global variable                 ${TRANS_ID}             ${response.json()["data"]["trans_id"]}               
        # Set global variable                 ${OTP_REF_NUMBER}       ${response.json()["data"]["otp_ref"]}
    END


Sent_OTP_5_times
    FOR    ${tel-number}   IN  {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "0800000003", "language" : "TH"}
    ...             {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "0800000003", "language" : "TH"}
    ...             {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "0800000003", "language" : "TH"}
    ...             {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "0800000003", "language" : "TH"}
    ...             {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "0800000003", "language" : "TH"}
        ${body}=        To Json         ${tel-number}
        ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_SEND_OTP}    headers=&{HEADER_OTP}    json=${body}
        Should Be Equal As Integers         ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_SUCCESS}   
        # Should Be Equal                     ${response.json()["status"]["message"]}              ${RESPONSE_MESSAGE_1003}
        # Should Be Equal                     ${response.json()["data"]["send_top_result"]}        ${RESPONSE_CODE_FAIL}
        # Set global variable                 ${TRANS_ID}             ${response.json()["data"]["trans_id"]}               
        Set global variable                 ${OTP_REF_NUMBER}                                    ${response.json()["data"]["otp_ref"]}
    END

Sent_OTP_Invalid_Request_5_times
    FOR    ${tel-number}   IN  {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "${MOBILE_NO}", "language" : "TH"}       
        ...        {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "${MOBILE_NO}", "language" : "TH" }   
        ...        {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "${MOBILE_NO}", "language" : "TH" }
        ...        {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "${MOBILE_NO}", "language" : "TH" }
        ...        {"kyc_trans_id" : "${TRANS_ID}", "mobile_no" : "${MOBILE_NO}", "language" : "TH" }
        ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_SEND_OTP}    headers=&{HEADER_OTP}    json=${tel-number}
        # Request Should Be Successful        response=${response}
        Log     ${response.json()["status"]["code"]}
        Log     ${response.json()["status"]["message"]}
        # Should Be Equal As Integers         ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_OTP_RESEND_MAX_TIME}   
        # Should Be Equal                     ${response.json()["status"]["message"]}              ${RESPONSE_MESSAGE_2004}
        # Should Be Equal                     ${response.json()["status"]["remark"]}               ${RESPONSE_REMARK_NULL}
        # Set global variable                 ${TRANS_ID}             ${response.json()["data"]["trans_id"]}               
        # Set global variable                 ${OTP_REF_NUMBER}       ${response.json()["data"]["otp_ref"]}
    END


Sent_OTP_Invalid_Send_Otp_Blank_Field_Mobile_No
    ${body}=   To Json   {"kyc_trans_id":"${TRANS_ID} ","mobile_no":"","language":"TH"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_SEND_OTP}     headers=&{HEADER_OTP}     json=${body}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}            ${RESPONSE_CODE_INVALID_PARAM}
    Should Be Equal                 ${response.json()["status"]["message"]}         ${RESPONSE_MESSAGE_INVALID_PARAM}
    Should Be Equal                 ${response.json()["status"]["remark"]}          ${RESPONSE_REMARK_INVALID_PARAM_SEND_OTP_BLANK_FIELD_MOBILE_NO} 
    # Should Be Equal                 ${response.json()["data"]}                      ${RESPONSE_DATA_NULL}


Sent_OTP_Invalid_Send_Otp_Blank_Field_Trans_ID
    ${body}=        To Json      {"kyc_trans_id":"","mobile_no":"${MOBILE_NO}","language":"TH"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_SEND_OTP}     headers=&{HEADER_OTP}     json=${body}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}            ${RESPONSE_CODE_INVALID_PARAM}
    Should Be Equal                 ${response.json()["status"]["message"]}         ${RESPONSE_MESSAGE_INVALID_PARAM}
    Should Be Equal                 ${response.json()["status"]["remark"]}          ${RESPONSE_REMARK_INVALID_PARAM_SEND_OTP_BLANK_FIELD_TRANS_ID} 
    # Should Be Equal                 ${response.json()["data"]}                      ${RESPONSE_DATA_NULL}

	
OTP Resend Reached Maximum Times
    Log    OTP Resend Reached Maximum Times Error 2004 

Success_Pass
    Log     Success



Get_OTP_Value_from_database
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{result_value} =        Query    SELECT * From api.true_sms_log WHERE message LIKE '%${OTP_REF_NUMBER}%'
    ${get_otpValue}          Get From List                   @{result_value}       	5
    ${result_value}          Get Substring	        ${get_otpValue}         4       11
    Log to console          ${result_value}
    Set global variable         ${MASTER_OTP_VALUE}             ${result_value}


Get_OTP_Value_from_database_by_api
    Log    ${OTP_REF_NUMBER}

    Set Test variable    ${NEW_URL}    api/v1/phone/qa?phone=${MOBILE_NO}\&ref=${OTP_REF_NUMBER}
    # Should Be Equal    ${NEW_REF}    api/v1/phone/qa?phone=${MOBILE_NO}\&ref=${OTP_REF_NUMBER}


    Create Session    alias=${ALIAS}    url=http://192.168.224.11:80     ## Pre-Prod

    # Create Session    alias=${ALIAS}    url=http://192.168.224.111:80     ## Non-Prod
    ${response}=    GET On Session    alias=${ALIAS}    url=${NEW_URL}    headers=${HEADER_GET_VALUEOTP}
    FOR    ${i}    IN    @{response.json()}
        ${data}    Set Variable       ${i["message"]}
        Log     ${data}
    END
    ${otp_value}     Get Substring    ${data}    4        10
    Set Global variable    ${VALUE_OTP}       ${otp_value}
    Log     ${VALUE_OTP}
    Log     ${MOBILE_NO}
    Log     ${OTP_REF_NUMBER}    


