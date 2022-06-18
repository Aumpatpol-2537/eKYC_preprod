*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             JSONLibrary
Resource            ../Varriable/varriable.robot
Resource            ../keywords/Get_data_excel.robot
Resource            ../Keywords/Encrypt_page.robot
Resource		    ../Varriable/img.robot
Resource            ../Keywords/Get_status_error.robot
Resource            ../Varriable/varriable.robot



***Keywords***
Have_Twin_Male
    Set To Dictionary       ${HEADER_TWIN}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_TWIN}
    Create Session          alias=${ALIAS}      url=${URL_CORE_SERVICE} 

    # [Arguments]                             ${row_in_excel}
    # Get_Data_Customer_MainCase              ${row_in_excel}

    Create_File_Keep_Text                    {"kyc_trans_id" : "${TRANS_ID}","twins_status": "True","twins_gender": "Male"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}

    ${response}=    PUT On Session     alias=${ALIAS}     url=${URI_TWIN}   headers=&{HEADER_TWIN}    json=${body}      expected_status=anything
    # Request Should Be Successful    response=${response}
    Run keyword if       '${response.status_code}' != '200'         Save_error_When_its_active          TWIN            


    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
	# Set global variable             ${CS_VALIDATE_RESPONSE_CODE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${TWIN_RESPONSE_MESSAGE}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..remark
	# Set global variable             ${CS_VALIDATE_RESPONSE_REMARK}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..mobile_number
	# Set global variable             ${MOBILE_NO}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_code
	# Set global variable             ${USER_CODE}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_en
	# Set global variable             ${USER_MESSAGE_EN}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_th
	# Set global variable             ${USER_MESSAGE_TH}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..kyc_transaction
	# Set global variable             ${TRANS_ID}        ${values_code[0]}



Have_Twin_Female
    Set To Dictionary       ${HEADER_TWIN}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_TWIN}
    Create Session          alias=${ALIAS}      url=${URL_CORE_SERVICE} 

    # [Arguments]                             ${row_in_excel}
    # Get_Data_Customer_MainCase              ${row_in_excel}

    Create_File_Keep_Text                    {"kyc_trans_id" : "${TRANS_ID}","twins_status": "True","twins_gender": "Female"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}

    ${response}=    PUT On Session     alias=${ALIAS}     url=${URI_TWIN}   headers=&{HEADER_TWIN}    json=${body}      expected_status=anything
    # Request Should Be Successful    response=${response}
    Run keyword if       '${response.status_code}' != '200'         Save_error_When_its_active          TWIN            


    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
	# Set global variable             ${CS_VALIDATE_RESPONSE_CODE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${TWIN_RESPONSE_MESSAGE}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..remark
	# Set global variable             ${CS_VALIDATE_RESPONSE_REMARK}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..mobile_number
	# Set global variable             ${MOBILE_NO}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_code
	# Set global variable             ${USER_CODE}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_en
	# Set global variable             ${USER_MESSAGE_EN}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_th
	# Set global variable             ${USER_MESSAGE_TH}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..kyc_transaction
	# Set global variable             ${TRANS_ID}        ${values_code[0]}

Dont_Have_Twin
    Set To Dictionary       ${HEADER_TWIN}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_TWIN}
    Create Session          alias=${ALIAS}      url=${URL_CORE_SERVICE} 

    Create_File_Keep_Text                                  {"kyc_trans_id" : "${TRANS_ID}","twins_status": "false","twins_gender": ""}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}

    ${response}=    PUT On Session     alias=${ALIAS}     url=${URI_TWIN}   headers=&{HEADER_TWIN}    json=${body}      expected_status=anything
    # Request Should Be Successful    response=${response}
    Run keyword if       '${response.status_code}' != '200'         Save_error_When_its_active          TWIN            


    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
	# Set global variable             ${CS_VALIDATE_RESPONSE_CODE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${TWIN_RESPONSE_MESSAGE}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..remark
	# Set global variable             ${CS_VALIDATE_RESPONSE_REMARK}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..mobile_number
	# Set global variable             ${MOBILE_NO}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_code
	# Set global variable             ${USER_CODE}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_en
	# Set global variable             ${USER_MESSAGE_EN}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_th
	# Set global variable             ${USER_MESSAGE_TH}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..kyc_transaction
	# Set global variable             ${TRANS_ID}        ${values_code[0]}
