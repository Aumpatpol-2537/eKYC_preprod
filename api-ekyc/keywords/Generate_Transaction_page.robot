*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ../Varriable/varriable.robot



***Keywords***
Start_Generate_Transaction
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    Create_File_Keep_Text                                    { "journey" : "JN001", "latitude" : 100.00, "longitude" : 90.00, "agent_id" : "QA", "agent_name" : "QA", "device_name" : "abc", "device_ip" : "000", "imei" : "xxx" }
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    &{body}=      Create dictionary        data=${RESULT_ENCRYPT_DATA}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_GENERATE}   headers=&{HEADER_PLATFORM_KYC}    json=${body}      expected_status=anything
    # Set global variable             ${TRANS_ID}            ${response.json()["data"]["kyc_transaction"]}

    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                       Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..kyc_trans_id
	Set global variable             ${TRANS_ID}                      ${values_code[0]}
