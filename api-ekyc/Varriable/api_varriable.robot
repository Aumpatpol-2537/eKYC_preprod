# ***Variables***
# &{HEADER_GET_TERM}          X-Correlation-Id=${CORRELATION}       Content-Type=application/json           x-apigw-api-id=5a5zw5p4f7
# ...                         Partner-code=TCRB-TABLET            user=${USER_HEADER}

# &{HEADER_CS_VALIDATE}               X-Correlation-Id=${CORRELATION}           Content-Type=application/json
# ...                         user=${USER_HEADER}        Partner-code=TCRB-TABLET     x-apigw-api-id=${GW_CUSTOMER_VALIDATE}

# &{HEADER_GET_CONSENT}               X-Correlation-Id=${CORRELATION}            Content-Type=application/json
# ...                         user=${USER_HEADER}        partner=partnern     x-apigw-api-id=${GW_GETCONSENT}

# &{HEADER_OTP}               X-Correlation-Id=${CORRELATION}            Content-Type=application/json
# ...                         user=${USER_HEADER}        Partner-code=TCRB-TABLET     x-apigw-api-id=${GW_OTP}

# &{HEADER_UNLOCK}            X-Correlation-Id=${CORRELATION}            Content-Type=application/json
# ...                         user=${USER_HEADER}        partner=partnern     x-apigw-api-id=${GW_UNLOCK}

# &{HEADER_CANCEL_TRANS}      X-Correlation-Id=${CORRELATION}            Content-Type=application/json
# ...                         user=${USER_HEADER}        partner=partnern     x-apigw-api-id=${GW_CANCEL}

# &{HEADER_CHECK_DOPA}        X-Correlation-Id=${CORRELATION}            Content-Type=application/json
# ...                         user=${USER_HEADER}        partner=partnern     x-apigw-api-id=${GW_CHECK_DOPA}

# &{HEADER_VALIDATE_IMAGE}        X-Correlation-Id=${CORRELATION}            Content-Type=application/json
# ...                         user=${USER_HEADER}        partner=partnern     x-apigw-api-id=${GW_VALIDATE_IMAGE}

# &{HEADER_LIVENESS}          X-Correlation-Id=${CORRELATION}            Content-Type=application/json
# ...                         user=${USER_HEADER}        partner=partnern     x-apigw-api-id=${GW_VALIDATE_IMAGE}    

# &{HEADER_FACEREC}           X-Correlation-Id=${CORRELATION}            Content-Type=application/json
# ...                         user=${USER_HEADER}        partner=partnern     x-apigw-api-id=${GW_VALIDATE_IMAGE} 

# &{HEADER_ADD_CONSENT}        X-Correlation-Id=${CORRELATION}            Content-Type=application/json
# ...                         user=${USER_HEADER}        partner=partnern     x-apigw-api-id=${GW_ADD_CONSENT}

# &{HEADER_GET_VALUEOTP}          Content-Type=application/json       x-api-key=TaJdHdHWxyjueyo3j2Ohygdb 




# ${ALIAS}                            eKYC
# ${URL_CORE_SERVICE}                 https://api-dev.tcrb-onlinebanking-privated-bottech.com

# #USER
# ${USER_HEADER}                      automate
# ${CORRELATION}                      automate

# #GATEWAY
# ${GW_CUSTOMER_VALIDATE}             5a5zw5p4f7
# ${GW_GETCONSENT}                    itfzp9l3rk
# ${GW_OTP}                           5a5zw5p4f7
# ${GW_UNLOCK}                        ann1zf0r05
# ${GW_CHECK_DOPA}                    zn62u0hkbf
# ${GW_VALIDATE_IMAGE}                ouxlce361g
# ${GW_CANCEL}                        mhhmbrb7wj
# ${GW_ADD_CONSENT}                   itfzp9l3rk


# # URI_Request_CORE_SERVICE               
# ${URI_GET_TERM_AND_CONDITION}      tcrb-platform-transaction/v1/termandconditions
# ${URI_POST_VALIDATE_CUSTOMER}      tcrb-platform-transaction/v1/customers
# ${URI_GET_CONSENT}                 tcrb-private-econsent/v1/econsent/get_purpose?purposeId=94349b48-2a11-4d5b-966d-1c4d32910504
# ${URI_POST_SEND_OTP}               tcrb-platform-transaction/v1/messages/send_otp
# ${URI_POST_VERIFY_OTP}             tcrb-platform-transaction/v1/messages/verify_otp
# ${URI_POST_CHECK_DOPA}             tcrb-platform-transaction/v1/dopa
# ${URI_POST_VALIDATE_IMAGE}         tcrb-platform-transaction/v1/facial

# ${URI_POST_LIVENESS}               tcrb-platform-facial/v1/images/liveness
# ${URI_POST_FACEREC}                tcrb-platform-facial/v1/images/face_recognition

