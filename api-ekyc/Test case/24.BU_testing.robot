*** Settings ***
Library         RequestsLibrary
# Resource       ../keywords/Get_term_and_conditionAPI_page.robot
# Resource       ../keywords/validate_customer_API_page.robot
# Resource       ../keywords/Get_Consent_API_page.robot
# Resource       ../keywords/sent_SMS(OTP)API_page.robot
# Resource       ../keywords/verify_OTP_API_page.robot
# Resource       ../keywords/Check_DOPA_API_page.robot
# Resource       ../keywords/Validate_imageAPI_page.robot
# Resource       ../Varriable/varriable.robot
# Resource		../keywords/save_data_excel_page.robot
# Resource		../Varriable/img.robot
# Resource		../keywords/Save_LN_FR_Page.robot
# Resource		../keywords/LivenessAPI_page.robot
# # Resource		../Varriable/api_varriable.robot
# Resource		../Varriable/Tablet_varriable.robot
# Resource        ../keywords/Save_IAL_Level.robot
# Resource        ../keywords/IAL_Page.robot
# Resource		../keywords/Twin_page.robot
# Resource        ../keywords/IAL_Page.robot
# Resource        ../keywords/Generate_Transaction_page.robot
# Resource        ../keywords/QR_code_page.robot
# Resource        ../keywords/Generate_Partner_Secret_page.robot

# Resource		../Main/Main.robot
# Suite Setup			Start Project
# Suite Teardown		Stop Project
# Suite Setup         Generate_Partner_Secret

Resource        ../keywords/Support_Test_BU_Page.robot




***Test Cases***
start_bu_journeys
    BU_journey        4


#  robot   api-ekyc/Test\ case/24.BU_testing.robot 