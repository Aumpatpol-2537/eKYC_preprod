***Variables***
# ${URL_CORE_SERVICE}               https://tablet.onlinebanking-partner-bottech.com
${URL_CORE_SERVICE}               https://tablet-preprod.onlinebanking-partner-bottech.com
${BOT_CORE_SERVICE}               https://api-preprod.tcrb-onlinebanking-privated-bottech.com

#USER
${ALIAS}                            eKYC
${USER_HEADER}                      automate
${CORRELATION}                      QA
${X-API}                            es59o179ie
${IP}                               192.168.1.1
${LOCATION}                         QA_HOME


&{HEADER_GET_TERM}          X-Correlation-Id=123456789         partner-code=TCRB-TABLET     user=${USER_HEADER}       #Content-Type=application/json         

&{HEADER_CS_VALIDATE}               X-Correlation-Id=qwtge40453df           Content-Type=application/json
...                         user=${USER_HEADER}        Partner-code=TCRB-TABLET     #x-apigw-api-id=n563k38x27

&{HEADER_OTP}               X-Correlation-Id=${CORRELATION}            Content-Type=application/json
...                         user=${USER_HEADER}        Partner-code=TCRB-TABLET     #x-apigw-api-id=${GW_OTP}

&{HEADER_GET_CONSENT}               X-Correlation-Id=${CORRELATION}            Content-Type=application/json
...                         user=${USER_HEADER}        Partner-code=TCRB-TABLET     #x-apigw-api-id=${GW_GETCONSENT}


&{HEADER_CHECK_DOPA}        X-Correlation-Id=qwefewgrehe            Content-Type=application/json
...                         user=${USER_HEADER}        Partner-code=TCRB-TABLET    user=${USER_HEADER}       # x-apigw-api-id=${GW_CHECK_DOPA}

&{HEADER_VALIDATE_IMAGE}        X-Correlation-Id=${CORRELATION}            Content-Type=application/json
...                         user=${USER_HEADER}        Partner-code=TCRB-TABLET             # x-apigw-api-id=${GW_VALIDATE_IMAGE}

&{HEADER_GET_VALUEOTP}          Content-Type=application/json       x-api-key=9AQwX6+NHQgF50V8rT5XMw35

&{HEADER_LOGIN}             X-Correlation-Id=hfverbnykjadwedfasvbetj

&{HEADER_TWIN}                  X-Correlation-Id=123456789999           Content-Type=application/json
...                         user=${USER_HEADER}        Partner-code=TCRB-TABLET     #x-apigw-api-id=n563k38x27

&{HEADER_GENERATE}        X-Correlation-Id=${CORRELATION}            Content-Type=application/json
...                         user=${USER_HEADER}        Partner-code=TCRB-TABLET  

&{HEADER_GEN_QR}               X-Correlation-Id=${CORRELATION}            Content-Type=application/json
...                            partner-code=TCMB       partner-secret=xxxxx      x-apigw-api-id=${X-API}      #user=${USER_HEADER}  

&{HEADER_VALIDATE_QR}          X-Correlation-Id=${CORRELATION}            #Content-Type=application/json
...                            partner-code=TCRB-TABLET            user=${USER_HEADER}  


&{HEADER_API_INTEGRATE_MOBILE}               X-Correlation-Id=aaaaaaaa            #Content-Type=application/json
...                            partner-code=TCMB       partner-secret=ewxwnjcssh      x-apigw-api-id=${X-API}      #user=${USER_HEADER}  

&{HEADER_FACIAL_AUTHEN}               X-Correlation-Id=${CORRELATION}            #Content-Type=application/json
...                            partner-code=TCMB       partner-secret=ewxwnjcssh      x-apigw-api-id=${X-API}      #user=${USER_HEADER}  

&{HEADER_COUNTER_SERVICE}               X-Correlation-Id=${CORRELATION}            Content-Type=application/json
...                            partner-code=CSERV       partner-secret=xxxxx      x-apigw-api-id=${X-API}      #user=${USER_HEADER}  

&{HEADER_PLATFORM_KYC}          X-Correlation-Id=${CORRELATION}            client-ip=${IP}          location=${LOCATION}
...                            partner-code=TCRB-TABLET            user=${USER_HEADER}  


${URI_GET_TERM_AND_CONDITION}           tcrb-platform-kyc/v1/termandcondition
${URI_POST_VALIDATE_CUSTOMER}           tcrb-platform-kyc/v1/validate_customer
${URI_POST_SEND_OTP}                    tcrb-platform-kyc/v1/send_otp
${URI_POST_VERIFY_OTP}                  tcrb-platform-kyc/v1/verify_otp
${URI_GET_CONSENT}                      tcrb-platform-kyc/v1/consent
${URI_POST_CHECK_DOPA}                  tcrb-platform-kyc/v1/dopa
${URI_POST_VALIDATE_IMAGE}              tcrb-platform-kyc/v1/facial
${URI_LOGIN}                            tcrb-platform-kyc/v1/login
${URI_TWIN}                             tcrb-platform-kyc/v1/customer_info
${URI_GENERATE}                         tcrb-platform-kyc/v1/transaction/generate
${URI_GEN_QRCODE}                       tcrb-platform-apipartner/v1/qr/generate
${URI_VALIDATE_QRCODE}                  tcrb-platform-kyc/v1/qr/validate
${URI_LIVENESS_AUTHEN}                  tcrb-platform-apipartner/v1/liveness/authen
${URI_FACIAL_AUTHEN}                    tcrb-platform-apipartner/v1/facial/authen
${URI_FACIAL_LOCK}                      tcrb-platform-apipartner/v1/facial/lock
${URI_SIGNUP_CS_CONFIRM}                tcrb-platform-apipartner/v1/cs/transaction/confirm
${URI_SIGNUP_CS_VALIDATE}               tcrb-platform-apipartner/v1/cs/qr/validate

#GATEWAY
# ${GW_CUSTOMER_VALIDATE}             5a5zw5p4f7
# ${GW_GETCONSENT}                    itfzp9l3rk
# ${GW_OTP}                           5a5zw5p4f7
# ${GW_UNLOCK}                        ann1zf0r05
# ${GW_CHECK_DOPA}                    zn62u0hkbf
# ${GW_VALIDATE_IMAGE}                ouxlce361g
# ${GW_CANCEL}                        mhhmbrb7wj
# ${GW_ADD_CONSENT}                   itfzp9l3rk
