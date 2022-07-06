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
# Resource		../Varriable/api_varriable.robot
Resource		../Varriable/Tablet_varriable.robot
Resource        ../keywords/Save_IAL_Level.robot
Resource        ../keywords/IAL_Page.robot
Resource		../keywords/Twin_page.robot
Resource        ../keywords/IAL_Page.robot
Resource        ../keywords/Generate_Transaction_page.robot
Resource        ../keywords/QR_code_page.robot
Resource        ../keywords/Generate_Partner_Secret_page.robot
Resource        ../keywords/Counter_service_page.robot

Resource		../Main/Main.robot
# Suite Setup			Start Project
# Suite Teardown		Stop Project
Suite Setup         Generate_Partner_Secret
Suite Teardown      Log to console   ${TRANS_ID}


# robot  -t    Sign_up_Counter_Service_1        api-ekyc/Test\ case/23.Counter_service.robot 

***Test Cases***
Sign_up_Counter_Service_1
    [Documentation]     ทดสอบระบบ sign up counter service กรณีลูกค้าทำรายการสำเร็จ
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Counter_service_page.Validate_Sign_up_CS                                3
    Counter_service_page.Confirmation_Sign_up_CS
    [Teardown]      save_data_excel_page.Save_Result_Counter_Service        3


Sign_up_Counter_Service_2
    [Documentation]     ทดสอบระบบ sign up counter service กรณีลูกค้า scan qr code และ dip chip แล้วไม่ทำรายการต่อ
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Run Keyword And Ignore Error               Counter_service_page.Validate_Sign_up_CS                         4
    Run Keyword And Ignore Error               Counter_service_page.Confirmation_Sign_up_CS
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Counter_Service        4

Sign_up_Counter_Service_3
    [Documentation]     ทดสอบระบบ sign up counter service กรณีลูกค้า Dipchip ด้วยบัตรประชาชนคนละคนกับที่ Generate qr code
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Run Keyword And Ignore Error               Counter_service_page.Validate_Sign_up_CS                         5
    Run Keyword And Ignore Error               Counter_service_page.Confirmation_Sign_up_CS
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Counter_Service        5

Sign_up_Counter_Service_4
    [Documentation]     ทดสอบระบบ sign up counter service กรณี ส่ง information มาให้ด้วย data compare_score 0 คะแนน
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Run Keyword And Ignore Error               Counter_service_page.Validate_Sign_up_CS                         6
    Run Keyword And Ignore Error               Counter_service_page.Confirmation_Sign_up_CS
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Counter_Service        6

Sign_up_Counter_Service_5
    [Documentation]     ทดสอบระบบ sign up counter service กรณี ส่ง information มาให้ด้วย data compare_score มากกว่า 80 คะแนน
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Run Keyword And Ignore Error               Counter_service_page.Validate_Sign_up_CS                         7
    Run Keyword And Ignore Error               Counter_service_page.Confirmation_Sign_up_CS
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Counter_Service        7

Sign_up_Counter_Service_6
    [Documentation]     ทดสอบระบบ sign up counter service กรณีลูกค้า เกิด Temporary Lock และมาทำรายการที่ counter service
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Run Keyword And Ignore Error               Counter_service_page.Validate_Sign_up_CS                         8
    Run Keyword And Ignore Error               Counter_service_page.Confirmation_Sign_up_CS
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Counter_Service        8

Sign_up_Counter_Service_7
    [Documentation]     ทดสอบระบบ sign up counter service กรณีลูกค้า เกิด Permanence Lock และมาทำรายการที่ counter service
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Run Keyword And Ignore Error               Counter_service_page.Validate_Sign_up_CS                         9
    Run Keyword And Ignore Error               Counter_service_page.Confirmation_Sign_up_CS
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Counter_Service        9


