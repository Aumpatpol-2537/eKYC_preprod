*** Settings ***
Library         RequestsLibrary
Resource       ../keywords/Get_term_and_conditionAPI_page.robot
Resource       ../keywords/validate_customer_API_page.robot
Resource       ../keywords/Get_Consent_API_page.robot
Resource       ../keywords/sent_SMS(OTP)API_page.robot
Resource       ../keywords/verify_OTP_API_page.robot
Resource       ../keywords/Check_DOPA_API_page.robot
Resource       ../keywords/Validate_imageAPI_page.robot
Resource       ../keywords/LivenessAPI_page.robot
Resource       ../keywords/Facial_RecognitionAPI_page.robot
Resource       ../Varriable/varriable.robot
Resource		../keywords/save_data_excel_page.robot
Resource		../keywords/Save_LN_FR_Page.robot
Resource        ../keywords/IAL_Page.robot
Resource        ../keywords/Save_IAL_Level.robot

Library           DatabaseLibrary
Library           OperatingSystem
Library           Collections

Suite Setup         Create Session    alias=${ALIAS}    url=${URL_CORE_SERVICE}

***Test Cases***
ial_check_scene_1
    [Tags]      scene_1
    [Documentation]     ial ได้ score 2.3  ผ่านในครั้งแรก
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             3
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass
    Check_ial_is_2.3                                    ${TRANS_ID}         ${GET_CIF}
    [Teardown]      Save_IAL_Result_to_excel                            3

##########################################################################################

ial_check_scene_2_1
    [Tags]      scene_2
    [Documentation]     ial ครั้งแรก ได้ score 2.3
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             3
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass
    Check_ial_is_2.3                            ${TRANS_ID}         ${GET_CIF}

    [Teardown]      Save_IAL_Result_to_excel                            5

ial_check_scene_2_2
    [Tags]      scene_2
    [Documentation]     ial ครั้งที่ 2 ได้ score 2.2 และจะไม่อัพเกรดscoreเดิม
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             3
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    Face_Rec_Timeout3times
    
    Check_ial_is_2.2                            ${TRANS_ID}         ${GET_CIF}

    [Teardown]      Save_IAL_Result_to_excel                            6


##########################################################################################

ial_check_scene_3_1
    [Tags]      scene_3
    [Documentation]     ial ครั้งแรก ได้ score No
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             8
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA_Card_Not_Found_Laser_Code
    Check_ial_is_NO                            ${TRANS_ID}         ${GET_CIF}
    [Teardown]      Save_IAL_Result_to_excel                            8

ial_check_scene_3_2
    [Tags]      scene_3
    [Documentation]     ial ครั้งที่ 2 ได้ score 2.3 อัพเกรด score เดิม
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             9
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass
    Check_ial_is_2.3                            ${TRANS_ID}         ${GET_CIF}

    [Teardown]      Save_IAL_Result_to_excel                            9

##########################################################################################

ial_check_scene_4_1
    [Tags]      scene_4
    [Documentation]     ial ครั้งแรก ได้ score 2.2
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             11
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    Face_Rec_Timeout3times
    
    Check_ial_is_2.2_only                            ${TRANS_ID}         ${GET_CIF}

    [Teardown]      Save_IAL_Result_to_excel                            11

ial_check_scene_4_2
    [Tags]      scene_4
    [Documentation]     ial ครั้งที่ 2 ได้ score 2.3 และอัพเกรด score เดิม
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             11
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass
    Check_ial_is_2.3                            ${TRANS_ID}         ${GET_CIF}

    [Teardown]      Save_IAL_Result_to_excel                            12

##########################################################################################

ial_check_scene_5_1
    [Tags]      scene_5
    [Documentation]     ครั้งแรกได้   score 2.1
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             14
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA_TimeOut
    LivenessAPI_page.Liveness_and_FR_Pass
    IAL_Page.Check_ial_is_2.1                           ${TRANS_ID}         ${GET_CIF}
    [Teardown]      Save_IAL_Result_to_excel                            14

ial_check_scene_5_2
    [Tags]      scene_5
    [Documentation]     ครั้งที่ 2 ได้ score 2.2
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             14
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA
    Face_Rec_Timeout3times
    Check_ial_is_2.2_only                            ${TRANS_ID}         ${GET_CIF}
    [Teardown]      Save_IAL_Result_to_excel                            15

ial_check_scene_5_3
    [Tags]      scene_5
    [Documentation]     ครั้งที่ 3 ได้ score 2.3  
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_IAL_TEST             14
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass
    Check_ial_is_2.3                                    ${TRANS_ID}         ${GET_CIF}
    [Teardown]      Save_IAL_Result_to_excel                            16
    
##########################################################################################
