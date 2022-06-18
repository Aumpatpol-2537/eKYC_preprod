***Settings***

***Variables***

#### FR+LN  ####
${FR_LN_SUCCESS}                success
${LN_TIMEOUT}                   livenesstimeout
${LN_LOW_SCORE}                 low_score
${FR_TIMEOUT}                   facetimeout
${FR_LOW_SCORE}                 fr_low_score


${LN_FAIL}                      fail
${LN_DETECT_FAIL}               Liveness Detect Failed
${RETURN_LN_TIME_OUT}           Request Timeout
${RETURN_FACERECFAIL}           Face Match Failed

#FILENAME Excel
${FILE_NAME}                  ../eKYC_preprod/api-ekyc/[QA]eKYC_TEST_Doc_Version 1.5.xlsx
${FILE_NAME_QR}               ../eKYC_preprod/api-ekyc/Automate_test_QR_code_jouney.xlsx
${FILE_CS}                    ../eKYC_preprod/api-ekyc/Counter_service.xlsx  



####RESPONSE
${RESPONSE_CODE_SUCCESS}                            0
# ${RESPONSE_MESSAGE_GET_TERM}                        Success
${RESPONSE_MESSAGE_SUCCESS}                         Success
${RESPONSE_MESSAGE_SUCCESS_DOPA}                    success
${RESPONSE_REMARK_NULL}                             None
${RESPONSE_TRANS_ID}                                EU2021012100001
${RESPONSE_DOPA_STATUS}                             0
${RESPONSE_DOPA_MESSAGE}                            สถานะปกติ
${RESPONSE_TYPE}                                    null
${RESPONSE_TYPE_eCONSENT}                           C
${RESPONSE_ECONSENT_VERSION}                        1.0
${RESPONSE_CONTENT}                                 KYC term and condition content.

${RESPONSE_CONTENT_GET_TERM}                        KYC term and condition content
${RESPONSE_CONTENT_GET_CONSENT}                     KYC Consent content.

${RESPONSE_PURPOSE_NAME_GET_TERM}                   Term and Condition
${RESPONSE_PURPOSE_NAME_GET_CONSENT}                Consent

${RESPONSE_MOBILE_NO}                               08XXXXXXXX
${RESPONSE_SEND_OTP_TESULT}                         True
${RESPONSE_OTP_REF}                                 XXXXX
${RESPONSE_ONETRUST_VERSION}                        1.0
${RESPONSE_VERIFY_RESULT}                           True
${RESPONSE_}
${RESPONSE_LIVENESS_SCORE}                         86.53
${RESPONSE_CID_IMAGE}                              image/base64


${RESPONSE_DATA_NULL}                               null
#Error Code
####RESPONSE
${RESPONSE_CODE_SUCCESS}                            0
${RESPONSE_MESSAGE_SUCCESS}                         success
${RESPONSE_REMARK_NULL}                             null
${RESPONSE_TRANS_ID}                                EU2021012100001
${RESPONSE_DOPA_STATUS}                             0
${RESPONSE_DOPA_MESSAGE}                            สถานะปกติ
${RESPONSE_TYPE}                                    T
${RESPONSE_ECONSENT_VERSION}                        1.0

${RESPONSE_DOPA_STATUS_ERROR_CHIP_NO}               1                        
${RESPONSE_DOPA_MESSAGE_ERROR_CHIP_NO}              Chip No สถานะไม่ปกติ       
                                                
${RESPONSE_DOPA_STATUS_CARD_EXPIRE}                 2                       
${RESPONSE_DOPA_MESSAGE_CARD_EXPIRE}                บัตรสิ้นสภาพการใช้งาน เนื่องจากกรณี  บัตรหมดอายุ

${RESPONSE_DOPA_STATUS_CARD_NOT_FOUND_LASER_CODE}   4                           
${RESPONSE_DOPA_MESSAGE_CARD_NOT_FOUND_LASER_CODE}  ไม่พบเลข Laser จาก PID นี้     

${RESPONSE_DOPA_STATUS_CARD_LOSS_DATA}              5                            
${RESPONSE_DOPA_MESSAGE_CARD_LOSS_DATA}             ข้อมูลที่ใช้ในการตรวจสอบไม่ครบ     

${RESPONSE_CONTENT_GET_TERM}                        KYC term and condition content
${RESPONSE_CONTENT_GET_CONSENT}                     KYC consent content

${RESPONSE_PURPOSE_NAME_GET_TERM}                   Term and Condition
${RESPONSE_PURPOSE_NAME_GET_CONSENT}                Consent

${RESPONSE_MOBILE_NO}                               08XXXXXXXX
${RESPONSE_SEND_OTP_TESULT}                         true
${RESPONSE_OTP_REF}                                 XXXXX
${RESPONSE_ONETRUST_VERSION}                        1.0
${RESPONSE_VERIFY_RESULT}                           true
${RESPONSE_}
${RESPONSE_LIVENESS_SCORE}                         86.53
${RESPONSE_CID_IMAGE}                              image/base64


${RESPONSE_DATA_NULL}                               null
#Error Code
${RESPONSE_CODE_FAIL}                               -1
${RESPONSE_MESSAGE_FAIL}                            fail

${RESPONSE_CODE_INVALID_PARAM}                      1001                          #HTTP400
${RESPONSE_MESSAGE_INVALID_PARAM}                   Invalid Parameter


${RESPONSE_REMARK_INVALID_PARAM_SEND_OTP_BLANK_FIELD_MOBILE_NO}     mobile_no must be numeric and 10 digits  
${RESPONSE_REMARK_INVALID_PARAM_SEND_OTP_BLANK_FIELD_TRANS_ID}      kyc_trans_id is empty.    
${RESPONSE_CODE_DATA_NOT_FOUND}                     1002                              #HTTP200
${RESPONSE_MESSAGE_1002}                            Data Not Found
${RESPONSE_REMARK_1002}                             not have term and condition in database       
${RESPONSE_REMARK_CIF_NOT_FOUND}                    CIF not found.                                
${RESPONSE_REMARKG_MOBILE_NUMBER_NOT_FOUND}         Mobile number not found.                      

${RESPONSE_CODE_NOT_FOUND}                          1003                              #HTTP404    
${RESPONSE_MESSAGE_1003}                            Not Found                                     
${RESPONSE_REMARK_1003}                             Url not found or missing parameter.           



${RESPONSE_CODE_REQUEST_TIMEOUT}                    1004                              #HTTP408
${RESPONSE_MESSAGE_1004}                            Request Timeout

${RESPONSE_CODE_OTP_NOT_MATCH}                      2001                              #HTTP200
${RESPONSE_MESSAGE_2001}                            OTP value not match

${RESPONSE_CODE_OTP_TRAL_MAX_TIME}                  2002                              #HTTP200
${RESPONSE_MESSAGE_2002}                            OTP trial reached maximum times

${RESPONSE_CODE_OTP_EXPIRED}                        2003                              #HTTP200
${RESPONSE_MESSAGE_2003}                            OTP has expired

${RESPONSE_CODE_OTP_RESEND_MAX_TIME}                2004                              #HTTP200
${RESPONSE_MESSAGE_2004}                            OTP resend reached maximum times

${RESPONSE_CODE_TRANS_CAN_NOT_PROCESSED}            2005                              #HTTP200
${RESPONSE_MESSAGE_2005}                            Transaction can not be processed
${RESPONSE_REMARK_2005}

${RESPONSE_CODE_DOPA_FAIL}                          2006                              #HTTP200
${RESPONSE_MESSAGE_2006}                            DOPA Fail
${RESPONSE_MESSAGE_2006_2}                            Check DOPA fail

${RESPONSE_CODE_DOPA_OFFLINE}                       2007                              #HTTP200
${RESPONSE_MESSAGE_2007}                            DOPA Offline

${RESPONSE_CODE_LIVENESS_REACHED_MAX_TIME}          2008                              #HTTP200
${RESPONSE_MESSAGE_2008}                            Liveness reached maximum times
${RESPONSE_REMARK_2008}

${RESPONSE_CODE_LIVENESS_DETECT_FAILED}             2009                              #HTTP200
${RESPONSE_MESSAGE_2009}                            Liveness Detect Failed

${RESPONSE_CODE_FACE_MATCH_REACHED_MAX_TIME}        2010                              #HTTP200
${RESPONSE_MESSAGE_2010}                            Face Match reached maximum times
${RESPONSE_REMARK_2010}

${RESPONSE_CODE_FACE_MATCH_FAILED}                  2011                              #HTTP200
${RESPONSE_MESSAGE_2011}                            Face Match Failed

${RESPONSE_CODE_SYSTEM_ERROR}                       5001                              #HTTP500
${RESPONSE_MESSAGE_5001}                            System Error



