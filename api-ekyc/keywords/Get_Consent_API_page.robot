*** Settings ***
Library             RequestsLibrary
Library             Collections

*** Keywords ***
Get_consent
    Set To Dictionary       ${HEADER_GET_CONSENT}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_GET_CONSENT}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    ${response}=    GET On Session     alias=${ALIAS}      url=${URI_GET_CONSENT}      headers=&{HEADER_GET_CONSENT}
    # Request Should Be Successful    response=${response}
    # Should Be Equal As Integers     ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_SUCCESS}

    Create_File_Keep_Consent             ${response.json()["data"]}
    Encrypt_page.Decrypt_Consent         decrypt_text.txt

    Read_File_Encrypt                       decrypt_text.txt

    # Set global variable                               ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    # Encrypt_page.Decrypt_Long_Text_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                       Convert String to JSON	          ${RESULT_ENCRYPT_DATA}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${CONSENT_MESSAGE}        ${values_code[0]}


    # Set global variable     ${CONSENT_MESSAGE}         ${response.json()["status"]["message"]}             



Disagree_Consent
    Set To Dictionary       ${HEADER_GET_CONSENT}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_GET_CONSENT}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    Create_File_Keep_Text                                   { "kyc_trans_id" : "${TRANS_ID}", "accept" : false }
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}

    # ${body}=        To Json         { "kyc_trans_id" : "${TRANS_ID}", "accept" : false }
    ${response}=    POST On Session        alias=${ALIAS}          url=${URI_GET_CONSENT}      headers=&{HEADER_GET_CONSENT}          json=${body}
    # Should Be Equal As Integers     ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_SUCCESS}
    # Set global variable             ${CONSENT_MESSAGE}         ${response.json()["status"]["message"]}             

    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                       Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	# Set global variable             ${CONSENT_MESSAGE}             ${values_code[0]}

    Run Keyword if       '${values_code[0]}' == 'Success'         Set global variable             ${CONSENT_MESSAGE}      Disagree

Agree_Consent
    Set To Dictionary       ${HEADER_GET_CONSENT}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_GET_CONSENT}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    Create_File_Keep_Text                                   { "kyc_trans_id" : "${TRANS_ID}", "accept" : true }
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}

    # ${body}=        To Json         { "kyc_trans_id" : "${TRANS_ID}", "accept" : false }
    ${response}=    POST On Session        alias=${ALIAS}          url=${URI_GET_CONSENT}      headers=&{HEADER_GET_CONSENT}          json=${body}
    # Should Be Equal As Integers     ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_SUCCESS}
    # Set global variable             ${CONSENT_MESSAGE}         ${response.json()["status"]["message"]}             

    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                       Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${CONSENT_MESSAGE}             ${values_code[0]}


Actions_Consent
    Set To Dictionary       ${HEADER_GET_CONSENT}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_GET_CONSENT}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}

    Create_File_Keep_Text                                   { "kyc_trans_id" : "${TRANS_ID}", "accept" : ${GET_CONSENT} }
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}

    # ${body}=        To Json         { "kyc_trans_id" : "${TRANS_ID}", "accept" : false }
    ${response}=    POST On Session        alias=${ALIAS}          url=${URI_GET_CONSENT}      headers=&{HEADER_GET_CONSENT}          json=${body}
    # Should Be Equal As Integers     ${response.json()["status"]["code"]}                 ${RESPONSE_CODE_SUCCESS}
    # Set global variable             ${CONSENT_MESSAGE}         ${response.json()["status"]["message"]}             

    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                       Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${CONSENT_MESSAGE}             ${values_code[0]}
