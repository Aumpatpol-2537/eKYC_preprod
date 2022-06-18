*** Settings ***
Library         RequestsLibrary
Library         Process

Resource       ../keywords/Get_term_and_conditionAPI_page.robot
Resource       ../keywords/validate_customer_API_page.robot
Resource       ../keywords/Get_Consent_API_page.robot
Resource       ../keywords/sent_SMS(OTP)API_page.robot
Resource       ../keywords/verify_OTP_API_page.robot
Resource       ../keywords/Check_DOPA_API_page.robot
Resource       ../keywords/Validate_imageAPI_page.robot
Resource       ../Varriable/varriable.robot
Resource		../keywords/save_data_excel_page.robot
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
# Resource		../Varriable/img.robot

Resource		../Main/Main.robot
Suite Setup         Generate_Partner_Secret


***Variables***
${KIM}          3bKXsswQmHb4kWg9eHpDiLyziQxvo9c9iHk3zmbTa6o14dHfQKP8GK4=
${AUM}          0I8SfCnkwkptBl1Z50x6mYNe0lbdJCRxMApy/0EMeYFwu59LCQxgxs4=
${KAI}          lZi8G4aWF/tfdvcqxlz7/TqaEwX9lorvoC0q3VbMYY8SetvOnp2nxXY=
${BOAT}         bdIH2kH8BqtGQVcAQIoYEePRdA6fUsSdZTGGKSBtcIu8PrNDPknRNV0=
${PKK}          2FuiN8sFH0Gm7CHS6Y69lXJzfpA370izzJpYame5Oi63RuBQ4LiTm0w=


***Test Cases***
Add_Data_To_eKYC
    QR_code_page.Generate_QR_Code_for_test_qrstamp_scene_add_data           ${PKK} 
    Main.Start Project
    QR_code_page.Validate_QR_Code_for_test_qrstamp_scene
    Get_term_and_conditionAPI_page.Agree_term_and_conditions
    Validate_customer_API_page.Validate_customer_pass                16
    Check_DOPA_API_page.Check_DOPA          
    LivenessAPI_page.Liveness_and_FR_Pass
