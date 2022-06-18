*** Settings ***
# Suite Setup       Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
# Suite Teardown    Disconnect From Database
Library           DatabaseLibrary
Library           OperatingSystem
Library           Collections
Library             BuiltIn
Library         JSONLibrary

# *** Variables ***
# ${DBHost}         tcrb-bot-nprd-db.cluster-ckedyfslvwdh.ap-southeast-1.rds.amazonaws.com
# ${DBName}         bot_v2
# ${DBPass}         &6gh2#5ONWisCQ
# ${DBPort}         5432
# ${DBUser}         postgres


***Keywords***
Getdata_From_database
    [Arguments]     ${trans_id_for_search}
    @{queryResults} =    Query      SELECT x.* FROM kyc_db.kyc_transaction x WHERE x.trans_id IN ('${trans_id_for_search}')
    ${get_cid}              Get From List        @{queryResults}       	2

    @{queryResults_2} =    Query        SELECT x.* FROM customer_db.customer x WHERE x.customer_id IN ('${get_cid}')
    ${get_idcard}               Get From List           @{queryResults_2}       	1
    ${get_bd}                   Get From List           @{queryResults_2}       	3
    ${getaddress}               Get From List           @{queryResults_2}           4
    ${get_cif}                  Get From List           @{queryResults_2}           6

    ${json}                     Convert String to JSON      ${getaddress}
    ${value_sex}                Get Value From Json	        ${json}       $..sex    
    ${value_alley}              Get Value From Json	        ${json}       $..alley
    ${value_district}           Get Value From Json	        ${json}       $..district
    ${value_house_no}           Get Value From Json	        ${json}       $..houseNo
    ${value_lane}               Get Value From Json	        ${json}       $..lane
    ${value_moo}                Get Value From Json	        ${json}       $..moo
    ${value_road}               Get Value From Json	        ${json}       $..road
    ${value_province}           Get Value From Json	        ${json}       $..province
    ${value_sub_district}       Get Value From Json	        ${json}       $..subDistrict

    Set Test variable      ${value_sex}                 ${value_sex[0]}
    Set Test variable      ${value_alley}               ${value_alley[0]}
    Set Test variable      ${value_district}            ${value_district[0]}
    Set Test variable      ${value_house_no}            ${value_house_no[0]}
    Set Test variable      ${value_lane}                ${value_lane[0]}
    Set Test variable      ${value_moo}                 ${value_moo[0]}
    Set Test variable      ${value_road}                ${value_road[0]}
    Set Test variable      ${value_province}            ${value_province[0]}
    Set Test variable      ${value_sub_district}        ${value_sub_district[0]}

    @{queryResults_3} =    Query        SELECT x.* FROM customer_db.customer_translation x WHERE x.customer_id IN ('${get_cid}') AND x.language_code IN ('th')
    @{queryResults_4} =    Query        SELECT x.* FROM customer_db.customer_translation x WHERE x.customer_id IN ('${get_cid}') AND x.language_code IN ('en')

    Set global variable             ${SAVE_IDCARD}                      ${get_idcard}
    Set global variable             ${SAVE_BD}                          ${get_bd}
    Set global variable             ${SAVE_NAME_TH}                     ${queryResults_3[0][4]}
    Set global variable             ${SAVE_LASTNAME_TH}                 ${queryResults_3[0][5]}
    Set global variable             ${SAVE_NAME_EN}                     ${queryResults_4[0][4]}
    Set global variable             ${SAVE_LASTNAME_EN}                 ${queryResults_4[0][5]}
    Set global variable             ${SAVE_SEX}                         ${value_sex}
    Set global variable             ${SAVE_CIF}                         ${get_cif}

    Set global variable             ${SAVE_HOUSENO}                     ${value_house_no}
    Set global variable             ${SAVE_ALLEY}                       ${value_alley}
    Set global variable             ${SAVE_DISTRICT}                    ${value_district}
    Set global variable             ${SAVE_LANE}                        ${value_lane}
    Set global variable             ${SAVE_MOO}                         ${value_moo}
    Set global variable             ${SAVE_PROVINCE}                    ${value_province}
    Set global variable             ${SAVE_SUBDISTRICT}                 ${value_sub_district}
    Set global variable             ${SAVE_ROAD}                        ${value_road}
