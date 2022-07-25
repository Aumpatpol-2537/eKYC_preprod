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
Resource        ../keywords/Login_api_page.robot
Resource		../Main/Main.robot
Resource        ../keywords/QR_code_page.robot
Resource        ../keywords/Api-integrate-mobile_page.robot
Resource        ../keywords/Generate_Partner_Secret_page.robot
Resource        ../keywords/Api-integrate-mobile_page.robot
Resource        ../keywords/Connect_database_page.robot

Suite Setup         Generate_Partner_Secret


***Test Cases***
Test_Check_Last_Version_1
    [Tags]      Regression
    [Documentation]   ทดสอบระบบ api-check eligible bio กรณีตั้งรับ ial2.3 และ ลูกค้ามี ial=2.3
    Api-integrate-mobile_page.Check_Last_Version         3 
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    3

Test_Check_Last_Version_2    
    [Documentation]   ทดสอบระบบ api-check eligible bio กรณีตั้งรับ ial2.3 และ ลูกค้ามี ial=2.1
    [Tags]      Last_Versions
    Run Keyword And Ignore Error                        Api-integrate-mobile_page.Check_Last_Version         4 
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    4

Test_Check_Last_Version_3
    [Documentation]   ทดสอบระบบ api-check eligible bio กรณีตั้งรับ ial2.1 และ ลูกค้ามี ial=2.1
    [Tags]      Last_Versions
    Run Keyword And Ignore Error                        Api-integrate-mobile_page.Check_Last_Version         5 
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    5

Test_Check_Last_Version_4
    [Documentation]   ทดสอบระบบ api-check eligible bio กรณีตั้งรับ ial2.3 แต่ลูกค้าไม่มี ial
    [Tags]      Last_Versions
    Run Keyword And Ignore Error                        Api-integrate-mobile_page.Check_Last_Version         6 
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    6

Test_Check_Last_Version_5
    [Documentation]   "ทดสอบระบบ api-check eligible bio กรณีตั้งรับ ial2.3 และ ลูกค้าทำ kyc มา 3 ครั้ง ครั้งที่1 = 2.1 ครั้งที่ 2  = 2.3 ครั้งที่ 3 = 2.3"
    [Tags]      Last_Versions
    Run Keyword And Ignore Error                        Api-integrate-mobile_page.Check_Last_Version         6
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    6

Test_Check_Last_Version_6
    [Documentation]   ทดสอบระบบ api-check eligible bio กรณี get data ลูกค้ามี transaction_status = pending
    [Tags]      Last_Versions
    Run Keyword And Ignore Error                        Api-integrate-mobile_page.Check_Last_Version         6
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    6

Test_Check_Last_Version_7
    [Documentation]   ทดสอบระบบ api-check eligible bio กรณี get data ลูกค้ามี transaction_status = pending
    [Tags]      Last_Versions
    Run Keyword And Ignore Error                        Api-integrate-mobile_page.Check_Last_Version         6
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    6

Test_Check_Last_Version_8
    [Documentation]   ทดสอบระบบ api-check eligible bio กรณีตั้งรับ ial2.3 และ ลูกค้ามี ial=2.3 ที่หมดอายุ
    [Tags]      Last_Versions
    Run Keyword And Ignore Error                        Api-integrate-mobile_page.Check_Last_Version         10
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    10

Test_Check_Last_Version_9
    [Documentation]   ทดสอบระบบ api-check eligible bio กรณีตั้งรับ ial2.3 ลูกค้ามี ial=2.3 แต่หน้าของลูกค้าเกิด temporary lock
    [Tags]      Last_Versions
    Connect_database_page.Process_Set_Facial_temp_lock         1100600292875
    Run Keyword And Ignore Error                        Api-integrate-mobile_page.Check_Last_Version         11
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    11

Test_Check_Last_Version_10
    [Documentation]   ทดสอบระบบ api-check eligible bio กรณีตั้งรับ ial2.3 ลูกค้ามี ial=2.3 หน้าของลูกค้าเกิด permanance lock
    [Tags]      Last_Versions
    Run Keyword And Ignore Error                        Api-integrate-mobile_page.Check_Last_Version         12
    [Teardown]      Run Keyword And Ignore Error        save_data_excel_page.Save_Result_get_eligible_bio    12







Test_Get_Last_Transaction_1
    [Documentation]   ทดสอบระบบ api-get last transaction status กรณี get data ลูกค้าไม่เคยทำ ekyc มาก่อน
    [Tags]      Regression
    Run Keyword And Ignore Error                       Api-integrate-mobile_page.Get_Last_Transaction      3
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Get_last_Transaction      3

Test_Get_Last_Transaction_2
    [Documentation]   ทดสอบระบบ api-get last transaction status กรณี get data ลูกค้าทำ ekyc และมี Status เป็น Unsuccess
     Run Keyword And Ignore Error                       Api-integrate-mobile_page.Get_Last_Transaction      4
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Get_last_Transaction      4

Test_Get_Last_Transaction_3
    [Documentation]   ทดสอบระบบ api-get last transaction status กรณี get data ลูกค้าทำ ekyc และมี Status เป็น Success
    [Tags]      Regression
    Run Keyword And Ignore Error                       Api-integrate-mobile_page.Get_Last_Transaction      5
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Get_last_Transaction      5

Test_Get_Last_Transaction_4
    [Documentation]   ทดสอบระบบ api-get last transaction status กรณี get data ลูกค้าทำ ekyc และมี Status เป็น Pending
     Run Keyword And Ignore Error                       Api-integrate-mobile_page.Get_Last_Transaction      7
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Get_last_Transaction      7

Test_Get_Last_Transaction_5
    [Documentation]   "ทดสอบระบบ api-get last transaction status กรณี get data ลูกค้าทำ ekyc และมี Status เป็น In progress"
     Run Keyword And Ignore Error                       Api-integrate-mobile_page.Get_Last_Transaction      7
    [Teardown]       Run Keyword And Ignore Error       save_data_excel_page.Save_Result_Get_last_Transaction      7


############################################################################################################


Test_Get_last_QR_1
    [Documentation]   ทดสอบระบบ api-Get Last QR กรณี ลูกค้าเคย Gen QR มาก่อน
    [Tags]      Regression
    Run Keyword And Ignore Error                    Api-integrate-mobile_page.Get_Last_QR  3
    [Teardown]      Run Keyword And Ignore Error    save_data_excel_page.Save_Result_Get_last_QR  3

Test_Get_last_QR_2
    [Documentation]   ทดสอบระบบ api-Get Last QR กรณี ลูกค้าไม่เคย Gen QR มาก่อน
    Run Keyword And Ignore Error                    Api-integrate-mobile_page.Get_Last_QR  4
    [Teardown]      Run Keyword And Ignore Error    save_data_excel_page.Save_Result_Get_last_QR  4

Test_Get_last_QR_3
    [Documentation]   ทดสอบระบบ api-Get Last QR กรณี ลูกค้าเคย Gen QR มาก่อน และ QR นั้นหมดอายุ
    Run Keyword And Ignore Error                    Api-integrate-mobile_page.Get_Last_QR  5
    [Teardown]      Run Keyword And Ignore Error    save_data_excel_page.Save_Result_Get_last_QR  5

Test_Get_last_QR_4
    [Documentation]   ทดสอบระบบ api-Get Last QR กรณี ลูกค้ามี Last QR 1 journey
    Run Keyword And Ignore Error                    Api-integrate-mobile_page.Get_Last_QR  6
    [Teardown]      Run Keyword And Ignore Error    save_data_excel_page.Save_Result_Get_last_QR  6

Test_Get_last_QR_5
    [Documentation]   ทดสอบระบบ api-Get Last QR กรณี ลูกค้ามี Last QR มากกว่า 1 journey
    Run Keyword And Ignore Error                    Api-integrate-mobile_page.Get_Last_QR  7
    [Teardown]      Run Keyword And Ignore Error    save_data_excel_page.Save_Result_Get_last_QR  7

Test_Get_last_QR_6
    [Documentation]   ทดสอบระบบ api-Get Last QR กรณี service down