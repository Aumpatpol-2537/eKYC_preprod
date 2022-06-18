***Settings***

Library                 ExcelLibrary
Library                 OperatingSystem
Resource                ../keywords/Sent_SMS(OTP)API_page.robot
Resource                ../keywords/Validate_customer_API_page.robot
Resource                ../keywords/Verify_OTP_API_page.robot
Resource                ../keywords/LivenessAPI_page.robot
Resource                ../keywords/Facial_RecognitionAPI_page.robot


***Keywords***
Save_Result_Status
    [Arguments]     ${tag}      ${row}
    Run keyword if      '${tag}' == 'y'         Save_Final_LN_FR_Result_to_excel       ${row}
    ...     ELSE            No_print_report

No_print_report
    Log     No Print

Save_Result_TC001
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc3
    ${data2}        Write Excel Cell            row_num=${ROW_eKYC_106}	    col_num=12      value=${OTP_REF_NUMBER}           sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	

Save_Final_LN_FR_Result_to_excel
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc4
    Write Excel Cell	        row_num=${row}	    col_num=11      value=${MESS_STATUS}        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=12      value=${TEST STATUS}        sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_TC001_SUCCESS
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc4
    Write Excel Cell	        row_num=${row}	    col_num=7      value=0                      sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8      value=0                      sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9      value=0                      sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=0                     sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${MESS_STATUS}        sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

# Save_Log_TC002_SUCCESS
#     [Arguments]     ${row}
#     Open Excel Document	        filename=${FILE_NAME}      doc_id=doc4
#     Write Excel Cell	        row_num=${row}	    col_num=11      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${MESS_STATUS}        sheet_name=Liveness&FaceREC
#     Save Excel Document	        filename=${FILE_NAME}
#     Close All Excel Documents

Save_Log_TC002_SUCCESS
    [Arguments]         ${row}
    ${ln}               Create List	        ${LN_RETURN_MESSAGE_FAILS}      ${LN_RETURN_MESSAGE_FAILS_2}
    ${fr}               Create List	        ${MESS_STATUS}
        ${ln_length}        Get Length          ${ln}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc4
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length}       sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8     value=0        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9     value=0          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10     value=0          sheet_name=Liveness&FaceREC     
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS_2},${MESS_STATUS}        sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_TC003_SUCCESS
    [Arguments]     ${row}      
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}          ${LN_RETURN_MESSAGE_FAILS_2}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}       ${LN_RETURN_MESSAGE_TIME_OUT_2}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}
        ${ln_length_fails}          Get Length          ${ln_fails}
        ${ln_length_timeout}        Get Length          ${ln_timeout}
        ${fr_length_fails}          Get Length          ${fr_fails}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc4
    Write Excel Cell	        row_num=${row}	    col_num=7     value=${ln_length_fails}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8     value=${ln_length_timeout}        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9     value=${fr_length_fails}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10     value=0                          sheet_name=Liveness&FaceREC         
    Write Excel Cell	        row_num=${row}	    col_num=13     value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_FAILS},${MESS_STATUS}      sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_TC004_SUCCESS
    [Arguments]     ${row}
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}
    ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}
            ${ln_length_fails}          Get Length          ${ln_fails}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            ${fr_length_timeout}        Get Length          ${fr_timeout}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    Write Excel Cell	        row_num=${row}	    col_num=7     value=${ln_length_fails}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8     value=${ln_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9     value=${fr_length_fails}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10     value=${fr_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13     value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_FAILS},${FR_RETURN_MESSAGE_FAIL_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${MESS_STATUS}          sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_TC001_UNSUCCESS
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}     ${FR_RETURN_MESSAGE_FAIL_3}
    ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}
            ${ln_length_fails}          Get Length          ${ln_fails}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            ${fr_length_timeout}        Get Length          ${fr_timeout}
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${ln_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=${fr_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_FAILS},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL}        sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_TC002_UNSUCCESS
    [Arguments]     ${row}
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}          ${LN_RETURN_MESSAGE_FAILS_2}        ${LN_RETURN_MESSAGE_FAILS_3}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}       ${LN_RETURN_MESSAGE_TIME_OUT_2}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}
    # ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}
            ${ln_length_fails}          Get Length          ${ln_fails}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            # ${fr_length_timeout}        Get Length          ${fr_timeout}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${ln_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=0          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT_2},${LN_RETURN_MESSAGE_FAILS_2},${LN_RETURN_MESSAGE_FAILS_3}        sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_TC003_UNSUCCESS
    [Arguments]     ${row}
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}          ${LN_RETURN_MESSAGE_FAILS_2}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}       ${LN_RETURN_MESSAGE_TIME_OUT_2}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}         ${FR_RETURN_MESSAGE_FAIL_3}
    # ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}
            ${ln_length_fails}          Get Length          ${ln_fails}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            # ${fr_length_timeout}        Get Length          ${fr_timeout}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${ln_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=0                               sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_FAILS},${FR_RETURN_MESSAGE_FAIL_2}        sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_TC004_UNSUCCESS
    [Arguments]     ${row}
    ${ln_fails}                 Create List         ${LN_DETECT_FAIL}          ${LN_DETECT_FAIL}         ${LN_DETECT_FAIL}
            ${ln_length_fails}          Get Length          ${ln_fails}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=0        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=0        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=0        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13     value=${LN_DETECT_FAIL},${LN_DETECT_FAIL},${LN_DETECT_FAIL}      sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents


Save_Log_TC006_UNSUCCESS
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    ${fr_fail}                  Create List         ${RETURN_FACERECFAIL}     ${RETURN_FACERECFAIL}       ${RETURN_FACERECFAIL}
            ${fr_length}        Get Length          ${fr_fail}
    Write Excel Cell	        row_num=${row}	    col_num=7       value=0        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=0            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length}        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=0        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${RETURN_FACERECFAIL},${RETURN_FACERECFAIL},${RETURN_FACERECFAIL}    sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_TC005_UNSUCCESS
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    ${ln_timeout}               Create List         ${RETURN_LN_TIME_OUT}     ${RETURN_LN_TIME_OUT}       ${RETURN_LN_TIME_OUT}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
    Write Excel Cell	        row_num=${row}	    col_num=7       value=0        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${ln_length_timeout}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=0        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=0        sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${RETURN_LN_TIME_OUT},${RETURN_LN_TIME_OUT},${RETURN_LN_TIME_OUT}    sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents


Create_Report_TC001_SUCCESS
    [Arguments]     ${tag}      ${row}
    Run Keyword if      '${tag}' ==  'y'       Save_Log_TC001_SUCCESS          ${row}
    ...     ELSE            No_print_report


Save_Log_EU-0054
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    # ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}
    # ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}
    ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}
            # ${ln_length_fails}          Get Length          ${ln_fails}
            # ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            ${fr_length_timeout}        Get Length          ${fr_timeout}
    Write Excel Cell	        row_num=${row}	    col_num=7       value=0                             sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=0                             sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=${fr_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_FAILS},${FR_RETURN_MESSAGE_FAIL_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT_2},________,${MESS_STATUS}        sheet_name=Liveness&FaceREC
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_EU-0055
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}          ${LN_RETURN_MESSAGE_FAILS_2}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}       ${LN_RETURN_MESSAGE_TIME_OUT_2}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}
    ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}
            ${ln_length_fails}          Get Length          ${ln_fails}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            ${fr_length_timeout}        Get Length          ${fr_timeout}
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${ln_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=${fr_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},________,${MESS_STATUS} 
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_EU-0068
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}          ${LN_RETURN_MESSAGE_FAILS_2}        ${LN_RETURN_MESSAGE_FAILS_3}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}       ${LN_RETURN_MESSAGE_TIME_OUT_2}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}
    ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}
            ${ln_length_fails}          Get Length          ${ln_fails}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            ${fr_length_timeout}        Get Length          ${fr_timeout}
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${ln_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=${fr_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS_2},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT_2},${LN_RETURN_MESSAGE_FAILS_3}
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_EU-0069
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}          ${LN_RETURN_MESSAGE_FAILS_2}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}       ${LN_RETURN_MESSAGE_TIME_OUT_2}      ${LN_RETURN_MESSAGE_TIME_OUT_3}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}
    ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}
            ${ln_length_fails}          Get Length          ${ln_fails}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            ${fr_length_timeout}        Get Length          ${fr_timeout}
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${ln_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=${fr_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT_2},${LN_RETURN_MESSAGE_FAILS_2},${LN_RETURN_MESSAGE_TIME_OUT_3}
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_EU-0070
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}          ${LN_RETURN_MESSAGE_FAILS_2}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}       ${LN_RETURN_MESSAGE_TIME_OUT_2}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}     ${FR_RETURN_MESSAGE_FAIL_3}
    ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}
            ${ln_length_fails}          Get Length          ${ln_fails}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            ${fr_length_timeout}        Get Length          ${fr_timeout}
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${ln_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=${fr_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS_2},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT_2},${FR_RETURN_MESSAGE_FAIL_3}
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents

Save_Log_EU-0071
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc5
    ${ln_fails}                 Create List         ${LN_RETURN_MESSAGE_FAILS}          ${LN_RETURN_MESSAGE_FAILS_2}
    ${ln_timeout}               Create List         ${LN_RETURN_MESSAGE_TIME_OUT}       ${LN_RETURN_MESSAGE_TIME_OUT_2}
    ${fr_fails}                 Create List         ${FR_RETURN_MESSAGE_FAIL}           ${FR_RETURN_MESSAGE_FAIL_2}
    ${fr_timeout}               Create List         ${FR_RETURN_TIMEOUT}                ${FR_RETURN_TIMEOUT_2}      ${FR_RETURN_TIMEOUT_3}
            ${ln_length_fails}          Get Length          ${ln_fails}
            ${ln_length_timeout}        Get Length          ${ln_timeout}
            ${fr_length_fails}          Get Length          ${fr_fails}
            ${fr_length_timeout}        Get Length          ${fr_timeout}
    Write Excel Cell	        row_num=${row}	    col_num=7       value=${ln_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=8       value=${ln_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=9       value=${fr_length_fails}            sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=10      value=${fr_length_timeout}          sheet_name=Liveness&FaceREC
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_MESSAGE_FAIL_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT},${FR_RETURN_TIMEOUT_2},________,${LN_RETURN_MESSAGE_FAILS},${LN_RETURN_MESSAGE_FAILS_2},${LN_RETURN_MESSAGE_TIME_OUT},${LN_RETURN_MESSAGE_TIME_OUT_2},${FR_RETURN_TIMEOUT_3}
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents
