***Settings***
Library             RequestsLibrary
Library             Collections
Resource            ../keywords/Get_data_excel.robot
Resource            ../Keywords/Encrypt_page.robot

***Variables***
${CID_AUM}        0I8SfCnkwkptBl1Z50x6mYNe0lbdJCRxMApy/0EMeYFwu59LCQxgxs4=
${JARR}           CBWV7Pg6oX2yNgXJtLZA4N85SOMl97bQuVBw9xwHlbVu72xl83HP2nw=  
${PEPSI}          RUS0MomB2ZFe3987on5tJxanyfYFz3wF8TiATNfUBW85Wtv3HgdXtd8=

***Keywords***
Generate_QR_Code
    [Arguments]         ${row_gen_qrcode}
    Get_data_excel.Get_data_Generate_QRCODE            ${row_gen_qrcode}  

    Set To Dictionary       ${HEADER_GEN_QR}      partner-secret=${GET_PARTNER_SECRET}

    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}
    &{body}=        Create dictionary       cid=${GET_CID}      twin_status=${GET_TWIN__STATUS}     twins_gender=${GET_TWIN__GENDER}   journey_code=${GET_JOR_CODE}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_GEN_QRCODE}     headers=&{HEADER_GEN_QR}      json=${body}    expected_status=anything
    Set global variable             ${RESPONSE_CODE}                                  ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                               ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                                ${response.json()["status"]["remark"]}             

    Set global variable             ${QR_VALUE}                                       ${response.json()["data"]["qr"]}             
    Set global variable             ${QR_EXPIRE}                                      ${response.json()["data"]["qr_expired"]}             
    Set global variable             ${QR_STATUS}                                      ${response.json()["data"]["qr_status"]}             
    Set global variable             ${RESPONSE_API}                                   ${response.content}

    # ${values_code}          	  Get Value From Json	              ${convert_result}	    $..code
	# Set global variable           ${RESPONSE_CODE}                    ${values_code[0]}

    # ${values_code}          	  Get Value From Json	              ${convert_result}	    $..message
	# Set global variable           ${RESPONSE_MESSAGE}                 ${values_code[0]}

    # ${values_code}          	  Get Value From Json	              ${convert_result}	    $..remark
	# Set global variable           ${RESPONSE_REMARK}                  ${values_code[0]}

    # ${values_code}          	  Get Value From Json	              ${convert_result}	    $..qr
	# Set global variable           ${QR_VALUE}                         ${values_code[0]}

    # ${values_code}          	  Get Value From Json	              ${convert_result}	    $..qr_expired
	# Set global variable           ${QR_EXPIRE}                        ${values_code[0]}

    # ${values_code}          	  Get Value From Json	              ${convert_result}	    $..qr_status
	# Set global variable           ${QR_STATUS}                        ${values_code[0]}

    # Set global variable             ${RESPONSE_API}                                   ${response.content}


Validate_QR_Code
    [Arguments]         ${row_validate_qrcode}          ${excel_sheet}

    Get_data_excel.Get_data_Validate_QRCODE            ${row_validate_qrcode}            ${excel_sheet}

    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    Create_File_Keep_Text                   { "qr": "${GET_QR_STRING}", "latitude": "13.8694526", "longitude": "100.7180486", "agent_id": "ekyc003", "agent_name": "TB0003 ", "device_name": "SM-P585Y/samsung", "device_ip": "192.168.2.42", "imei": "abc" }

    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    &{body}=      Create dictionary        data=${RESULT_ENCRYPT_DATA}

    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_VALIDATE_QRCODE}   headers=&{HEADER_PLATFORM_KYC}    json=${body}      expected_status=anything
    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}               Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..code
	Set global variable             ${RESPONSE_CODE}                ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..message
	Set global variable             ${RESPONSE_MESSAGE}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..remark
	Set global variable             ${RESPONSE_REMARK}              ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..user_code
	Set global variable             ${RESPONSE_USERCODE}            ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..user_message_en
	Set global variable             ${RESPONSE_USER_EN}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..user_message_th
	Set global variable             ${RESPONSE_USER_TH}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..kyc_trans_id
	Set global variable             ${TRANS_ID}                     ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..journey_code
	Set global variable             ${JOURNEY_NAME}                     ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..journey_name
	Set global variable             ${JOURNEY_CODE}                     ${values_code[0]}


Validate_qrcode_modify_api_journey
    [Arguments]         ${row}         

    Get_data_excel.Get_data_Modify_Validate_QR          ${row}      

    Set To Dictionary       ${HEADER_VALIDATE_QR}      Authorization=${LOGIN_IDTOKEN}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}
    &{body}=        Create dictionary      qr=${GET_QR_STRING}     trans_ref=   cid=      latitude=13.8694526    longitude=100.7180486   agent_id=ekyc003     agent_name=TB0003     device_name=SM-P585Y/samsung    device_ip=192.168.2.42    imei=abc
    ${response}=    POST On Session       alias=${ALIAS}     url=${URI_VALIDATE_QRCODE}   headers=&{HEADER_VALIDATE_QR}    json=${body}

    # Set global variable             ${RESPONSE_CODE}              ${response.json()["status"]["code"]}             
    # Set global variable             ${RESPONSE_MESSAGE}           ${response.json()["status"]["message"]}             
    # Set global variable             ${RESPONSE_REMARK}            ${response.json()["status"]["remark"]}             
    # Set global variable             ${RESPONSE_API}                                   ${response.content}
    # Set global variable             ${RESPONSE_USERCODE}           ${response.json()["status"]["user_code"]}             
    # Set global variable             ${RESPONSE_USER_EN}            ${response.json()["status"]["user_message_en"]}             
    # Set global variable             ${RESPONSE_USER_TH}            ${response.json()["status"]["user_message_th"]}             


    # Set global variable             ${JOURNEY_CODE}               ${response.json()["data"]["journey_code"]}             
    # Set global variable             ${JOURNEY_NAME}               ${response.json()["data"]["journey_name"]}             
    Set global variable             ${TRANS_ID}                   ${response.json()["data"]["kyc_trans_id"]}             



Generate_QR_Code_for_test_qrstamp_scene
    Set To Dictionary       ${HEADER_GEN_QR}      partner-secret=${GET_PARTNER_SECRET}

    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}
    &{body}=        Create dictionary       cid=${PEPSI}      twins_status=     twins_gender=   journey_code=JN003         consent_onetrust_version=            consent_internal_version=
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_GEN_QRCODE}     headers=&{HEADER_GEN_QR}      json=${body}    expected_status=anything

    Set global variable             ${RESPONSE_CODE}                                  ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                               ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                                ${response.json()["status"]["remark"]}             

    Set global variable             ${QR_VALUE}                                       ${response.json()["data"]["qr"]}             
    Set global variable             ${QR_EXPIRE}                                      ${response.json()["data"]["qr_expired"]}             
    Set global variable             ${QR_STATUS}                                      ${response.json()["data"]["qr_status"]}             
    Set global variable             ${RESPONSE_API}                                   ${response.content}


Generate_QR_Code_for_test_qrstamp_scene_2
    Set To Dictionary       ${HEADER_GEN_QR}      partner-secret=${GET_PARTNER_SECRET}

    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}
    &{body}=        Create dictionary       cid=jzoyaYvHxfMTTtRy9N/8jwBmZHBm3l6IkCmNcawbA8haeGlrOTb8Gpo=      twin_status=     twins_gender=   journey_code=JN004
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_GEN_QRCODE}     headers=&{HEADER_GEN_QR}      json=${body}    expected_status=anything

    Set global variable             ${RESPONSE_CODE}                                  ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                               ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                                ${response.json()["status"]["remark"]}             

    Set global variable             ${QR_VALUE}                                       ${response.json()["data"]["qr"]}             
    Set global variable             ${QR_EXPIRE}                                      ${response.json()["data"]["qr_expired"]}             
    Set global variable             ${QR_STATUS}                                      ${response.json()["data"]["qr_status"]}             
    Set global variable             ${RESPONSE_API}                                   ${response.content}


Validate_QR_Code_for_test_qrstamp_scene
    Set To Dictionary       ${HEADER_PLATFORM_KYC}      Authorization=${LOGIN_IDTOKEN}
    Log                     ${HEADER_PLATFORM_KYC}

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE} 
    Create_File_Keep_Text                   { "qr": "${QR_VALUE}", "latitude": "13.8694526", "longitude": "100.7180486", "agent_id": "ekyc003", "agent_name": "TB0003 ", "device_name": "SM-P585Y/samsung", "device_ip": "192.168.2.42", "imei": "abc" }

    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    &{body}=      Create dictionary        data=${RESULT_ENCRYPT_DATA}

    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_VALIDATE_QRCODE}   headers=&{HEADER_PLATFORM_KYC}    json=${body}      expected_status=anything
    Set global variable                     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}               Convert String to JSON	          ${OUTPUT_VALUE_FROM_ENCRYPT}	

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..code
	Set global variable             ${RESPONSE_CODE}                ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..code
	Set global variable             ${QR_RESPONSE_CODE}                ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..message
	Set global variable             ${RESPONSE_MESSAGE}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..remark
	Set global variable             ${RESPONSE_REMARK}              ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..user_code
	Set global variable             ${RESPONSE_USERCODE}            ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..user_message_en
	Set global variable             ${RESPONSE_USER_EN}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..user_message_en
	Set global variable             ${QR_RESPONSE_USER_EN}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..user_message_th
	Set global variable             ${RESPONSE_USER_TH}             ${values_code[0]}

    ${values_code}          	    Get Value From Json	            ${convert_result}	    $..kyc_trans_id
	Set global variable             ${TRANS_ID}                     ${values_code[0]}

Generate_QR_Code_for_test_qrstamp_scene_add_data
    [Arguments]     ${cid}
    Set To Dictionary       ${HEADER_GEN_QR}      partner-secret=${GET_PARTNER_SECRET}

    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}
    # &{body}=        Create dictionary       cid=6RMiea2qlgsunn3CSoZsQWQJeGOT/MQCSPwLMavI3y3zqpR6fUVmmGk=    twin_status=     twins_gender=   journey_code=JN003       ###น้องจ๋า
    &{body}=        Create dictionary       cid=${cid}      twin_status=     twins_gender=   journey_code=JN003         
    # &{body}=        Create dictionary       cid=IfCWHF4jPgvVSzFOK4qIEfPMTbn3YYPLVo6EF4fgba0sl4Uk2OPmtUE=      twin_status=     twins_gender=   journey_code=JN003         ###พี่pepsi
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_GEN_QRCODE}     headers=&{HEADER_GEN_QR}      json=${body}    expected_status=anything

    Set global variable             ${RESPONSE_CODE}                                  ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                               ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                                ${response.json()["status"]["remark"]}             

    Set global variable             ${QR_VALUE}                                       ${response.json()["data"]["qr"]}             
    Set global variable             ${QR_EXPIRE}                                      ${response.json()["data"]["qr_expired"]}             
    Set global variable             ${QR_STATUS}                                      ${response.json()["data"]["qr_status"]}             
    Set global variable             ${RESPONSE_API}                                   ${response.content}

