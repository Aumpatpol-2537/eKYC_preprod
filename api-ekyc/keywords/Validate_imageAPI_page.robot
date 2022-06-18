*** Settings ***
Library             RequestsLibrary
Library             Collections
# Suite Setup         Create Session    alias=${ALIAS}    uri=${URL_CORE_SERVICE}

*** Keywords ***
Liveness_FaceRec_Success
    ${body}=        To Json      {"image_source": "success", "kyc_trans_id": "${TRANS_ID}"}
    ${response}=    POST On Session     alias=${ALIAS}     uri=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    # Request Should Be Successful    response=${response}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}         ${RESPONSE_CODE_SUCCESS}
    Should Be Equal                 ${response.json()["status"]["message"]}      ${RESPONSE_MESSAGE_SUCCESS}
    # Should Be Equal                 ${response.json()["status"]["remark"]}       ${RESPONSE_REMARK_NULL}
    # Should Be Equal                 ${response.json()["data"]}                      ${RESPONSE_REMARK_NULL}

Liveness_Low_Score
    ${body}=        To Json      {"image_source": "low_score", "kyc_trans_id": "${TRANS_ID}"}
    ${response}=    POST On Session     alias=${ALIAS}     uri=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    # Request Should Be Successful    response=${response}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}         ${RESPONSE_CODE_LIVENESS_DETECT_FAILED}
    Should Be Equal                 ${response.json()["status"]["message"]}      ${RESPONSE_MESSAGE_2009}
    # Should Be Equal                 ${response.json()["status"]["remark"]}       ${RESPONSE_REMARK_NULL}
    # Should Be Equal                 ${response.json()["data"]}                      ${RESPONSE_REMARK_NULL}

FR_Low+Score
    ${body}=        To Json      {"image_source": "fr_low_score", "kyc_trans_id": "${TRANS_ID}"}
    ${response}=    POST On Session     alias=${ALIAS}     uri=${URI_POST_VALIDATE_IMAGE}    headers=&{HEADER_VALIDATE_IMAGE}    json=${body}
    # Request Should Be Successful    response=${response}
    Should Be Equal As Integers     ${response.json()["status"]["code"]}         ${RESPONSE_CODE_LIVENESS_DETECT_FAILED}
    Should Be Equal                 ${response.json()["status"]["message"]}      ${RESPONSE_MESSAGE_2009}
    # Should Be Equal                 ${response.json()["status"]["remark"]}       ${RESPONSE_REMARK_NULL}
    # Should Be Equal                 ${response.json()["data"]}                      ${RESPONSE_REMARK_NULL}
