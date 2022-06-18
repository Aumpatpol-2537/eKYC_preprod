*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ../Varriable/varriable.robot
# Suite Setup         Create Session    alias=${ALIAS}    uri=${URL_CORE_SERVICE}

*** Keywords ***
    ${response}=    GET On Session        alias=${ALIAS}          uri=${URI_GET_TERM_AND_CONDITION}      headers=${HEADER_GET_TERM}
    Request Should Be Successful       response=${response}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["transaction_date_time"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["transaction_id"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["agent_id"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["latitude"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["longitude"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["journey"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["first_name"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["last_name"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["cid"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["mobile_no"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["journey_result"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["stage"]}
    Set global variable          ${TRANS_DATE_TIME}             ${response.json()["data"]["reasons"]}
