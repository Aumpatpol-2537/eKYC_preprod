***Settings***
Library                 Process
Library                 ExcelLibrary
Library                 OperatingSystem
Library                 DatabaseLibrary

Resource                ../keywords/Sent_SMS(OTP)API_page.robot
Resource                ../keywords/Validate_customer_API_page.robot
Resource                ../keywords/Verify_OTP_API_page.robot

*** Variables ***
${DBHost}         tcrb-bot-pprd-db.cluster-cnu8aurcdwzj.ap-southeast-1.rds.amazonaws.com
${DBName}         bot_v2
${DBPass}         RDBtxjPqaOmrasU4uNi2
${DBPort}         5432
${DBUser}         postgres
${PATH_JAR_PARTNER}       tcrb-ekyc-partner-1.8.jar


***Keywords***
Check_temp_lock
    [Arguments]     ${input_cid_hash}           
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{queryResults_from_cs_info} =  Query    SELECT x.* FROM image_db.customer_facial_lock x WHERE x.cid_hash IN ('${input_cid_hash}') AND x.temporary_lock IN (true)
    ${result_facial_temp_lock}          Get From List                   @{queryResults_from_cs_info}       	2
    Should Be Equal As Strings                 ${result_facial_temp_lock}             True
    Disconnect From Database


Set_Facial_temp_lock
    [Arguments]     ${input_cid_hash}           
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Execute Sql String     UPDATE image_db.customer_facial_lock SET temporary_lock=true WHERE cid_hash='${input_cid_hash}'
    Disconnect From Database


Gen_cid_hash
    [Arguments]         ${cid}
    Run Process     java   -jar     ${PATH_JAR_PARTNER}     hash      ${cid}    file    file      alias=myproc
    ${TextFileContent}          Get File           hashing.txt
    Set global variable         ${GET_CID_HASH}           ${TextFileContent}


Check_facial_temp_lock
    [Arguments]     ${input_cid}        
    Gen_cid_hash                ${input_cid}
    Check_temp_lock             ${GET_CID_HASH}


Unlock_permanance_lock
    [Arguments]     ${input_cid_hash}           
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Execute Sql String      UPDATE image_db.customer_facial_lock SET temporary_unlock_remaining=0,permanent_lock=false WHERE cid_hash='${input_cid_hash}'
    Disconnect From Database

Check_Permanance_lock
    [Arguments]     ${input_cid_hash}           
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{queryResults_from_cs_info} =  Query    SELECT x.* FROM image_db.customer_facial_lock x WHERE x.cid_hash IN ('${input_cid_hash}') AND x.permanent_lock IN (true)
    ${result_facial_temp_lock}          Get From List                   @{queryResults_from_cs_info}       	3
    Should Be Equal As Strings                 ${result_facial_temp_lock}             True
    Disconnect From Database

Check_facial_permananceLock_lock
    [Arguments]                 ${input_cid}        
    Gen_cid_hash                ${input_cid}
    Check_Permanance_lock             ${GET_CID_HASH}


Process_unlock_permanance_Lock
    [Arguments]     ${cid}
    Gen_cid_hash                    ${cid}
    Unlock_permanance_lock          ${GET_CID_HASH}


Process_Set_Facial_temp_lock
    [Arguments]     ${cid}
    Gen_cid_hash                    ${cid}
    Set_Facial_temp_lock                   ${GET_CID_HASH}