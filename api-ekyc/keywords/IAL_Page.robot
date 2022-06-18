***Settings***

Library                 ExcelLibrary
Library                 OperatingSystem
Resource                ../keywords/Sent_SMS(OTP)API_page.robot
Resource                ../keywords/Validate_customer_API_page.robot
Resource                ../keywords/Verify_OTP_API_page.robot

*** Variables ***  
# ${DBHost}         tcrb-bot-nprd-db.cluster-ckedyfslvwdh.ap-southeast-1.rds.amazonaws.com
# ${DBName}         bot_v2
# ${DBPass}         &6gh2#5ONWisCQ
# ${DBPort}         5432
# ${DBUser}         postgres

${DBHost}         tcrb-bot-pprd-db.cluster-cnu8aurcdwzj.ap-southeast-1.rds.amazonaws.com
${DBName}         bot_v2
${DBPass}         RDBtxjPqaOmrasU4uNi2
${DBPort}         5432
${DBUser}         postgres



***Keywords***
Check_ial_is_NO
    [Documentation]     Field kyc_tran is 2.2 -- Field cs_info is 2.3
    [Arguments]     ${input_tran_id}            ${cif}
    Connect To Database           ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{queryResults_from_kyc_tran} =  Query    SELECT x.* FROM kyc_db.kyc_transaction x WHERE trans_id = '${input_tran_id}'
    @{queryResults_from_cs_info} =  Query    SELECT x.* FROM kyc_db.customer_info x WHERE cif = '${cif}'

    ${ial_score_from_kyc_tran}          Get From List                   @{queryResults_from_kyc_tran}       	10
    ${ial_score_from_cs_info}           Get From List                   @{queryResults_from_cs_info}       	    18

    Set global variable                 ${SCORE_IAL_KYCTRAN}            ${ial_score_from_kyc_tran}
    Should Be Equal As Strings          ${SCORE_IAL_KYCTRAN}            None
    Set global variable                 ${SCORE_IAL_KYCTRAN}            No
    Set global variable                 ${SCORE_IAL_CS_INFO}            ${ial_score_from_cs_info}
    Should Be Equal As Strings          ${SCORE_IAL_CS_INFO}            None
    Set global variable                 ${SCORE_IAL_CS_INFO}            No

    Disconnect From Database

Check_ial_is_2.1
    [Arguments]     ${input_tran_id}            ${cif}
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{queryResults_from_kyc_tran} =  Query    SELECT x.* FROM kyc_db.kyc_transaction x WHERE trans_id = '${input_tran_id}'
    @{queryResults_from_cs_info} =  Query    SELECT x.* FROM kyc_db.customer_info x WHERE cif = '${cif}'

    ${ial_score_from_kyc_tran}          Get From List                   @{queryResults_from_kyc_tran}       	10
    ${ial_score_from_cs_info}           Get From List                   @{queryResults_from_cs_info}       	    18

    Set global variable                 ${SCORE_IAL_KYCTRAN}            ${ial_score_from_kyc_tran}
    Should Be Equal As Strings          ${SCORE_IAL_KYCTRAN}            2.1
    Set global variable                 ${SCORE_IAL_CS_INFO}            ${ial_score_from_cs_info}
    Should Be Equal As Strings          ${SCORE_IAL_CS_INFO}            2.1

    Disconnect From Database

Check_ial_is_2.2
    [Documentation]     Field kyc_tran is 2.2 -- Field cs_info is 2.3
    [Arguments]     ${input_tran_id}            ${cif}
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{queryResults_from_kyc_tran} =  Query    SELECT x.* FROM kyc_db.kyc_transaction x WHERE trans_id = '${input_tran_id}'
    @{queryResults_from_cs_info} =  Query    SELECT x.* FROM kyc_db.customer_info x WHERE cif = '${cif}'

    ${ial_score_from_kyc_tran}          Get From List                   @{queryResults_from_kyc_tran}       	10
    ${ial_score_from_cs_info}           Get From List                   @{queryResults_from_cs_info}       	    18

    Set global variable                 ${SCORE_IAL_KYCTRAN}            ${ial_score_from_kyc_tran}
    Should Be Equal As Strings          ${SCORE_IAL_KYCTRAN}            2.2
    Set global variable                 ${SCORE_IAL_CS_INFO}            ${ial_score_from_cs_info}
    Should Be Equal As Strings          ${SCORE_IAL_CS_INFO}            2.3

    Disconnect From Database

Check_ial_is_2.2_only
    [Arguments]     ${input_tran_id}            ${cif}
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{queryResults_from_kyc_tran} =  Query    SELECT x.* FROM kyc_db.kyc_transaction x WHERE trans_id = '${input_tran_id}'
    @{queryResults_from_cs_info} =  Query    SELECT x.* FROM kyc_db.customer_info x WHERE cif = '${cif}'

    ${ial_score_from_kyc_tran}          Get From List                   @{queryResults_from_kyc_tran}       	10
    ${ial_score_from_cs_info}           Get From List                   @{queryResults_from_cs_info}       	    18

    Set global variable                 ${SCORE_IAL_KYCTRAN}            ${ial_score_from_kyc_tran}
    Should Be Equal As Strings          ${SCORE_IAL_KYCTRAN}            2.2
    Set global variable                 ${SCORE_IAL_CS_INFO}            ${ial_score_from_cs_info}
    Should Be Equal As Strings          ${SCORE_IAL_CS_INFO}            2.2

    Disconnect From Database


Check_ial_is_2_3
    [Arguments]     ${input_tran_id}            #${cif}
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{queryResults_from_kyc_tran} =  Query    SELECT x.* FROM kyc_db.kyc_transaction x WHERE trans_id = '${input_tran_id}'
    # @{queryResults_from_cs_info} =  Query    SELECT x.* FROM kyc_db.customer_info x WHERE cif = '${cif}'

    ${ial_score_from_kyc_tran}          Get From List                   @{queryResults_from_kyc_tran}       	9
    # ${ial_score_from_cs_info}           Get From List                   @{queryResults_from_cs_info}       	    18

    Set global variable                 ${SCORE_IAL_KYCTRAN}            ${ial_score_from_kyc_tran}
    # Should Be Equal As Strings          ${SCORE_IAL_KYCTRAN}            2.3
    # Set global variable                 ${SCORE_IAL_CS_INFO}            ${ial_score_from_cs_info}
    # Should Be Equal As Strings          ${ial_score_from_cs_info}       2.3

    Disconnect From Database
# SELECT x.* FROM kyc_db.kyc_transaction x WHERE x.trans_id IN ('EU2021102000036')

