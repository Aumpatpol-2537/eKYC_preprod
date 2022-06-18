***Settings***
Library             RequestsLibrary
Library             Collections
Resource            ../keywords/Get_data_excel.robot
Resource            ../Varriable/img_authen.robot

***Keywords***
Liveness_authen_api
    [Arguments]         ${row_gen_qrcode}
    Get_data_excel.Get_data_facial_authen           ${row_gen_qrcode}  

    Set To Dictionary       ${HEADER_FACIAL_AUTHEN}      partner-secret=${GET_PARTNER_SECRET}

    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}
    &{body}=        Create dictionary       cid=${GET_CID}       image_source=${${BASE64}}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_LIVENESS_AUTHEN}     headers=&{HEADER_FACIAL_AUTHEN}      json=${body}    expected_status=anything
    Set global variable             ${RESPONSE_CODE}                                  ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                               ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                                ${response.json()["status"]["remark"]}             
    Set global variable             ${SCORE_FACIAL}                                   ${response.json()["data"]["score"]}             


Facial_authen_10_Pic
    [Arguments]         ${row_gen_qrcode}
    FOR    ${index}    IN RANGE    11        21
        Get_data_excel.Get_data_facial_authen           ${row_gen_qrcode}  
        # Random_base_64
        Set To Dictionary       ${HEADER_FACIAL_AUTHEN}      partner-secret=${GET_PARTNER_SECRET}
        Log      ${index} 
        Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}
        &{body}=        Create dictionary       cid=${GET_CID}       
        ...             image_source=${AUTHEN_${index}}         process_id=${GET_PROCESS_ID} 

        ${response}=    POST On Session     alias=${ALIAS}     url=${URI_FACIAL_AUTHEN}     headers=&{HEADER_FACIAL_AUTHEN}      json=${body}    expected_status=anything
        Set global variable             ${RESPONSE_CODE}                                  ${response.json()["status"]["code"]}             
        Set global variable             ${RESPONSE_MESSAGE}                               ${response.json()["status"]["message"]}             
        Set global variable             ${RESPONSE_REMARK}                                ${response.json()["status"]["remark"]}             
        Set global variable             ${SCORE_FACIAL}                                   ${response.json()["data"]["score"]}             
    END

Random_base_64
    ${result} =    Generate Random String    1    1234567890
    Set Global Variable       ${RANDOM_STRING}                  ${result}


Mobile_Facial_authen
    [Arguments]         ${row_gen_qrcode}
    Get_data_excel.Get_data_facial_authen           ${row_gen_qrcode}  
    Set To Dictionary       ${HEADER_FACIAL_AUTHEN}      partner-secret=${GET_PARTNER_SECRET}
    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}
    &{body}=        Create dictionary       cid=${GET_CID}     process_id=${GET_PROCESS_ID}          image_source=${${BASE64}}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_FACIAL_AUTHEN}     headers=&{HEADER_FACIAL_AUTHEN}      json=${body}    expected_status=anything
    Set global variable             ${RESPONSE_CODE}                                  ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                               ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                                ${response.json()["status"]["remark"]}             
    Set global variable             ${SCORE_FACIAL}                                   ${response.json()["data"]["score"]}             
    Set global variable             ${RESPONSE_API}                                   ${response.content}
    Set global variable             ${RESPONSE_USERCODE}           ${response.json()["status"]["user_code"]}             
    Set global variable             ${RESPONSE_USER_EN}            ${response.json()["status"]["user_message_en"]}             
    Set global variable             ${RESPONSE_USER_TH}            ${response.json()["status"]["user_message_th"]}             


Liveness_fail_authen
    [Arguments]         ${row_gen_qrcode}
    Get_data_excel.Get_data_facial_authen           ${row_gen_qrcode}  
    Set To Dictionary       ${HEADER_FACIAL_AUTHEN}      partner-secret=${GET_PARTNER_SECRET}
    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}
    &{body}=        Create dictionary       cid=${GET_CID}       process_id=${GET_PROCESS_ID}      image_source=xxxxxxxxx
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_FACIAL_AUTHEN}     headers=&{HEADER_FACIAL_AUTHEN}      json=${body}    expected_status=anything
    Set global variable             ${RESPONSE_CODE}                                  ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                               ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                                ${response.json()["status"]["remark"]}             
    Set global variable             ${RESPONSE_API}                                   ${response.content}
    Set global variable             ${RESPONSE_USERCODE}           ${response.json()["status"]["user_code"]}             
    Set global variable             ${RESPONSE_USER_EN}            ${response.json()["status"]["user_message_en"]}             
    Set global variable             ${RESPONSE_USER_TH}            ${response.json()["status"]["user_message_th"]}             

    Set global variable             ${SCORE_FACIAL}                                   ${response.json()["data"]["score"]}             


Facial_fail_authen
    [Arguments]         ${row_gen_qrcode}
    Get_data_excel.Get_data_facial_authen           ${row_gen_qrcode}  
    Set To Dictionary       ${HEADER_FACIAL_AUTHEN}      partner-secret=${GET_PARTNER_SECRET}
    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}
    &{body}=        Create dictionary       cid=${GET_CID}       image_source=${FR_AUTHEN_FAIL}          process_id=${GET_PROCESS_ID}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_FACIAL_AUTHEN}     headers=&{HEADER_FACIAL_AUTHEN}      json=${body}    expected_status=anything
    Set global variable             ${RESPONSE_CODE}                                  ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                               ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                                ${response.json()["status"]["remark"]}             
    Set global variable             ${SCORE_FACIAL}                                   ${response.json()["data"]["score"]}             
    Set global variable             ${RESPONSE_USERCODE}           ${response.json()["status"]["user_code"]}             
    Set global variable             ${RESPONSE_USER_EN}            ${response.json()["status"]["user_message_en"]}             
    Set global variable             ${RESPONSE_USER_TH}            ${response.json()["status"]["user_message_th"]}             
