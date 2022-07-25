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
Resource		../Main/Main.robot
Resource        ../keywords/Facial_authen_page.robot
Resource        ../keywords/Generate_Partner_Secret_page.robot
Resource        ../keywords/Facial_lock_page.robot
Resource        ../keywords/Connect_database_page.robot

Suite Setup         Generate_Partner_Secret


***Test Cases***
Facial_authen_01
    [Documentation]        ทดสอบระบบ Facial authen กรณีถ่ายภาพมายืนยัน จำนวน 1 ภาพ และผ่านในครั้งแรก
    Run Keyword And Ignore Error                        Facial_authen_page.Mobile_Facial_authen                     3    
    [Teardown]     Run Keyword And Ignore Error         save_data_excel_page.Save_Result_Facial_authen              3

Facial_authen_02
    [Tags]          Regression
    [Documentation]        ทดสอบระบบ Facial authen กรณีถ่ายภาพ Liveness fail จำนวน x ครั้ง และผ่านในครั้งสุดท้าย ครั้งที่ x
    Run Keyword And Ignore Error                                Facial_authen_page.Liveness_fail_authen            4
    Connect_database_page.Check_facial_temp_lock                 1100600292875
    # Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            4
    # [Teardown]     Run Keyword And Ignore Error         save_data_excel_page.Save_Result_Facial_authen              4

Facial_authen_03
    [Documentation]        ทดสอบระบบ Facial authen กรณีถ่ายภาพ Liveness fail จำนวน 10 ครั้ง และทำไม่ผ่านเลย จนครั้งที่ 10
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
    Run Keyword And Ignore Error         Facial_authen_page.Liveness_fail_authen            5
  
    [Teardown]     Run Keyword And Ignore Error         save_data_excel_page.Save_Result_Facial_authen              5

Facial_authen_04
    [Documentation]        ทดสอบระบบ Facial authen กรณีถ่ายภาพมายืนยัน มาเป็นคนละคนกับที่มีข้อมูลที่ KYC จำนวน 1 ครั้ง
    Run Keyword And Ignore Error                        Facial_authen_page.Facial_fail_authen                       6   
    [Teardown]     Run Keyword And Ignore Error         save_data_excel_page.Save_Result_Facial_authen              6


Facial_authen_05
    [Documentation]        ทดสอบระบบ Facial authen กรณีถ่ายภาพ Facial จำนวน 1 ครั้ง และผ่านใน ครั้งที่ 2
    Run Keyword And Ignore Error      Facial_authen_page.Facial_fail_authen                       7
    Facial_authen_page.Mobile_Facial_authen                     7
    [Teardown]     Run Keyword And Ignore Error         save_data_excel_page.Save_Result_Facial_authen              7

Facial_authen_06
    [Documentation]        ทดสอบระบบ Facial authen กรณีถ่ายภาพ Facial จำนวน 3 ครั้ง และทำไม่ผ่านเลย จนครั้งที่ 3 (ภาพมายืนยัน มาเป็นคนละคนกับที่มีข้อมูลที่ KYC)
    Run Keyword And Ignore Error        Facial_authen_page.Facial_fail_authen           8
    Run Keyword And Ignore Error        Facial_authen_page.Facial_fail_authen           8
    Run Keyword And Ignore Error        Facial_authen_page.Facial_fail_authen           8
    Connect_database_page.Check_facial_permananceLock_lock           1100600292875           
    # [Teardown]     Run Keyword And Ignore Error         save_data_excel_page.Save_Result_Facial_authen              8

Facial_authen_07
    [Documentation]        ทดสอบระบบ Facial authen กรณี ส่ง cid  ที่ไม่มีอยู่ในระบบ ekyc มา
    Run Keyword And Ignore Error                        Facial_authen_page.Mobile_Facial_authen                     9
    [Teardown]     Run Keyword And Ignore Error         save_data_excel_page.Save_Result_Facial_authen              9

Facial_authen_08
    [Documentation]       ทดสอบระบบ Facial authen กรณีถ่ายส่งมาเก็บภาพที่หลังบ้านจำนวน 10 รูป
    Run Keyword And Ignore Error        Facial_authen_page.Facial_authen_10_Pic             10  


Facial_authen_17
    [Documentation]       เมื่อลูกค้า เกิด Permanance Lock และ กลับมาทำรายการ KYC อีกครั้ง
    Facial_lock_page.Permanent_lock
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_pass                  4
    Check_DOPA_API_page.Check_DOPA          
    LivenessAPI_page.Liveness_and_FR_Pass
    [Teardown]     Run Keyword And Ignore Error         save_data_excel_page.Save_Result_Facial_authen              19

Facial_authen_18
    [Documentation]       ลูกค้า เกิด temporary lock และค่า temp_unlock  เหลือ 1 และลูกค้ากลับมาทำ KYC อีกครั้ง
    Facial_lock_page.Temporary_lock
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_pass                  4
    Check_DOPA_API_page.Check_DOPA          
    LivenessAPI_page.Liveness_and_FR_Pass
    [Teardown]     Run Keyword And Ignore Error         save_data_excel_page.Save_Result_Facial_authen             20


test_facail_authen
    Facial_authen_page.Liveness_fail_authen         10
    [Teardown]      Check_facial_temp_lock          1100600292875


Facial_authen_19
    [Tags]          Regression
    [Documentation]        ทดสอบระบบ Facial authen กรณีถ่ายภาพ Liveness fail จำนวน x ครั้ง และเกิด Temp Lock
    Run Keyword And Ignore Error                                Facial_authen_page.Liveness_fail_authen            4
    Connect_database_page.Check_facial_temp_lock                 1100600292875

Facial_authen_20
    [Tags]          Regression
    [Documentation]        ทดสอบระบบ Facial authen กรณีถ่ายภาพ face rec fail จำนวน x ครั้ง และเกิด permanance Lock
    Run Keyword And Ignore Error                        Facial_authen_page.Facial_fail_authen                       4
    Run Keyword And Ignore Error                        Facial_authen_page.Facial_fail_authen                       4
    Run Keyword And Ignore Error                        Facial_authen_page.Facial_fail_authen                       4
    Connect_database_page.Check_facial_permananceLock_lock          1100600292875
