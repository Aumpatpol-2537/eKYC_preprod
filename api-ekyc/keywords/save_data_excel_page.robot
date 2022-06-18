***Settings***
Library                 ExcelLibrary
Library                 OperatingSystem
Library                 BuiltIn
Resource                ../keywords/Sent_SMS(OTP)API_page.robot
Resource                ../keywords/Validate_customer_API_page.robot
Resource                ../keywords/Verify_OTP_API_page.robot
Resource                ../keywords/Get_data_from_database_page.robot
# Resource                ../keywords/Jira_api_page.robot

***Variables***
${ROW_SUCCESS}				4
${ROW_eKYC_45}				5
${ROW_eKYC_106}				6
${ROW_eKYC_107}				8
${ROW_eKYC_108}				9
${ROW_eKYC_64}              7
${ROW_eKYC_110}             10
${ROW_3x3}                  10


***Keywords***
Save_scene_happy
    [Arguments]     ${row_save}         ${otp_row}
    ${ignore}   Run Keyword And Ignore Error        Save_eKYC_Report                ${row_save}         ${otp_row}

Save_Facial_Happy
    [Arguments]     ${row}      ${row_facial}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    # Getdata_From_database            ${TRANS_ID}
    Write Excel Cell	        row_num=${row}	    col_num=19      value=${MOBILE_NO}                      sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=17      value=${TRANS_ID}                       sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=22      value=${DOPA_MESSAGE}                    sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=18      value=${GETTERM_RESPONES_MESSAGE}       sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=23      value=${LN_FR_RESPONE_MESSAGE}          sheet_name=eKYC-HAPPY
    # Write Excel Cell	        row_num=${row}	    col_num=35      value=${LN_FR_RESPONE_MESSAGE}          sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=20      value=${CONSENT_MESSAGE}          sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=25      value=${TEST STATUS}          sheet_name=eKYC-HAPPY
    ## OTP ##
    Write Excel Cell	        row_num=${row}	    col_num=21      value=${RESULT_OTP_STATUS}          sheet_name=eKYC-HAPPY
    # Write Excel Cell	        row_num=${row_otp}	    col_num=6      value=${TRANS_ID}          sheet_name=OTP
    # Write Excel Cell	        row_num=${row_otp}	    col_num=7      value=${MOBILE_NO}          sheet_name=OTP
    # Write Excel Cell	        row_num=${row_otp}	    col_num=22      value=${TEST STATUS}          sheet_name=OTP

    ### Sheet DOPA ###
    # Write Excel Cell	        row_num=${row}	    col_num=6      value=${DOPA_MESSAGE}        sheet_name=DOPA
    # Write Excel Cell	        row_num=${row}	    col_num=7      value=${DOPA_REMARK}        sheet_name=DOPA
    # Write Excel Cell	        row_num=${row}	    col_num=3      value=${TRANS_ID}            sheet_name=DOPA

    ### LN+FR ###
    Write Excel Cell	        row_num=${row_facial}	    col_num=12      value=${TEST STATUS}        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row_facial}	    col_num=5      value=${TRANS_ID}            sheet_name=Liveness&FaceREC

    ## IAL ##
    # Write Excel Cell	        row_num=${row}	    col_num=36      value=${SCORE_IAL_KYCTRAN}            sheet_name=eKYC-HAPPY
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	

Save_eKYC_Happy-01
    [Arguments]         ${abc}
    ${ignore}   Run Keyword And Ignore Error        Save_eKYC_Report                    ${abc}      ${abc}   #save report sheet eKYC Happy
    Save_Final_result_PASS_FAIL         ${abc}    #save  status PASS/FAIL
    Save_Result_OTP_Happy               ${abc}     #save result ของ OTP
    

Save_Unhappy_Validate_Customer_API
    [Arguments]         ${abc}
    ${ignore}   Run Keyword And Ignore Error        Save_Final_result_UNHAPPY_PASS_FAIL_VALIDATE_CUSTOMER         ${abc}    #save  status PASS/FAIL


Save_eKYC_Report
    [Arguments]     ${row}      ${row_otp}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    # Getdata_From_database            ${TRANS_ID}
    Write Excel Cell	        row_num=${row}	    col_num=19      value=${MOBILE_NO}                      sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=17      value=${TRANS_ID}                       sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=22      value=${DOPA_MESSAGE}                    sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=18      value=${GETTERM_RESPONES_MESSAGE}       sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=23      value=${LN_FR_RESPONE_MESSAGE}          sheet_name=eKYC-HAPPY
    # Write Excel Cell	        row_num=${row}	    col_num=35      value=${LN_FR_RESPONE_MESSAGE}          sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=25      value=${TEST STATUS}          sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=20      value=${CONSENT_MESSAGE}          sheet_name=eKYC-HAPPY

    ## OTP ##
    Write Excel Cell	        row_num=${row}	    col_num=21      value=${RESULT_OTP_STATUS}          sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row_otp}	    col_num=6      value=${TRANS_ID}          sheet_name=OTP
    Write Excel Cell	        row_num=${row_otp}	    col_num=7      value=${MOBILE_NO}          sheet_name=OTP
    Write Excel Cell	        row_num=${row_otp}	    col_num=22      value=${TEST STATUS}          sheet_name=OTP

    ### Sheet DOPA ###
    Write Excel Cell	        row_num=${row}	    col_num=6      value=${DOPA_MESSAGE}        sheet_name=DOPA
    Write Excel Cell	        row_num=${row}	    col_num=7      value=${DOPA_REMARK}        sheet_name=DOPA
    Write Excel Cell	        row_num=${row}	    col_num=3      value=${TRANS_ID}            sheet_name=DOPA

    ### LN+FR ###
    Write Excel Cell	        row_num=${row}	    col_num=12      value=${TEST STATUS}        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=5      value=${TRANS_ID}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=11      value=${MESS_STATUS}            sheet_name=Liveness&FaceREC
    ## IAL ##
    Write Excel Cell	        row_num=${row}	    col_num=24      value=${SCORE_IAL_KYCTRAN}            sheet_name=eKYC-HAPPY
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	

Save_Result_OTP_Happy
    [Documentation]     SUPPORT Success
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=otp_doc
    Write Excel Cell            row_num=${row}	    col_num=6      value=${TRANS_ID}                 sheet_name=OTP
    Write Excel Cell            row_num=${row}	    col_num=7      value=${MOBILE_NO}                sheet_name=OTP
    Write Excel Cell            row_num=${row}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Write Excel Cell            row_num=${row}	    col_num=13      value=${VALUE_OTP}                sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Final_result_PASS_FAIL
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    Write Excel Cell	        row_num=${row}	    col_num=25      value=${TEST STATUS}                    sheet_name=eKYC-HAPPY
    Write Excel Cell	        row_num=${row}	    col_num=22      value=${TEST STATUS}                    sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	

Save_Final_result_UNHAPPY_PASS_FAIL
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    Write Excel Cell	        row_num=${row}	    col_num=37      value=${TEST STATUS}                    sheet_name=eKYC-UNHAPPY
    # Write Excel Cell	        row_num=${row}	    col_num=22      value=${TEST STATUS}                    sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	

Save_Final_result_UNHAPPY_PASS_FAIL_VALIDATE_CUSTOMER
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    Write Excel Cell	        row_num=${row}	    col_num=17      value=${ERROR_VALIDATE}                 sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=25      value=${TEST STATUS}                    sheet_name=eKYC-UNHAPPY
    # Write Excel Cell	        row_num=${row}	    col_num=30      value=${MOBILE_NO}                      sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=18      value=${GETTERM_RESPONES_MESSAGE}       sheet_name=eKYC-UNHAPPY

    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	


Save_Final_Result_to_excel
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc1
    ${data}     Write Excel Cell	        row_num=${row}	    col_num=22      value=${TEST STATUS}        sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	

Save_Unhappy_OTP
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc1
    Write Excel Cell	        row_num=${row}	    col_num=22      value=${TEST STATUS}                sheet_name=OTP
    Write Excel Cell	        row_num=${row}	    col_num=19      value=${MOBILE_NO}                      sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=17      value=${TRANS_ID}                       sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=25      value=${TEST STATUS}                    sheet_name=eKYC-UNHAPPY
    ${11ignore}   Run Keyword And Ignore Error        Write Excel Cell	        row_num=${row}	    col_num=21      value=${RESPONSE_MESSAGE_SENTOTP}             sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=20      value=${CONSENT_MESSAGE}          sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=18      value=${GETTERM_RESPONES_MESSAGE}       sheet_name=eKYC-UNHAPPY


    ## OTP ##
    ${ignore}   Run Keyword And Ignore Error        Write Excel Cell	        row_num=${row}	    col_num=21      value=${RESULT_OTP_STATUS}          sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=6      value=${TRANS_ID}          sheet_name=OTP
    Write Excel Cell	        row_num=${row}	    col_num=7      value=${MOBILE_NO}          sheet_name=OTP
    Write Excel Cell	        row_num=${row}	    col_num=22      value=${TEST STATUS}          sheet_name=OTP

    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	

Save_Happy_to_excel
    [Arguments]     ${happy_row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data}         Write Excel Cell	        row_num=${happy_row}	    col_num=38      value=${TEST STATUS}        sheet_name=eKYC-HAPPY
    ${data2}        Write Excel Cell            row_num=${happy_row}	    col_num=20      value=${TRANS_ID}           sheet_name=eKYC-HAPPY
    Log             ${TRANS_ID}
    Log             ${TEST STATUS}
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	

##########################################Support eKYC_106########################################

Save_Result_non_action_eKYC_106_1
    [Documentation]     SUPPORT eKYC_106
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_106}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_non_action_eKYC_106_2
    [Documentation]     SUPPORT eKYC_106
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_106}	    col_num=14      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_eKYC_106_1
    [Documentation]     SUPPORT eKYC_106
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_106}	    col_num=16      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_106}	    col_num=17      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}              sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents

Save_Result_Error3times_eKYC_106_2
    [Documentation]     SUPPORT eKYC_106
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_106}	    col_num=18      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_106}	    col_num=19      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}              sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_REF_3_eKYC_106
    [Documentation]     SUPPORT eKYC_106
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_106}	    col_num=20      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_106}	    col_num=21      value=${VALUE_1},${VALUE_1},${VALUE_OTP}              sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

################################## SUPPORT eKYC_45########################################
Save_Result_non_action_eKYC_45
    [Documentation]     SUPPORT eKYC_45
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_45}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_REF_2_eKYC_45
    [Documentation]     SUPPORT eKYC_45
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_45}	    col_num=14      value=${OTP_REF_NUMBER}                     sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_45}	    col_num=15      value=${VALUE_1}                          sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_REF_3_eKYC_45
    [Documentation]     SUPPORT eKYC_45
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_45}	    col_num=16      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_45}	    col_num=17      value=${VALUE_1},${VALUE_1},${VALUE_OTP}             sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER}
    Log         ${data3} 
    Close All Excel Documents

################ SUPPORT Success  ############################
# Save_Result_OTP_Happy
#     [Documentation]     SUPPORT Success
#     # [Arguments]     ${row}
#     Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
#     ${data2}        Write Excel Cell            row_num=${ROW_SUCCESS}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
#     ${data3}        Write Excel Cell            row_num=${ROW_SUCCESS}	    col_num=13      value=${VALUE_VALID}              sheet_name=OTP
#     Save Excel Document	        filename=${FILE_NAME}
#     Log             ${OTP_REF_NUMBER} 
#     Close All Excel Documents

Save_Result_OTP_DEMO
    [Documentation]         SUPPORT Success
    [Arguments]             ${data}
    Run keyword if          '${data}' == 'print'            Save_Result_OTP_Happy


########## >>> UNHAPPY <<< ####################
################ SUPPORT eKYC_107  ############################
Save_Result_non_action_eKYC_107_1
    [Documentation]     SUPPORT eKYC_107
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_107}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_non_action_eKYC_107_2
    [Documentation]     SUPPORT eKYC_107
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_107}	    col_num=14      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_eKYC_107_1
    [Documentation]     SUPPORT eKYC_107
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_107}	    col_num=16      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_107}	    col_num=17      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}              sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_eKYC_107_2
    [Documentation]     SUPPORT eKYC_107
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_107}	    col_num=18      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_107}	    col_num=19      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}               sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_eKYC_107_3
    [Documentation]     SUPPORT eKYC_107
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_107}	    col_num=20      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_107}	    col_num=21      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}              sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

############## eKYC_108 ###########
Save_Result_Error3times_eKYC_108_1
    [Documentation]     SUPPORT eKYC_108
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_108}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_108}	    col_num=13      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}             sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_2_0f_3_eKYC_108
    [Documentation]     SUPPORT eKYC_108
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_108}	    col_num=14      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_108}	    col_num=15      value=${VALUE_1},${VALUE_1}            sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_eKYC_108_2
    [Documentation]     SUPPORT eKYC_108
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_108}	    col_num=16      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_108}	    col_num=17      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}             sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

############## eKYC_64 ###################
Save_Result_error1_eKYC_64_1
    [Documentation]     SUPPORT eKYC_64
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_64}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_64}	    col_num=13      value=${VALUE_1}             sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_error1_eKYC_64_2
    [Documentation]     SUPPORT eKYC_64
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_64}	    col_num=14      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_64}	    col_num=15      value=${VALUE_1}             sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_eKYC_64
    [Documentation]     SUPPORT eKYC_64
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_64}	    col_num=16      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_64}	    col_num=17      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}             sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	


############## 3x3 ###################
Save_Result_non_action_3x3
    [Documentation]     SUPPORT 3x3
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_3x3}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_3x3_1
    [Documentation]     SUPPORT eKYC_64
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_3x3}	    col_num=14      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_3x3}	    col_num=15      value=${VALUE_1},${VALUE_1}            sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_3x3_2
    [Documentation]     SUPPORT eKYC_64
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_3x3}	    col_num=16      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_3x3}	    col_num=17      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}               sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_3x3_3
    [Documentation]     SUPPORT eKYC_64
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_3x3}	    col_num=20      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_3x3}	    col_num=21      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}               sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_non_action_3x3_2
    [Documentation]     SUPPORT 3x3
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_3x3}	    col_num=18      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

###### eKYC_110 #####
Save_Result_non_action_eKYC_110
    [Documentation]     SUPPORT eKYC_110
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_110}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_eKYC_110_3
    [Documentation]     SUPPORT eKYC_110
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_110}	    col_num=14      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_110}	    col_num=15      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}              sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_eKYC_110
    [Documentation]     SUPPORT eKYC_110
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_110}	    col_num=16      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_110}	    col_num=17      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}              sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_non_action_eKYC_110_2
    [Documentation]     SUPPORT eKYC_110
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_110}	    col_num=18      value=${OTP_REF_NUMBER}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	

Save_Result_Error3times_eKYC_110_2
    [Documentation]     SUPPORT eKYC_110
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_110}	    col_num=20      value=${OTP_REF_NUMBER}           sheet_name=OTP
    ${data3}        Write Excel Cell            row_num=${ROW_eKYC_110}	    col_num=21      value=${VALUE_1},${VALUE_1},${VALUE_1},${VALUE_1}             sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Log             ${OTP_REF_NUMBER} 
    Close All Excel Documents	


Save_Mobile_Not_Found
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc2
    ${data2}        Write Excel Cell            row_num=12	    col_num=7      value=${MOBILE_NOTFOUND}           sheet_name=OTP
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	

Save_DOPA_Unhappy
    [Arguments]         ${abc}      ${dopa_row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc6
    Write Excel Cell	        row_num=${abc}	    col_num=19      value=${MOBILE_NO}                      sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${abc}	    col_num=17      value=${TRANS_ID}                       sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${abc}	    col_num=22      value=${DOPA_MESSAGE}                    sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${abc}	    col_num=18      value=${GETTERM_RESPONES_MESSAGE}       sheet_name=eKYC-UNHAPPY

    ## OTP ##
    Write Excel Cell	        row_num=${abc}	    col_num=21      value=${RESULT_OTP_STATUS}          sheet_name=eKYC-UNHAPPY
    # Write Excel Cell            row_num=${abc}	    col_num=6      value=${TRANS_ID}                 sheet_name=OTP
    # Write Excel Cell            row_num=${abc}	    col_num=7      value=${MOBILE_NO}                sheet_name=OTP
    # Write Excel Cell            row_num=${abc}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=OTP
    # Write Excel Cell            row_num=${abc}	    col_num=13      value=${VALUE_OTP}                sheet_name=OTP
    Write Excel Cell	        row_num=${abc}	    col_num=20      value=${CONSENT_MESSAGE}          sheet_name=eKYC-UNHAPPY
    ### Sheet DOPA ###
    Write Excel Cell	        row_num=${dopa_row}	    col_num=6      value=${DOPA_MESSAGE}        sheet_name=DOPA
    Write Excel Cell	        row_num=${dopa_row}	    col_num=7      value=${DOPA_REMARK}        sheet_name=DOPA
    Write Excel Cell	        row_num=${dopa_row}	    col_num=3      value=${TRANS_ID}            sheet_name=DOPA
    ### Save Status ###
    Write Excel Cell	        row_num=${abc}	    col_num=25      value=${TEST STATUS}                    sheet_name=eKYC-UNHAPPY
    # Write Excel Cell	        row_num=${abc}	    col_num=22      value=${TEST STATUS}                    sheet_name=OTP

    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	


Save_Facial_Unhappy
    [Arguments]     ${row}      ${row_facial}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc4
    Write Excel Cell	        row_num=${row}	    col_num=19      value=${MOBILE_NO}                      sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=17      value=${TRANS_ID}                       sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=22      value=${DOPA_MESSAGE}                    sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=23      value=${LN_FR_RESPONE_MESSAGE}          sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=18      value=${GETTERM_RESPONES_MESSAGE}       sheet_name=eKYC-UNHAPPY


    ## OTP ##
    Write Excel Cell	        row_num=${row}	    col_num=21      value=${RESULT_OTP_STATUS}          sheet_name=eKYC-UNHAPPY
    Write Excel Cell	        row_num=${row}	    col_num=20      value=${CONSENT_MESSAGE}          sheet_name=eKYC-UNHAPPY
    ### Sheet DOPA ###
    # Write Excel Cell	        row_num=${abc}	    col_num=6      value=${DOPA_MESSAGE}        sheet_name=DOPA
    # Write Excel Cell	        row_num=${abc}	    col_num=7      value=${DOPA_REMARK}        sheet_name=DOPA
    # Write Excel Cell	        row_num=${abc}	    col_num=3      value=${TRANS_ID}            sheet_name=DOPA
    ### Save Status ###
    Write Excel Cell	        row_num=${row}	    col_num=25      value=${TEST STATUS}                    sheet_name=eKYC-UNHAPPY
    # Write Excel Cell	        row_num=${abc}	    col_num=22      value=${TEST STATUS}                    sheet_name=OTP
    ### Facial Status ###
    Write Excel Cell	        row_num=${row_facial}	    col_num=11      value=${LN_FR_RESPONE_MESSAGE}        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row_facial}	    col_num=12      value=${TEST STATUS}        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row_facial}	    col_num=5      value=${TRANS_ID}        sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

########################## Integret_Mobile
Save_Result_get_eligible_bio
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc10
    Write Excel Cell	        row_num=${row}	    col_num=4      value=${RESPONSE_CODE}                  sheet_name=check_eligible
    Write Excel Cell	        row_num=${row}	    col_num=5      value=${RESPONSE_MESSAGE}               sheet_name=check_eligible
    Write Excel Cell	        row_num=${row}	    col_num=6      value=${RESPONSE_REMARK}                sheet_name=check_eligible
    Write Excel Cell	        row_num=${row}	    col_num=7      value=${RESPONSE_CONSENTVERSION}        sheet_name=check_eligible
    Write Excel Cell	        row_num=${row}	    col_num=8      value=${RESPONSE_API}                   sheet_name=check_eligible
    Save Excel Document	        filename=${FILE_NAME_QR}
    Close All Excel Documents


Save_Result_Get_last_QR
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc10
    Write Excel Cell	        row_num=${row}	    col_num=4      value=${RESULT_QR}                   sheet_name=Get_last_QR
    Write Excel Cell	        row_num=${row}	    col_num=5      value=${RESPONSE_CODE}          sheet_name=Get_last_QR
    Write Excel Cell	        row_num=${row}	    col_num=6      value=${RESPONSE_MESSAGE}          sheet_name=Get_last_QR
    Write Excel Cell	        row_num=${row}	    col_num=7      value=${RESPONSE_REMARK}          sheet_name=Get_last_QR
    Write Excel Cell	        row_num=${row}	    col_num=8      value=${RESPONSE_API}          sheet_name=Get_last_QR

    Save Excel Document	        filename=${FILE_NAME_QR}
    Close All Excel Documents


Save_Result_Get_last_Transaction
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc16
    Write Excel Cell	        row_num=${row}	    col_num=4      value=${RESULT_KYCTRANS_ID}          sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=5      value=${RESULT_TRAN_STATUS}          sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=6      value=${RESULT_STATE}                  sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=7      value=${RESULT_CHANNEL}           sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=8      value=${RESULT_ENTITY}      sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=9     value=${RESULT_REQ_TYPE}          sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=10     value=${RESULT_IAL}            sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=11     value=${RESULT_KYC_EXPIRE}          sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=12     value=${RESULT_CREATE_DATE}            sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=13     value=${RESULT_CREATE_BY}            sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=14     value=${RESULT_UPDATE_DATE}            sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=15     value=${RESULT_UPDATE_BY}            sheet_name=Get_last_transaction_status

    Write Excel Cell	        row_num=${row}	    col_num=16     value=${RESPONSE_CODE}               sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=17     value=${RESPONSE_MESSAGE}            sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=18     value=${RESPONSE_REMARK}             sheet_name=Get_last_transaction_status
    Write Excel Cell	        row_num=${row}	    col_num=19      value=${RESPONSE_API}               sheet_name=Get_last_transaction_status

    Save Excel Document	        filename=${FILE_NAME_QR}
    Close All Excel Documents


Save_Result_Gen_QR
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc10
    Write Excel Cell	        row_num=${row}	    col_num=7      value=${QR_VALUE}             sheet_name=Generate_QR
    Write Excel Cell	        row_num=${row}	    col_num=8      value=${QR_EXPIRE}            sheet_name=Generate_QR
    Write Excel Cell	        row_num=${row}	    col_num=9      value=${QR_STATUS}            sheet_name=Generate_QR
    Write Excel Cell	        row_num=${row}	    col_num=13     value=${RESPONSE_API}         sheet_name=Generate_QR
    Write Excel Cell	        row_num=${row}	    col_num=10     value=${RESPONSE_CODE}        sheet_name=Generate_QR
    Write Excel Cell	        row_num=${row}	    col_num=11     value=${RESPONSE_MESSAGE}     sheet_name=Generate_QR
    Write Excel Cell	        row_num=${row}	    col_num=12     value=${RESPONSE_REMARK}      sheet_name=Generate_QR

    Save Excel Document	        filename=${FILE_NAME_QR}
    Close All Excel Documents


Save_Result_Validate_QR
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc10
    Write Excel Cell	        row_num=${row}	    col_num=4      value=${JOURNEY_CODE}            sheet_name=Validate_QR
    Write Excel Cell	        row_num=${row}	    col_num=5      value=${JOURNEY_NAME}            sheet_name=Validate_QR
    Write Excel Cell	        row_num=${row}	    col_num=6      value=${TRANS_ID}                sheet_name=Validate_QR
    Write Excel Cell	        row_num=${row}	    col_num=7      value=${RESPONSE_CODE}           sheet_name=Validate_QR
    Write Excel Cell	        row_num=${row}	    col_num=8      value=${RESPONSE_MESSAGE}        sheet_name=Validate_QR
    Write Excel Cell	        row_num=${row}	    col_num=9      value=${RESPONSE_REMARK}         sheet_name=Validate_QR
    Write Excel Cell	        row_num=${row}	    col_num=13     value=${RESPONSE_API}            sheet_name=Validate_QR
    Write Excel Cell	        row_num=${row}	    col_num=11     value=${RESPONSE_USERCODE}       sheet_name=Validate_QR
    Write Excel Cell	        row_num=${row}	    col_num=12     value=${RESPONSE_USER_EN}        sheet_name=Validate_QR
    Write Excel Cell	        row_num=${row}	    col_num=10     value=${RESPONSE_USER_TH}        sheet_name=Validate_QR
    Log         ${TEST STATUS} 
    # Jira_api_page.Update_Jira_Status
    Save Excel Document	        filename=${FILE_NAME_QR}
    Close All Excel Documents


Save_Result_QRcode_to_excel
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc10
    Write Excel Cell	        row_num=${row}	    col_num=4      value=${QR_VALUE}         sheet_name=QR_Stamp_Used
    Save Excel Document	        filename=${FILE_NAME_QR}
    Close All Excel Documents

Save_Result_Stamp_Used
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc10
    Write Excel Cell	        row_num=${row}	    col_num=3      value=${QR_VALUE}             sheet_name=QR_Stamp_Used
    Write Excel Cell	        row_num=${row}	    col_num=4      value=${RESPONSE_CODE}        sheet_name=QR_Stamp_Used
    Write Excel Cell	        row_num=${row}	    col_num=5      value=${RESPONSE_MESSAGE}     sheet_name=QR_Stamp_Used
    Write Excel Cell	        row_num=${row}	    col_num=6      value=${RESPONSE_REMARK}      sheet_name=QR_Stamp_Used
    Write Excel Cell	        row_num=${row}	    col_num=7      value=${RESPONSE_USERCODE}    sheet_name=QR_Stamp_Used
    Write Excel Cell	        row_num=${row}	    col_num=8     value=${RESPONSE_USER_EN}     sheet_name=QR_Stamp_Used
    Write Excel Cell	        row_num=${row}	    col_num=9     value=${RESPONSE_USER_TH}     sheet_name=QR_Stamp_Used
    Write Excel Cell	        row_num=${row}	    col_num=10      value=${RESPONSE_API}         sheet_name=QR_Stamp_Used
    Log         ${TEST STATUS} 
    # Jira_api_page.Update_Jira_Status
    Save Excel Document	        filename=${FILE_NAME_QR}
    Close All Excel Documents

# ${QR_VALUE} 

Save_Result_Facial_authen
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc10
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${RESPONSE_CODE}           sheet_name=Facial_authen
    Write Excel Cell	        row_num=${row}	    col_num=10      value=${RESPONSE_MESSAGE}       sheet_name=Facial_authen
    Write Excel Cell	        row_num=${row}	    col_num=11      value=${RESPONSE_REMARK}        sheet_name=Facial_authen
    Write Excel Cell	        row_num=${row}	    col_num=15      value=${RESPONSE_API}            sheet_name=Facial_authen
    Write Excel Cell	        row_num=${row}	    col_num=12      value=${RESPONSE_USERCODE}       sheet_name=Facial_authen
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${RESPONSE_USER_EN}        sheet_name=Facial_authen
    Write Excel Cell	        row_num=${row}	    col_num=14      value=${RESPONSE_USER_TH}        sheet_name=Facial_authen
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${SCORE_FACIAL}            sheet_name=Facial_authen
    # Jira_api_page.Update_Jira_Status
    Save Excel Document	        filename=${FILE_NAME_QR}
    Close All Excel Documents


Save_Result_Modify_validate_api
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc10
    Write Excel Cell	        row_num=${row}	    col_num=5      value=${RESPONSE_CODE}           sheet_name=Modify_validate
    Write Excel Cell	        row_num=${row}	    col_num=6      value=${RESPONSE_MESSAGE}       sheet_name=Modify_validate
    Write Excel Cell	        row_num=${row}	    col_num=7      value=${RESPONSE_REMARK}        sheet_name=Modify_validate
    Write Excel Cell	        row_num=${row}	    col_num=11     value=${RESPONSE_API}            sheet_name=Modify_validate
    Write Excel Cell	        row_num=${row}	    col_num=8      value=${RESPONSE_USERCODE}       sheet_name=Modify_validate
    Write Excel Cell	        row_num=${row}	    col_num=9      value=${RESPONSE_USER_EN}        sheet_name=Modify_validate
    Write Excel Cell	        row_num=${row}	    col_num=10     value=${RESPONSE_USER_TH}        sheet_name=Modify_validate
    Jira_api_page.Update_Jira_Status
    Save Excel Document	        filename=${FILE_NAME_QR}
    Close All Excel Documents


Save_Result_Counter_Service
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_CS}      doc_id=doc10
    Write Excel Cell	        row_num=${row}	    col_num=10       value=${RESPONSE_CODE}           sheet_name=Signup_CS
    Write Excel Cell	        row_num=${row}	    col_num=11       value=${RESPONSE_MESSAGE}        sheet_name=Signup_CS
    Write Excel Cell	        row_num=${row}	    col_num=12       value=${RESPONSE_REMARK}         sheet_name=Signup_CS
    Write Excel Cell	        row_num=${row}	    col_num=16       value=${RESPONSE_API}            sheet_name=Signup_CS
    Write Excel Cell	        row_num=${row}	    col_num=9        value=${TRANS_ID}                sheet_name=Signup_CS
    Write Excel Cell	        row_num=${row}	    col_num=13       value=${RESPONSE_USERCODE}       sheet_name=Signup_CS
    Write Excel Cell	        row_num=${row}	    col_num=14       value=${RESPONSE_USER_EN}        sheet_name=Signup_CS
    Write Excel Cell	        row_num=${row}	    col_num=15       value=${RESPONSE_USER_TH}        sheet_name=Signup_CS
    # Jira_api_page.Update_Jira_Status
    Save Excel Document	        filename=${FILE_CS}
    Close All Excel Documents



