*** Settings ***
Library          RequestsLibrary
Library         Process

Resource            ../Varriable/varriable.robot
Resource            ../keywords/Get_data_excel.robot
Resource            ../Varriable/img.robot

***Variables***
${PATH_JAR_CS}          tcrb-ekyc-partner-1.8.jar




***Keywords***
Validate_Sign_up_CS
    [Arguments]         ${row}
    Generate_Partner_Secret_CS
    Set To Dictionary                       ${HEADER_COUNTER_SERVICE}      partner-secret=${GET_PARTNER_SECRET_CS}
    Get_data_excel.Get_Data_Counter_Service          ${row}
    Create Session          alias=${ALIAS}    url=${BOT_CORE_SERVICE}

    Encrypt_data_counter_service          { "qr": "${QR_VALUE}", "trans_ref": "${GET_TRANS_REF}", "cid": "${GET_CID}" }
    # Encrypt_data_counter_service          { "qr": "2431527657620570292206570", "trans_ref": "${GET_TRANS_REF}", "cid": "${GET_CID}" }

    &{body}=        Create dictionary       data=${RESULT_ENCRYPT_DATA} 
    ${response}=    POST On Session         alias=${ALIAS}     url=${URI_SIGNUP_CS_VALIDATE}     headers=&{HEADER_COUNTER_SERVICE}      json=${body}    expected_status=anything
    Set global variable             ${RESPONSE_CODE}                     ${response.json()["status"]["code"]}             
    Set global variable             ${RESPONSE_MESSAGE}                  ${response.json()["status"]["message"]}             
    Set global variable             ${RESPONSE_REMARK}                   ${response.json()["status"]["remark"]}             
    Set global variable             ${RESPONSE_API}                      ${response.content}
    Set global variable             ${RESPONSE_USERCODE}                 ${response.json()["status"]["user_code"]}             
    Set global variable             ${RESPONSE_USER_EN}                  ${response.json()["status"]["user_message_en"]}             
    Set global variable             ${RESPONSE_USER_TH}                  ${response.json()["status"]["user_message_th"]}             
    Set global variable             ${TRANS_ID}                          ${response.json()["data"]["kyc_trans_id"]}             


Confirmation_Sign_up_CS
    Generate_Partner_Secret_CS
    Set To Dictionary       ${HEADER_COUNTER_SERVICE}      partner-secret=${GET_PARTNER_SECRET_CS}
    Create Session          alias=${ALIAS}        url=${BOT_CORE_SERVICE}


    Encrypt_data_counter_service      { "trans_ref" : "${GET_TRANS_REF}", "cid" : "${GET_CID}", "title_th" : "นาย", "title_en" : "Mr.", "first_name_th" : "พัชรพล", "first_name_en" : "Patcharapol", "middle_name_th" : "", "middle_name_en" : "", "last_name_th" : "ศุภศิริรัตน์", "last_name_en" : "Supasirirat", "house_no" : "425", "moo" : "1", "alley" : "", "lane" : "", "road" : "Navamin", "sub_district" : "", "district" : "Klongkum", "province" : "buengkum", "sex" : "male", "birth_date" : "27-07-2537", "date_of_issue" : "04-06-2559", "expired_date" : "26-07-2567", "issue_by" : "", "request_no" : "", "image_id_card" : "${${GET_IMG_ID_CARD}}", "image_identify" : "${${GET_SELFIE}}", "compare_score" : "${GET_IMG_SCORE}", "dopa_pass" : true , "timestamp" : "2022-03-28 16:34:00" }

    &{body}=        Create dictionary       data=${RESULT_ENCRYPT_DATA} 
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_SIGNUP_CS_CONFIRM}     headers=&{HEADER_COUNTER_SERVICE}      json=${body}    expected_status=anything
    # Set global variable             ${RESPONSE_CODE}                     ${response.json()["status"]["code"]}             
    # Set global variable             ${RESPONSE_MESSAGE}                  ${response.json()["status"]["message"]}             
    # Set global variable             ${RESPONSE_REMARK}                   ${response.json()["status"]["remark"]}             

Encrypt_data_counter_service
    [Arguments]         ${data}
    Create_File_txt             ${data}
    Run Process     java   -jar     ${PATH_JAR_CS}      CSERV     encrypt      input_data.txt    preprod   file   file      alias=myproc
    Counter_service_page.Read_File_Encrypt           partner_encrypt.txt

Create_File_txt
    [Arguments]         ${data_for_save}
    Create File         input_data.txt           ${data_for_save}


Read_File_Encrypt
    [Arguments]                 ${data_encrypt_file}
    ${TextFileContent}          Get File           ${data_encrypt_file}
    Set global variable         ${RESULT_ENCRYPT_DATA}           ${TextFileContent}


Generate_Partner_Secret_CS
    Run Process     java      -jar    ${PATH_JAR_CS}     CSERV    partner-secret   preprod   file   file    alias=myproc
    ${TextFileContent}          Get File           partner_secret.txt
    Set global variable         ${GET_PARTNER_SECRET_CS}           ${TextFileContent}
