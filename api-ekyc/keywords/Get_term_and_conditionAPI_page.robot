*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ../Keywords/Encrypt_page.robot


*** Keywords ***
    
Get_term_and_conditions
    Set To Dictionary       ${HEADER_GET_TERM}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_GET_TERM}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    ${response}=    GET On Session        alias=${ALIAS}          url=${URI_GET_TERM_AND_CONDITION}      headers=&{HEADER_GET_TERM}
    # Request Should Be Successful       response=${response}
    #  Log                 ${response.content}
    # Should Be Equal As Integers        ${response.json()["status"]["code"]}                ${RESPONSE_CODE_SUCCESS}
    # Should Be Equal                    ${response.json()["status"]["message"]}             ${RESPONSE_MESSAGE_SUCCESS}
    # Set global variable                 ${GETTERM_RESPONES_MESSAGE}                      ${response.json()["status"]["message"]}

    # Save_Long_text_to_file                  ${response.json()["data"]}
    Create_File_Keep_Consent             ${response.json()["data"]}
    Encrypt_page.Decrypt_Consent         decrypt_text.txt

    Read_File_Encrypt                       decrypt_text.txt

    # Set global variable                               ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    # Encrypt_page.Decrypt_Long_Text_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                       Convert String to JSON	          ${RESULT_ENCRYPT_DATA}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${GETTERM_RESPONES_MESSAGE}        ${values_code[0]}



Disagree_term_and_conditions
    Set To Dictionary       ${HEADER_GET_TERM}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_GET_TERM}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    Create_File_Keep_Text                                    { "kyc_trans_id" : "${TRANS_ID}", "accept" : false }
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        


    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session        alias=${ALIAS}          url=${URI_GET_TERM_AND_CONDITION}      headers=&{HEADER_GET_TERM}          json=${body}

    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                       Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	# Set global variable             ${GETTERM_RESPONES_MESSAGE}             ${values_code[0]}

    Run Keyword if       '${values_code[0]}' == 'Success'         Set global variable             ${GETTERM_RESPONES_MESSAGE}      Disagree


Agree_term_and_conditions
    Set To Dictionary       ${HEADER_GET_TERM}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_GET_TERM}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    Create_File_Keep_Text                                    { "kyc_trans_id" : "${TRANS_ID}", "accept" : true }
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        


    &{body}=      Create dictionary        data=${RESULT_ENCRYPT_DATA}
    ${response}=    POST On Session        alias=${ALIAS}          url=${URI_GET_TERM_AND_CONDITION}      headers=&{HEADER_GET_TERM}          json=${body}
    # Should Be Equal As Integers        ${response.json()["status"]["code"]}                ${RESPONSE_CODE_SUCCESS}
    # Should Be Equal                    ${response.json()["status"]["message"]}             ${RESPONSE_MESSAGE_SUCCESS}
    # Set global variable                 ${GETTERM_RESPONES_MESSAGE}                      ${response.json()["status"]["message"]}

    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                       Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${GETTERM_RESPONES_MESSAGE}             ${values_code[0]}



Actions_term_and_conditions
    Set To Dictionary       ${HEADER_GET_TERM}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_GET_TERM}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    Create_File_Keep_Text                                    { "kyc_trans_id" : "${TRANS_ID}", "accept" : ${GET_TERM} }
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        


    &{body}=      Create dictionary        data=${RESULT_ENCRYPT_DATA}
    ${response}=    POST On Session        alias=${ALIAS}          url=${URI_GET_TERM_AND_CONDITION}      headers=&{HEADER_GET_TERM}          json=${body}

    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}                       Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${GETTERM_RESPONES_MESSAGE}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..remark
	Set global variable             ${RESPONSE_REMARK}        ${values_code[0]}
