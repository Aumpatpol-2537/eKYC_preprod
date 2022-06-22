*** Settings ***
Library         ExcelLibrary
Library         RequestsLibrary
Library         OperatingSystem

Resource       ../keywords/Get_term_and_conditionAPI_page.robot
Resource       ../keywords/validate_customer_API_page.robot
Resource       ../keywords/Get_Consent_API_page.robot
Resource       ../keywords/sent_SMS(OTP)API_page.robot
Resource       ../keywords/verify_OTP_API_page.robot
Resource       ../keywords/Check_DOPA_API_page.robot
Resource       ../keywords/Validate_imageAPI_page.robot
Resource       ../Varriable/varriable.robot
Resource		../keywords/save_data_excel_page.robot
Resource		../Varriable/bu_img_authen.robot
Resource		../keywords/Save_LN_FR_Page.robot
Resource		../keywords/LivenessAPI_page.robot
# Resource		../Varriable/api_varriable.robot
Resource		../Varriable/Tablet_varriable.robot
Resource        ../keywords/Save_IAL_Level.robot
Resource        ../keywords/IAL_Page.robot
Resource		../keywords/Twin_page.robot
Resource	    ../keywords/Generate_Transaction_page.robot
Resource		../Main/Main.robot
Resource        ../keywords/QR_code_page.robot


#  robot  api-ekyc/Test\ case/24.BU_testing.robot 

***Variables***
${SHEET_NAME_BU}        eKYC-HAPPY
${FILE_BU_NAME}         ../eKYC_preprod/api-ekyc/Report_BU/DOPA Down_R1.xlsx

${DBHost}         tcrb-bot-pprd-db.cluster-cnu8aurcdwzj.ap-southeast-1.rds.amazonaws.com
${DBName}         bot_v2
${DBPass}         RDBtxjPqaOmrasU4uNi2
${DBPort}         5432
${DBUser}         postgres


***Keywords***
Get_data_information
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_BU_NAME}      doc_id=doc2
    ${get_journey}=	        Read Excel Cell	        row_num=${row}	        col_num=3        sheet_name=${SHEET_NAME_BU} 
    ${get_qr_string}=	    Read Excel Cell	        row_num=${row}	        col_num=4        sheet_name=${SHEET_NAME_BU} 
    ${get_term}=	        Read Excel Cell	        row_num=${row}	        col_num=5        sheet_name=${SHEET_NAME_BU} 
    ${get_consent}=	        Read Excel Cell	        row_num=${row}	        col_num=6        sheet_name=${SHEET_NAME_BU} 
    ${get_cid}=	            Read Excel Cell	        row_num=${row}	        col_num=7        sheet_name=${SHEET_NAME_BU}
    ${name}=                Read Excel Cell	        row_num=${row}	        col_num=8        sheet_name=${SHEET_NAME_BU}
    ${surname}=             Read Excel Cell	        row_num=${row}	        col_num=9        sheet_name=${SHEET_NAME_BU}
    ${name_en}=             Read Excel Cell	        row_num=${row}	        col_num=10       sheet_name=${SHEET_NAME_BU}
    ${surname_en}=          Read Excel Cell	        row_num=${row}	        col_num=11       sheet_name=${SHEET_NAME_BU}
    ${bithdate}=            Read Excel Cell	        row_num=${row}	        col_num=12       sheet_name=${SHEET_NAME_BU}
    ${get_mobile}=          Read Excel Cell	        row_num=${row}	        col_num=13       sheet_name=${SHEET_NAME_BU}
    ${get_lasercode}=       Read Excel Cell	        row_num=${row}	        col_num=14       sheet_name=${SHEET_NAME_BU}
    ${get_cid_image}=       Read Excel Cell	        row_num=${row}	        col_num=15       sheet_name=${SHEET_NAME_BU}
    ${get_selfie_image}=    Read Excel Cell	        row_num=${row}	        col_num=16       sheet_name=${SHEET_NAME_BU}

    Set global variable         ${GET_CONSENT}          ${get_consent}
    Set global variable         ${GET_TERM}             ${get_term}
    Set global variable         ${QR_VALUE}             ${get_qr_string}
    Set global variable         ${GET_JOURNEY}          ${get_journey}
    Set global variable         ${GET_CID}              ${get_cid}
    Set global variable         ${FIRST_NAME}           ${name}
    Set global variable         ${SURNAME}              ${surname}
    Set global variable         ${FIRST_NAME_EN}        ${name_en}
    Set global variable         ${SURNAME_EN}           ${surname_en}
    Set global variable         ${BIRTH_DATE}           ${bithdate}
    Set global variable         ${GET_MOBILE}           ${get_mobile}
    Set global variable         ${GET_LASER_CODE}       ${get_lasercode}
    Set global variable         ${VAR_IMG}              ${get_cid_image}
    Set global variable         ${VAR_SELFIE}           ${get_selfie_image}

    Close All Excel Documents


save_result_api
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_BU_NAME}      doc_id=doc2
    Check_ial_Level                     ${TRANS_ID}
    Write Excel Cell	                row_num=${row}	    col_num=19      value=${TRANS_STATUS}            sheet_name=${SHEET_NAME_BU}
    Run Keyword And Ignore Error	    Write Excel Cell	        row_num=${row}	    col_num=18      value=${REMARK_REASON}           sheet_name=${SHEET_NAME_BU}
    # Run Keyword And Ignore Error	    Write Excel Cell	        row_num=${row}	    col_num=18      value=${QR_RESPONSE_USER_EN}           sheet_name=${SHEET_NAME_BU}
    Write Excel Cell	                row_num=${row}	    col_num=20      value=${SCORE_IAL}               sheet_name=${SHEET_NAME_BU}
    Write Excel Cell	                row_num=${row}	    col_num=17      value=${KEYWORD STATUS}          sheet_name=${SHEET_NAME_BU}
    Run Keyword And Ignore Error        Write Excel Cell	        row_num=${row}	    col_num=21      value=${TRANS_ID}         sheet_name=${SHEET_NAME_BU}
    Stamp_Fail_if_find_2017             ${row}
    Save Excel Document	                filename=${FILE_BU_NAME}
    Close All Excel Documents	

BU_journey
    [Arguments]         ${get_start_row} 
    FOR     ${customer_row}    IN RANGE    ${get_start_row}       200

        Get_data_information         ${customer_row} 
        Exit For Loop If            '${GET_JOURNEY}' == 'None'

        Run Keyword If          '${GET_JOURNEY}' == 'Uplift'       Run Keyword And Ignore Error	       Uplift_journey       ${customer_row} 
        Run Keyword If          '${GET_JOURNEY}' == 'QR'           Run Keyword And Ignore Error	       QR_journey           ${customer_row} 

        # Run Keyword And Ignore Error      save_result_api         ${customer_row}
        Close All Excel Documents

    END
    Close All Excel Documents

Check_ial_Level
    [Arguments]         ${input_trans_id}
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{queryResults_from_kyc_tran} =  Query    SELECT x.* FROM kyc_db.kyc_transaction x WHERE trans_id = '${input_trans_id}'
    ${ial_score_from_kyc_tran}          Get From List                   @{queryResults_from_kyc_tran}       	9
    Set global variable                 ${SCORE_IAL}              ${ial_score_from_kyc_tran}

    ${transactions_status}              Get From List              @{queryResults_from_kyc_tran}       	7
    Set global variable                 ${TRANS_STATUS}            ${transactions_status}

    ${get_activity_log_id}              Get From List              @{queryResults_from_kyc_tran}       	0
    Set global variable                 ${ACTIVITY_LOG_ID}            ${get_activity_log_id}

    Run Keyword If                      '${TRANS_STATUS}' == '4'        Find_Reason_unsuccess       ${ACTIVITY_LOG_ID} 
    Run Keyword If                      '${TRANS_STATUS}' == '1'        Find_Reason_unsuccess       ${ACTIVITY_LOG_ID} 

Find_Reason_unsuccess
    [Arguments]         ${input_trans_id}
    Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    @{queryResults_from_activity_log} =  Query   SELECT x.* FROM kyc_db.activity_log x WHERE x.kyc_trans_id IN ('${ACTIVITY_LOG_ID}') AND x.status_id IN (4)
    ${get_remark}          Get From List             @{queryResults_from_activity_log}       	7
    Set global variable                 ${REMARK_REASON}              ${get_remark}

Uplift_journey
    [Arguments]         ${row}
        Main.Start Project

    # Generate_Transaction_page.Start_Generate_Transaction
    # Get_term_and_conditionAPI_page.Actions_term_and_conditions
    # Validate_customer_API_page.Validate_customer_qr_code_BU_Journey              ${row}
    # Sent_SMS(OTP)API_page.Sent_OTP

    # Log to console        ${OTP_REF_NUMBER} 
    # Log to console        ${TRANS_ID} 
    
	# Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api

    Get_data_trans_ref_otp_value        ${row}

	Verify_OTP_API_page.Verify_OTP
	Get_Consent_API_page.Agree_Consent
	twin_page.Dont_Have_Twin
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass_BU_Journey
    [Teardown]     Save_Keyword_Status          ${row}

QR_journey
    [Arguments]         ${row}
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Actions_term_and_conditions
    Validate_customer_API_page.Validate_customer_qr_code_BU_Journey              ${row}
    Check_DOPA_API_page.Check_DOPA          
    LivenessAPI_page.Liveness_and_FR_Pass_BU_Journey
    [Teardown]     Save_Keyword_Status          ${row}

Save_Keyword_Status
    [Arguments]         ${row_save_status}
    Set global variable        ${KEYWORD STATUS}          ${KEYWORD STATUS}
    Run Keyword And Ignore Error	        save_result_api            ${row_save_status}

Stamp_Fail_if_find_2017
    [Arguments]              ${row_error2017}   
    Run Keyword If          '${LAST_RESPONSE_CODE}' == '2017'             Stamp_Fail_to_report           ${row_error2017} 
    Run Keyword If          '${QR_RESPONSE_CODE}' == '2028'          Stamp_Fail_to_report           ${row_error2017} 
    Run Keyword If          '${QR_RESPONSE_CODE}' == '2024'          Stamp_Fail_to_report           ${row_error2017} 
    Run Keyword If          '${QR_RESPONSE_CODE}' == '2028'          Stamp_null_in_qr_fails         ${row_error2017} 
    Run Keyword If          '${QR_RESPONSE_CODE}' == '2024'          Stamp_null_in_qr_fails         ${row_error2017} 
    Run Keyword If          '${RESPONSE_CODE}' == '0'                Stamp_null_in_success          ${row_error2017} 
    # Run Keyword If          '${TRANS_STATUS}' == '1'                 Stamp_null_inprogress          ${row_error2017} 

Stamp_Fail_to_report
    [Arguments]                 ${row_error2017} 
    # Write Excel Cell	        row_num=${row_error2017}	    col_num=17      value=FAIL           sheet_name=${SHEET_NAME_BU}
    Write Excel Cell	        row_num=${row_error2017}	    col_num=20      value=-              sheet_name=${SHEET_NAME_BU}

Stamp_null_in_qr_fails
    [Arguments]                 ${row_error2017} 
    Write Excel Cell	        row_num=${row_error2017}	    col_num=19      value=-              sheet_name=${SHEET_NAME_BU}

Stamp_null_in_success
    [Arguments]                 ${row_error2017} 
    Write Excel Cell	        row_num=${row_error2017}	    col_num=18      value=-              sheet_name=${SHEET_NAME_BU}

Stamp_null_inprogress
    [Arguments]                 ${row_error2017} 
    Write Excel Cell	        row_num=${row_error2017}	    col_num=18      value=-              sheet_name=${SHEET_NAME_BU}
    Write Excel Cell	        row_num=${row_error2017}	    col_num=20      value=-              sheet_name=${SHEET_NAME_BU}

Get_data_trans_ref_otp_value
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_BU_NAME}      doc_id=doc2
    ${get_trans_id}=	        Read Excel Cell	        row_num=${row}	        col_num=21        sheet_name=${SHEET_NAME_BU} 
    ${get_otp}=	                Read Excel Cell	        row_num=${row}	        col_num=22        sheet_name=${SHEET_NAME_BU} 
    ${get_otp_ref}=	            Read Excel Cell	        row_num=${row}	        col_num=23        sheet_name=${SHEET_NAME_BU} 

    Set global variable         ${TRANS_ID}                 ${get_trans_id}
    Set global variable         ${VALUE_OTP}                ${get_otp}
    Set global variable         ${OTP_REF_NUMBER}           ${get_otp_ref}

    Close All Excel Documents
