*** Settings ***
Library             RequestsLibrary
Library             Collections
Library             JSONLibrary
Resource            ../Varriable/varriable.robot
Resource            ../keywords/Get_data_excel.robot
Resource            ../Keywords/Encrypt_page.robot
Resource		    ../Varriable/img.robot
Resource            ../Keywords/Get_status_error.robot
Resource            ../keywords/Get_Consent_API_page.robot

***Variables***



*** Keywords ***
Validate_customer
    ${body}=        To Json         ${CUSTOMER_DATA}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful    response=${response}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}             ${RESPONSE_CODE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["message"]}         ${RESPONSE_MESSAGE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["remark"]}          ${RESPONSE_REMARK_NULL}
    Set global variable             ${TRANS_ID}             ${response.json()["data"]["trans_id"]}               
    Set global variable             ${MOBILE_NO}            ${response.json()["data"]["mobile_no"]}
    Log to console          ${TRANS_ID}

Validate_customer_Not_Found_Mobile_Number
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    [Arguments]                             ${row_in_excel}
    Get_Data_Customer_UnHappyCase           ${row_in_excel}

    Create_File_Keep_Text                   {"kyc_trans_id":"${TRANS_ID}", "alley":" ","birth_date":"${BIRTH_DATE}","cid":"${GET_CID}","date_of_issue":"04-06-2559","district":"อำเภอลำลูกา","expired_date":"26-07-2567","first_name_en":"${FIRST_NAME_EN}","first_name_th":"${FIRST_NAME}","house_no":"50/21 หมู่บ้าน Vista mini","issue_by":"ลำลูกกา/ปทุมธานี","lane":" ","last_name_en":"${SURNAME_EN}","last_name_th":"${SURNAME}","middle_name_en":"middle","middle_name_th":"กลาง","moo":"5","province":"ปทุมธานี","request_no":123456789,"road":"เลียบคลอง4","sex":"ชาย","sub_district":"ลาดสวาย","title_en":"Mr.","title_th":"นาย","img":"${IMG}"}

    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        
    &{body}=      Create dictionary        data=${RESULT_ENCRYPT_DATA}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}   headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}

    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
    Set test variable               ${CODE_CS_NOT_MOBILE}             ${values_code[0]}
    Should Be Equal                 ${CODE_CS_NOT_MOBILE}                    1006

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${ERROR_VALIDATE}                 ${values_code[0]}
    # Set global variable             ${ERROR_VALIDATE}            ${response.json()["status"]["message"]}


Validate_customer_Invalid_Mobile_Number
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    [Arguments]                             ${row_in_excel}
    Get_Data_Customer_UnHappyCase           ${row_in_excel}

    Create_File_Keep_Text                   {"kyc_trans_id":"${TRANS_ID}", "alley":" ","birth_date":"${BIRTH_DATE}","cid":"${GET_CID}","date_of_issue":"04-06-2559","district":"อำเภอลำลูกา","expired_date":"26-07-2567","first_name_en":"${FIRST_NAME_EN}","first_name_th":"${FIRST_NAME}","house_no":"50/21 หมู่บ้าน Vista mini","issue_by":"ลำลูกกา/ปทุมธานี","lane":" ","last_name_en":"${SURNAME_EN}","last_name_th":"${SURNAME}","middle_name_en":"middle","middle_name_th":"กลาง","moo":"5","province":"ปทุมธานี","request_no":123456789,"road":"เลียบคลอง4","sex":"ชาย","sub_district":"ลาดสวาย","title_en":"Mr.","title_th":"นาย","img":"${IMG}"}

    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}   headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..mobile_number
	Set global variable             ${MOBILE_NO}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..kyc_transaction
	# Set global variable             ${TRANS_ID}        ${values_code[0]}

    # Should Be Equal As Integers     ${response.json()["status"]["code"]}             0
    # Should Be Equal                 ${response.json()["status"]["message"]}         Data Not Found
    # Should Be Equal                 ${response.json()["status"]["remark"]}          CIF not found.
    # Set global variable             ${MOBILE_NO}             ${response.json()["data"]["mobile_number"]}               
    # Set global variable             ${TRANS_ID}            ${response.json()["data"]["kyc_transaction"]}


Validate_customer_Invalid_Param_Date_Not_Match_Format
    ${body}=        To Json         ${CUSTOMER_DATA_INVALIDPARAM_1}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    # Request Should Be Successful    response=${response}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}                ${RESPONSE_CODE_INVALID_PARAM}
    Should Be Equal                 ${response.json()["status"]["message"]}             ${RESPONSE_MESSAGE_INVALID_PARAM}
    # Should Be Equal                 ${response.json()["status"]["remark"]}              ${RESPONSE_REMARK_NULL}
    # Should Be Equal                 ${response.json()["data"]}
    # Set global variable             ${TRANS_ID}             ${response.json()["data"]["trans_id"]}               
    # Set global variable             ${MOBILE_NO}            ${response.json()["data"]["mobile_no"]}


TEST_Validate_customer
    [Arguments]             ${row_in_excel}
    Get_Data_Customer           ${row_in_excel}
    ${body}=      To Json     {"title_th":"นาย","title_en":"Mr.","first_name_th":"ตัวอย่าง","first_name_en":"Sample","middle_name_th":"","middle_name_en":"","last_name_th":"สาธิตสกุล","last_name_en":"Satitsakul","house_no":"1/19-11","moo":"1","alley":"ตรอก-ปฐม","lane":"ซอย-สุขุมวิท","road":"สุขุมวิท","sub_district":"คลองเตย","district":"พระโขนง","province":"กรุงเทพมหานคร","sex":"ชาย","birth_date":"30-03-2508","cid":"${GET_CID}","date_of_issue":"04-06-2559","expired_date":"29-03-2565","img":"image/base64","request_no":"12345678901234","issue_by":"พระโขนง/กรุงเทพมหานคร","agent_id":"640000","latitude":"1234","longitude":"01234"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful    response=${response}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}             ${RESPONSE_CODE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["message"]}         ${RESPONSE_MESSAGE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["remark"]}          ${RESPONSE_REMARK_NULL}
    Set global variable             ${TRANS_ID}             ${response.json()["data"]["trans_id"]}               
    Set global variable             ${MOBILE_NO}            ${response.json()["data"]["mobile_no"]}

Validate_customer_LN_FR
    [Arguments]                         ${row_in_excel}
    Get_Data_Customer_LN_FR           ${row_in_excel}
    ${body}=      To Json     {"title_th":"นาย","title_en":"Mr.","first_name_th":"ตัวอย่าง","first_name_en":"Sample","middle_name_th":"","middle_name_en":"","last_name_th":"สาธิตสกุล","last_name_en":"Satitsakul","house_no":"1/19-11","moo":"1","alley":"ตรอก-ปฐม","lane":"ซอย-สุขุมวิท","road":"สุขุมวิท","sub_district":"คลองเตย","district":"พระโขนง","province":"กรุงเทพมหานคร","sex":"ชาย","birth_date":"30-03-2508","cid":"${GET_CID}","date_of_issue":"04-06-2559","expired_date":"29-03-2565","img":"image/base64","request_no":"12345678901234","issue_by":"พระโขนง/กรุงเทพมหานคร","agent_id":"640000","latitude":"1234","longitude":"01234"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful    response=${response}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}             ${RESPONSE_CODE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["message"]}         ${RESPONSE_MESSAGE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["remark"]}          ${RESPONSE_REMARK_NULL}
    Set global variable             ${TRANS_ID}             ${response.json()["data"]["trans_id"]}               
    Set global variable             ${MOBILE_NO}            ${response.json()["data"]["mobile_no"]}


Validate_customers
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    [Arguments]                             ${row_in_excel}
    Get_Data_Customer_MainCase              ${row_in_excel}
    Create_File_Keep_Text                   {"kyc_trans_id":"${TRANS_ID}", "alley":" ","birth_date":"${BIRTH_DATE}","cid":"${GET_CID}","date_of_issue":"04-06-2559","district":"อำเภอลำลูกา","expired_date":"26-07-2567","first_name_en":"${FIRST_NAME_EN}","first_name_th":"${FIRST_NAME}","house_no":"50/21 หมู่บ้าน Vista mini","issue_by":"ลำลูกกา/ปทุมธานี","lane":" ","last_name_en":"${SURNAME_EN}","last_name_th":"${SURNAME}","middle_name_en":"middle","middle_name_th":"กลาง","moo":"5","province":"ปทุมธานี","request_no":123456789,"road":"เลียบคลอง4","sex":"ชาย","sub_district":"ลาดสวาย","title_en":"Mr.","title_th":"นาย","img":"${IMG}"}

    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    &{body}=      Create dictionary        data=${RESULT_ENCRYPT_DATA}

    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}   headers=&{HEADER_PLATFORM_KYC}    json=${body}      expected_status=anything
    Run keyword if       '${response.status_code}' != '200'         Save_error_When_its_active          VALIDATE            

    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
	Set global variable             ${CS_VALIDATE_RESPONSE_CODE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${CS_VALIDATE_RESPONSE_MESSAGE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..remark
	Set global variable             ${CS_VALIDATE_RESPONSE_REMARK}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..mobile_number
	Set global variable             ${MOBILE_NO}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_code
	Set global variable             ${USER_CODE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_en
	Set global variable             ${USER_MESSAGE_EN}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_th
	Set global variable             ${USER_MESSAGE_TH}        ${values_code[0]}



Validate_customer_IAL_TEST
    [Arguments]                             ${row_in_excel}
    Get_Data_Customer_IAL           ${row_in_excel}
    ${body}=      To Json     {"title_th":"นาย","title_en":"Mr.","first_name_th":"${FIRST_NAME}","first_name_en":"Sample","middle_name_th":"","middle_name_en":"","last_name_th":"${SURNAME}","last_name_en":"Satitsakul","house_no":"1/19-11","moo":"1","alley":"ตรอก-ปฐม","lane":"ซอย-สุขุมวิท","road":"สุขุมวิท","sub_district":"คลองเตย","district":"พระโขนง","province":"กรุงเทพมหานคร","sex":"ชาย","birth_date":"${BIRTH_DATE}","cid":"${GET_CID}","date_of_issue":"04-06-2559","expired_date":"29-03-2565","img":"image/base64","request_no":"12345678901234","issue_by":"พระโขนง/กรุงเทพมหานคร","agent_id":"640000","latitude":"1234","longitude":"01234"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}    headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Request Should Be Successful    response=${response}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}             ${RESPONSE_CODE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["message"]}         ${RESPONSE_MESSAGE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["remark"]}          ${RESPONSE_REMARK_NULL}
    Set global variable             ${TRANS_ID}             ${response.json()["data"]["trans_id"]}               
    Set global variable             ${MOBILE_NO}            ${response.json()["data"]["mobile_no"]}

Validate_customer_Not_Customer
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    [Arguments]                             ${row_in_excel}
    Get_Data_Customer_UnHappyCase           ${row_in_excel}
    Create_File_Keep_Text                   {"kyc_trans_id":"${TRANS_ID}", "alley":" ","birth_date":"${BIRTH_DATE}","cid":"${GET_CID}","date_of_issue":"04-06-2559","district":"อำเภอลำลูกา","expired_date":"26-07-2567","first_name_en":"${FIRST_NAME_EN}","first_name_th":"${FIRST_NAME}","house_no":"50/21 หมู่บ้าน Vista mini","issue_by":"ลำลูกกา/ปทุมธานี","lane":" ","last_name_en":"${SURNAME_EN}","last_name_th":"${SURNAME}","middle_name_en":"middle","middle_name_th":"กลาง","moo":"5","province":"ปทุมธานี","request_no":123456789,"road":"เลียบคลอง4","sex":"ชาย","sub_district":"ลาดสวาย","title_en":"Mr.","title_th":"นาย","img":"${IMG}"}

    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}

    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}   headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
    Set test variable               ${CODE_CS_NOT_MOBILE}             ${values_code[0]}
    Should Be Equal                 ${CODE_CS_NOT_MOBILE}                    1005

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${ERROR_VALIDATE}                 ${values_code[0]}


    # Set global variable             ${ERROR_VALIDATE}            ${response.json()["status"]["message"]}
    # Set global variable             ${MOBILE_NO}             ${response.json()["data"]["mobile_number"]}               
    # Set global variable             ${TRANS_ID}            ${response.json()["data"]["kyc_transaction"]}

Validate_customer_for_Unhappy
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    [Arguments]                             ${row_in_excel}
    Get_Data_Customer_UnHappyCase           ${row_in_excel}

    Create_File_Keep_Text                   {"kyc_trans_id":"${TRANS_ID}", "alley":" ","birth_date":"${BIRTH_DATE}","cid":"${GET_CID}","date_of_issue":"04-06-2559","district":"อำเภอลำลูกา","expired_date":"26-07-2567","first_name_en":"${FIRST_NAME_EN}","first_name_th":"${FIRST_NAME}","house_no":"50/21 หมู่บ้าน Vista mini","issue_by":"ลำลูกกา/ปทุมธานี","lane":" ","last_name_en":"${SURNAME_EN}","last_name_th":"${SURNAME}","middle_name_en":"middle","middle_name_th":"กลาง","moo":"5","province":"ปทุมธานี","request_no":123456789,"road":"เลียบคลอง4","sex":"ชาย","sub_district":"ลาดสวาย","title_en":"Mr.","title_th":"นาย","img":"${IMG}"}

    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}   headers=&{HEADER_PLATFORM_KYC}    json=${body}

    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..mobile_number
	Set global variable             ${MOBILE_NO}        ${values_code[0]}

    # ${values_code}          	    Get Value From Json	              ${convert_result}	    $..kyc_transaction
	# Set global variable             ${TRANS_ID}        ${values_code[0]}




    # Should Be Equal As Integers     ${response.json()["status"]["code"]}             0
    # Should Be Equal                 ${response.json()["status"]["message"]}         Data Not Found
    # Should Be Equal                 ${response.json()["status"]["remark"]}          CIF not found.
    # Set global variable             ${MOBILE_NO}             ${response.json()["data"]["mobile_number"]}               
    # Set global variable             ${TRANS_ID}            ${response.json()["data"]["kyc_transaction"]}

Validate_customer_pass
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    [Arguments]                             ${row_in_excel}
    Get_Data_Customer_MainCase           ${row_in_excel}

    Create_File_Keep_Text             { "kyc_trans_id":"${TRANS_ID}", "alley": " ", "birth_date": "${BIRTH_DATE}", "cid":"${GET_CID}", "date_of_issue": "04-06-2559", "district": "อำเภอบางกรวย", "expired_date": "26-07-2567", "first_name_en": "${FIRST_NAME_EN}", "first_name_th": "${FIRST_NAME}", "house_no": "425", "issue_by": "พระโขนง/กรุงเทพมหานคร", "lane": " ", "last_name_en": "${SURNAME_EN}", "last_name_th": "${SURNAME}", "middle_name_en": "middle", "middle_name_th": "กลาง", "moo": " ", "province": "บางกะปิ", "request_no": 123456789, "road": "นวมินทร์", "sex": "ชาย", "sub_district": "บางสีทอง", "title_en": "Mr.", "title_th": "นาย", "img": "${IMG}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}   headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..consent_new_version
	Set global variable             ${CONSENT_NEW_VERSION}        ${values_code[0]}
    Run Keyword If                 '${CONSENT_NEW_VERSION}' == 'True'               Get_Consent_API_page.Agree_Consent


Validate_customer_Fails
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}
    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    [Arguments]                             ${row_in_excel}
    Get_Data_Customer_MainCase           ${row_in_excel}
    Create_File_Keep_Text      { "kyc_trans_id":"${TRANS_ID}", "alley": " ", "birth_date": "${BIRTH_DATE}", "cid":"1100600292855", "date_of_issue": "04-06-2559", "district": "อำเภอบางกรวย", "expired_date": "26-07-2567", "first_name_en": "${FIRST_NAME_EN}", "first_name_th": "${FIRST_NAME}", "house_no": "425", "issue_by": "พระโขนง/กรุงเทพมหานคร", "lane": " ", "last_name_en": "${SURNAME_EN}", "last_name_th": "${SURNAME}", "middle_name_en": "middle", "middle_name_th": "กลาง", "moo": " ", "province": "บางกะปิ", "request_no": 123456789, "road": "นวมินทร์", "sex": "ชาย", "sub_district": "บางสีทอง", "title_en": "Mr.", "title_th": "นาย", "img": "${IMG}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}   headers=&{HEADER_PLATFORM_KYC}    json=${body}


Validate_customer_qr_code_journey
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}
    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    [Arguments]                             ${row_in_excel}
    Get_Data_Customer_MainCase           ${row_in_excel}


    Create_File_Keep_Text             { "kyc_trans_id":"${TRANS_ID}", "alley": " ", "birth_date": "${BIRTH_DATE}", "cid":"${GET_CID}", "date_of_issue": "04-06-2559", "district": "อำเภอบางกรวย", "expired_date": "26-07-2567", "first_name_en": "${FIRST_NAME_EN}", "first_name_th": "${FIRST_NAME}", "house_no": "425", "issue_by": "พระโขนง/กรุงเทพมหานคร", "lane": " ", "last_name_en": "${SURNAME_EN}", "last_name_th": "${SURNAME}", "middle_name_en": "middle", "middle_name_th": "กลาง", "moo": " ", "province": "บางกะปิ", "request_no": 123456789, "road": "นวมินทร์", "sex": "ชาย", "sub_district": "บางสีทอง", "title_en": "Mr.", "title_th": "นาย", "img": "${IMG}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}   headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}

    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
	Set global variable             ${RESPONSE_CODE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${RESPONSE_MESSAGE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..remark
	Set global variable             ${RESPONSE_REMARK}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_code
	Set global variable             ${RESPONSE_USERCODE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_en
	Set global variable             ${RESPONSE_USER_EN}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_th
	Set global variable             ${RESPONSE_USER_TH}        ${values_code[0]}


Validate_customer_qr_code_BU_Journey
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}
    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    [Arguments]                             ${row_in_excel}
    # Get_Data_Customer_MainCase           ${row_in_excel}


    Create_File_Keep_Text             { "kyc_trans_id":"${TRANS_ID}", "alley": " ", "birth_date": "${BIRTH_DATE}", "cid":"${GET_CID}", "date_of_issue": "04-06-2559", "district": "อำเภอบางกรวย", "expired_date": "26-07-2567", "first_name_en": "${FIRST_NAME_EN}", "first_name_th": "${FIRST_NAME}", "house_no": "425", "issue_by": "พระโขนง/กรุงเทพมหานคร", "lane": " ", "last_name_en": "${SURNAME_EN}", "last_name_th": "${SURNAME}", "middle_name_en": "middle", "middle_name_th": "กลาง", "moo": " ", "province": "บางกะปิ", "request_no": 123456789, "road": "นวมินทร์", "sex": "ชาย", "sub_district": "บางสีทอง", "title_en": "Mr.", "title_th": "นาย", "img": "${${VAR_IMG}}"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    ${body}=        To Json              {"data": "${RESULT_ENCRYPT_DATA}"}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_POST_VALIDATE_CUSTOMER}   headers=&{HEADER_PLATFORM_KYC}    json=${body}
    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}

    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}             Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..code
	Set global variable             ${RESPONSE_CODE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..message
	Set global variable             ${RESPONSE_MESSAGE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..remark
	Set global variable             ${RESPONSE_REMARK}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_code
	Set global variable             ${RESPONSE_USERCODE}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_en
	Set global variable             ${RESPONSE_USER_EN}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..user_message_th
	Set global variable             ${RESPONSE_USER_TH}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..mobile_number
	Set global variable             ${MOBILE_NO}        ${values_code[0]}

    ${values_code}          	    Get Value From Json	              ${convert_result}	    $..consent_new_version
	Set global variable             ${CONSENT_NEW_VERSION}        ${values_code[0]}

    Run Keyword If                 '${CONSENT_NEW_VERSION}' == 'True'        Get_Consent_API_page.Actions_Consent
