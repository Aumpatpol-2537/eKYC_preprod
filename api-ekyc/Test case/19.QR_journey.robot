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

Resource		../Main/Main.robot
Suite Setup         Generate_Partner_Secret
Suite Teardown      Log to console   ${TRANS_ID}


***Test Cases***
QR_journey_Validate_1
    [Documentation]      ทดสอบระบบ api-QR Code กรณี scan ผ่านในครั้งแรก
    Main.Start Project
    QR_code_page.Validate_QR_Code        3          Validate_QR
    [Teardown]      Run Keyword And Ignore Error            save_data_excel_page.Save_Result_Validate_QR        3

QR_journey_Validate_2
    [Documentation]      ทดสอบระบบ api-QR Code  กรณี Scan QR code ที่มาจากระบบอื่นๆ
    Main.Start Project
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code        4        Validate_QR
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Validate_QR        4

QR_journey_Validate_3
    [Documentation]      ทดสอบระบบ api-QR Code กรณี Scan QR code ที่ถูกต้องแต่หมดอายุ (Gen qr แต่ไม่ได้นำไปใช้อะไร)
    Main.Start Project
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code        5     Validate_QR
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Validate_QR        5

QR_journey_Validate_4
    [Documentation]      ทดสอบระบบ api-QR Code กรณีส่ง Request api qr string ไม่ครบ
    Main.Start Project
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code        6     Validate_QR
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Validate_QR        5

QR_journey_Validate_5
    [Documentation]      ทดสอบระบบ api-QR Code กรณีrequest โดยไม่มี auth.
    Main.Start Project
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code        5
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Validate_QR        5

QR_journey_Validate_6
    [Documentation]     ทดสอบระบบ api-QR Code  กรณี นำQR Code ที่ invalid มา scan
    Main.Start Project
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code        8     Validate_QR
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Validate_QR        8

QR_journey_Validate_7
    [Documentation]      ทดสอบระบบ api-QR Code กรณีscan qr code แล้วเล่นจนจบ Journey kyc
    Main.Start Project
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code        13
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Validate_QR        13

QR_journey_Validate_8
    [Documentation]     ทดสอบระบบ api-QR Code  กรณี นำQR Code ที่ Used มา scan
    Main.Start Project
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code        10     Validate_QR
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Validate_QR        10

#####################################################################################################################

QR_journey_Generate_1
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code กรณี gen qr code สำเร็จ
    QR_code_page.Generate_QR_Code  3
    [Teardown]      save_data_excel_page.Save_Result_Gen_QR  3

QR_journey_Generate_2
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code กรณี ไม่ส่งค่า cid ที่ request body
    Run Keyword And Ignore Error                        QR_code_page.Generate_QR_Code  4
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Gen_QR  4

QR_journey_Generate_3
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code กรณี ไม่ส่งค่า twin และ Gender ที่ request body
    Run Keyword And Ignore Error                        QR_code_page.Generate_QR_Code  5
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Gen_QR  5

QR_journey_Generate_4
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code กรณี ระบุ journey code ผิด ที่ request body
    Run Keyword And Ignore Error                        QR_code_page.Generate_QR_Code  6
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Gen_QR  6

QR_journey_Generate_5
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code กรณี ไม่ระบุ journey code ที่ request body
    Run Keyword And Ignore Error                        QR_code_page.Generate_QR_Code  7
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Gen_QR  7

QR_journey_Generate_6
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code กรณี ลูกค้า 1 คน Gen qr code 2 Journey
    QR_code_page.Generate_QR_Code  8
    [Teardown]      save_data_excel_page.Save_Result_Gen_QR  8

QR_journey_Generate_6.1
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code กรณี ลูกค้า 1 คน Gen qr code 2 Journey
    QR_code_page.Generate_QR_Code  9
    [Teardown]      save_data_excel_page.Save_Result_Gen_QR  9

QR_journey_Generate_7
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code กรณี ลูกค้าเลือกไม่มีคู่แฝด
    Run Keyword And Ignore Error                            QR_code_page.Generate_QR_Code  10
    [Teardown]      Run Keyword And Ignore Error            save_data_excel_page.Save_Result_Gen_QR  10


QR_journey_Generate_8
    [Tags]      Generate_qr_code
    [Documentation]     "ทดสอบระบบ api-Generate-QR code กรณี ลูกค้ามี qr code อยู่แล้ว และขอซ้ำอีกครั้ง"
    Run Keyword And Ignore Error                            QR_code_page.Generate_QR_Code  12
    [Teardown]      Run Keyword And Ignore Error            save_data_excel_page.Save_Result_Gen_QR  12

QR_journey_Generate_9
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code  กรณี QR ก่อนหน้านี้หมดอายุ และกลับมา Gen อีกครั้ง  
    Run Keyword And Ignore Error                            QR_code_page.Generate_QR_Code  13
    [Teardown]      Run Keyword And Ignore Error            save_data_excel_page.Save_Result_Gen_QR  13

QR_journey_Generate_10
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code  กรณี QR ก่อนหน้านี้ถูกใช้ไปแล้ว (Stamp used) และกลับมา Gen อีกครั้ง  
    Run Keyword And Ignore Error                            QR_code_page.Generate_QR_Code  14
    [Teardown]      Run Keyword And Ignore Error            save_data_excel_page.Save_Result_Gen_QR  14

QR_journey_Generate_11
    [Tags]      Generate_qr_code
    [Documentation]    ทดสอบระบบ api-Generate-QR code  กรณี QR ก่อนหน้านี้ถูกนำไปใช้ และทำรายการ ekyc unsuccess
    Run Keyword And Ignore Error                            QR_code_page.Generate_QR_Code  15
    [Teardown]      Run Keyword And Ignore Error            save_data_excel_page.Save_Result_Gen_QR  15

QR_journey_Generate_12
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code  กรณี QR ก่อนหน้านี้ถูกนำไปใช้ และทำรายการ ekyc in-progress
    Run Keyword And Ignore Error                            QR_code_page.Generate_QR_Code  16
    [Teardown]      Run Keyword And Ignore Error            save_data_excel_page.Save_Result_Gen_QR  16

QR_journey_Generate_13
    [Tags]      Generate_qr_code
    [Documentation]     ทดสอบระบบ api-Generate-QR code  กรณี QR ก่อนหน้านี้ถูกนำไปใช้ และทำรายการ ekyc pending
    Run Keyword And Ignore Error                            QR_code_page.Generate_QR_Code  16
    [Teardown]      Run Keyword And Ignore Error            save_data_excel_page.Save_Result_Gen_QR  16

#####################################################################################################################

QR_Stamp_used_1
    [Documentation]     ทดสอบระบบ Stamp QR Used กรณีลูกค้า Gen QR-code แต่ไม่ได้ใช้และเดินไปทำ KYC เลย
    Log     Test on postman

QR_Stamp_used_2
    [Documentation]     ทดสอบระบบ Stamp QR Used กรณีลูกค้า นำ QR code ที่ทำรายการ kyc สำเร็จแล้ว (สถานะ success) และ กลับมาทำ KYC อีกครั้ง
    [Tags]      Regression
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_pass              4
    Check_DOPA_API_page.Check_DOPA          
    LivenessAPI_page.Liveness_and_FR_Pass
    	Check_ial_is_2_3                        ${TRANS_ID}    
    # Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    # [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Stamp_Used        4

# robot   -t   QR_Stamp_used_2    api-ekyc/Test\ case/19.QR_journey.robot


QR_Stamp_used_3
    [Documentation]     ทดสอบระบบ Stamp QR Used กรณีลูกค้า Gen QR code มาทำ KYC และได้สถานะเป็น Pending
    # [Tags]  QR_Stamp_Used


QR_Stamp_used_4
    [Documentation]     ทดสอบระบบ Stamp QR Used กรณีลูกค้า Gen QR code มาทำ KYC และได้สถานะเป็น in progress
    [Tags]  QR_Stamp_Used
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Stamp_Used        6


QR_Stamp_used_5
    [Documentation]  ทดสอบระบบ Stamp QR Used กรณีลูกค้า Gen QR code มาทำ kyc และได้สถานะเป็น Unsuccess  (ลูกค้าไม่กดรับ Term & conditions) และ กลับมาทำ KYC อีกครั้ง
    [Tags]      Regression
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Disagree_term_and_conditions
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Stamp_Used        7


QR_Stamp_used_6
    [Documentation]  ทดสอบระบบ Stamp QR Used กรณีลูกค้า Gen QR code มาทำ kyc และได้สถานะเป็น Unsuccess  (Validate Customer Fail Dip chip ด้วยบัตรประชาชนผู้อื่น) และ กลับมาทำ KYC อีกครั้ง
    [Tags]      Regression
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_Fails          6
    Run Keyword And Ignore Error           QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Stamp_Used        8

QR_Stamp_used_7
    [Documentation]  ทดสอบระบบ Stamp QR Used กรณีลูกค้า Gen QR code มาทำ kyc และได้สถานะเป็น Unsuccess  (DOPA FAIL) และ กลับมาทำ KYC อีกครั้ง
    [Tags]      Regression
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_pass              4
    Check_DOPA_API_page.Check_DOPA_Fail           
    Run Keyword And Ignore Error           QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Stamp_Used        9

QR_Stamp_used_8
    [Documentation]  ทดสอบระบบ Stamp QR Used กรณีลูกค้า Gen QR code มาทำ kyc และได้สถานะเป็น Unsuccess  (FACIAL FAIL) และ กลับมาทำ KYC อีกครั้ง
    [Tags]      Regression
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_pass              4
    Check_DOPA_API_page.Check_DOPA          
    Facial_RecognitionAPI_page.Face_Rec_fail
    Facial_RecognitionAPI_page.Face_Rec_fail 
    Facial_RecognitionAPI_page.Face_Rec_fail 
    Facial_RecognitionAPI_page.Face_Rec_fail 
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Stamp_Used        10


QR_Stamp_used_9
    [Documentation]  ทดสอบระบบ Stamp QR Used กรณีลูกค้า มี QR code อยู่แล้ว 1 journey และลูกค้า GEN qr code journey อื่นเพิ่มอีก
    [Tags]  QR_Stamp_Used
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene_2
    Run Keyword And Ignore Error                        QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Stamp_Used        11

#####################################################################################################################

Modify_Validate_customer_1
    [Documentation]     ทดสอบระบบ Modify validate customer API กรณี ลูกค้า Gen QR code ด้วย เลขบัตรประชาชนของคนอื่น และมา dipchip ด้วยบัตรประชาชนของตนเอง
    [Tags]      Regression
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_qr_code_journey                                                  13
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Modify_validate_api        3

Modify_Validate_customer_2
    [Tags]      Regression
    [Documentation]     ทดสอบระบบ Modify validate customer API กรณี ลูกค้า Gen QR code และ Dipchip ด้วยบัตรประชาชนคนเดียวกัน
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_qr_code_journey                                                    4
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_Modify_validate_api        4

#####################################################################################################################
