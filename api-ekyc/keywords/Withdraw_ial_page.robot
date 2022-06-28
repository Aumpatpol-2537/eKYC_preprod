***Settings***
Library         Process
Library                 ExcelLibrary
Library                 OperatingSystem
Library         String
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
${PATH_JAR}            tcrb-ekyc-partner-1.8.jar




***Keywords***
withdraw_bio
    [Arguments]     ${input_cidid}           
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Execute Sql String      UPDATE kyc_db.kyc_transaction SET ial_level='' WHERE cid_hash='${input_cidid}' And ial_level='2.3'
    Disconnect From Database



Gen_cid_hash
    [Arguments]         ${cid}
    Run Process     java   -jar     ${PATH_JAR}     hash      ${cid}             file     file      alias=myproc
    ${TextFileContent}          Get File           hashing.txt
    Set global variable         ${GET_CID_HASH}           ${TextFileContent}


