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
Resource	    ../keywords/Generate_Transaction_page.robot

Resource		../Main/Main.robot
Suite Setup			Start Project
# Suite Teardown		Stop Project
Suite Teardown      Log to console   ${TRANS_ID}


# robot   -t    eKYC_Happy_Journey_Complete_Register     api-ekyc/Test\ case/01_KYC_Happy_API.robot 

*** Test Cases ***
eKYC_Happy_Journey_Complete_Register
	[Documentation]			HAPPY-01
	[Tags]  run
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customers			4
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
		Get_Consent_API_page.Agree_Consent

		twin_page.Dont_Have_Twin
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass
		Save_Log_TC001_SUCCESS                                           4 

	Check_ial_is_2_3                        ${TRANS_ID}    
	[Teardown]		save_data_excel_page.Save_eKYC_Happy-01  				4


Happy_002
	[Documentation]		ลูกค้า Verrify OTP ผ่าน ในครั้งที่ 3
	[Tags]  run
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customers             5
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Save_Result_non_action_eKYC_45						
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP_Value_not_match
	Save_Result_REF_2_eKYC_45								
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Done_3_0f_3
		Save_Result_REF_3_eKYC_45	
				Get_Consent_API_page.Agree_Consent

	twin_page.Dont_Have_Twin
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass
	Check_ial_is_2_3                        ${TRANS_ID}    
		
	[Teardown]		save_data_excel_page.Save_scene_happy				5			5

Happy_003
	[Documentation]		ลูกค้า Verrify OTP ผ่าน ในครั้งที่ 3
	[Tags]  run
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customers             6
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Save_Result_non_action_eKYC_106_1							
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Save_Result_non_action_eKYC_106_2							
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_106_1							
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
    Verify_OTP_API_page.Verify_OTP_Error3_times
	Save_Result_Error3times_eKYC_106_2							
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Done_3_0f_3 
		Save_Result_REF_3_eKYC_106	
			Get_Consent_API_page.Agree_Consent
	twin_page.Dont_Have_Twin									
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass
	[Teardown]		save_data_excel_page.Save_scene_happy				6		6


Happy_004
	[Documentation]		DOPA Offline ผ่านในครั้งที่ 3
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customers			7
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA_OFFLINE_Pass_at_3
    LivenessAPI_page.Liveness_and_FR_Pass
	[Teardown]		save_data_excel_page.Save_scene_happy				7		7

Happy_005
	[Documentation]		ลูกค้าทำ Liveness ผ่านในครั้งที่ 3
	[Tags]  run

	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customers			8
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA
	twin_page.Dont_Have_Twin									

    LivenessAPI_page.Liveness_fail              #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_fail_2            #LNครั้งที่ 2 fail
        LivenessAPI_page.Liveness_and_FR_Pass

    Save_Log_TC002_SUCCESS                                          5
	Check_ial_is_2_3                        ${TRANS_ID}    

	[Teardown]		save_data_excel_page.Save_Facial_Happy				8			5

Happy_006
	[Documentation]		ลูกค้าทำ FaceRec ผ่านในครั้งที่ 3
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customers			9
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
			Get_Consent_API_page.Agree_Consent
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail      #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_fail      #LNครั้งที่ 2 fail
        Facial_RecognitionAPI_page.Face_Rec_fail   #LNครั้งที่ 3 Pass FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail                 #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout              #LNครั้งที่ 2 timeout
        Facial_RecognitionAPI_page.Face_Rec_fail_2   #LNครั้งที่ 3 Pass FR ครั้งที่ 2 Fail

    LivenessAPI_page.Liveness_fail                 #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout              #LNครั้งที่ 2 timeout
    LivenessAPI_page.Liveness_Timeout_2             #LNครั้งที่ 3 timeout
    LivenessAPI_page.Liveness_fail_2               #LNครั้งที่ 4 timeout
        LivenessAPI_page.Liveness_and_FR_Pass

    Save_Log_TC003_SUCCESS                                          6
	[Teardown]		save_data_excel_page.Save_Facial_Happy			9		6

Happy_007
	[Documentation]		ทำ FaceRec Fail 2 ครั้ง Timeout2 ครั้ง และผ่านในครั้งสุดท้าย
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customers			10
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail                  #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_fail                  #LNครั้งที่ 2 fail
        Facial_RecognitionAPI_page.Face_Rec_fail     #LNครั้งที่ 3 pass FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail                   #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout                #LNครั้งที่ 1 timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout  #LNครั้งที่ 3 pass FR ครั้งที่ 2 Timeout

    LivenessAPI_page.Liveness_fail                   #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout                #LNครั้งที่ 2 timeout
    LivenessAPI_page.Liveness_Timeout                #LNครั้งที่ 3 timeout
    LivenessAPI_page.Liveness_fail                   #LNครั้งที่ 4 fail
        Facial_RecognitionAPI_page.Face_Rec_fail_2     #LNครั้งที่ 3 pass FR ครั้งที่ 3 Fail

    LivenessAPI_page.Liveness_fail                   #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout                #LNครั้งที่ 1 timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout_2     #LNครั้งที่ 3 pass FR ครั้งที่ 4 Timeout

    LivenessAPI_page.Liveness_fail                      #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout                   #LNครั้งที่ 2 timeout
        LivenessAPI_page.Liveness_and_FR_Pass

    Save_Log_TC004_SUCCESS                  7
	[Teardown]		save_data_excel_page.Save_Facial_Happy			10		7


Happy_008
	[Documentation]		ลูกค้าเลือกว่ามีคู่แฝด หญิง
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customers			11
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
			Get_Consent_API_page.Agree_Consent
	twin_page.Have_Twin_Female
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass

	Check_ial_is_2_3                        ${TRANS_ID}    
	[Teardown]		save_data_excel_page.Save_eKYC_Happy-01  				11


Happy_009
	[Documentation]		ลูกค้าเลือกว่ามีคู่แฝด ชาย
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customers			12
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
			Get_Consent_API_page.Agree_Consent
	Twin_page.Have_Twin_Male
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass

	Check_ial_is_2_3                        ${TRANS_ID}    
	[Teardown]		save_data_excel_page.Save_eKYC_Happy-01  				12

