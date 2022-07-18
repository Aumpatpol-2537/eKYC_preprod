*** Settings ***
Library         RequestsLibrary
Resource       ../keywords/Get_term_and_conditionAPI_page.robot
Resource       ../keywords/validate_customer_API_page.robot
Resource       ../keywords/Get_Consent_API_page.robot
Resource       ../keywords/sent_SMS(OTP)API_page.robot
Resource       ../keywords/verify_OTP_API_page.robot
Resource       ../keywords/Check_DOPA_API_page.robot
Resource       ../keywords/Validate_imageAPI_page.robot
Resource       ../Varriable/varriable.robot
Resource		../keywords/save_data_excel_page.robot
Resource		../Varriable/img.robot
Resource		../keywords/Save_LN_FR_Page.robot
Resource		../keywords/LivenessAPI_page.robot
Resource		../Varriable/Tablet_varriable.robot
Resource        ../keywords/Save_IAL_Level.robot
Resource        ../keywords/IAL_Page.robot
Resource		../keywords/Twin_page.robot
Resource        ../keywords/IAL_Page.robot
Resource        ../keywords/Generate_Transaction_page.robot
Resource        ../keywords/QR_code_page.robot
Resource        ../keywords/Generate_Partner_Secret_page.robot

Resource		../Main/Main.robot
Suite Setup         Generate_Partner_Secret
Suite Teardown      Log to console   ${TRANS_ID}


#row 18 jar
#row 17 pepsi

***Test Cases***
Start_push_noti
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_pass              17
    Check_DOPA_API_page.Check_DOPA          
    LivenessAPI_page.Liveness_and_FR_Pass
    	Check_ial_is_2_3                        ${TRANS_ID}    
