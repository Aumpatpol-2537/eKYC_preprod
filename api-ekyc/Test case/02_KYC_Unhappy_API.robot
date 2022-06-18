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
Resource	    ../keywords/Generate_Transaction_page.robot
Resource		../keywords/Twin_page.robot

Resource		../Main/Main.robot
Suite Setup			Start Project
Suite Teardown      Log to console   ${TRANS_ID}


***Test Cases***
eKYC_Unhappy_001
	[Documentation]		Validate_Customer || Not Customer
	[Tags]  run
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_Not_Customer							4
	[Teardown]		save_data_excel_page.Save_Unhappy_Validate_Customer_API  			4

eKYC_Unhappy_002
	[Documentation]		Validate_Customer ||Not Found Number  ระบบ สามารถ detect ID Card ได้  แต่ไม่พบเบอร์ของลูกค้า
	[Tags]  run
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_Not_Found_Mobile_Number  				5
	[Teardown]		save_data_excel_page.Save_Unhappy_Validate_Customer_API  			5

eKYC_Unhappy_003
	[Documentation]		OTP เบอร์ผิดรูปแบบ
	[Tags]  run
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_Invalid_Mobile_Number  		6
	# Get_Consent_API_page.Get_consent
	${1ignore}   Run Keyword And Ignore Error		Sent_SMS(OTP)API_page.Sent_OTP
	# ${2ignore}   Run Keyword And Ignore Error	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	# ${3ignore}   Run Keyword And Ignore Error			Verify_OTP_API_page.Verify_OTP
	[Teardown]		save_data_excel_page.Save_Unhappy_OTP  						6	

eKYC_Unhappy_004
	[Documentation]		ลูกค้า Verrify OTP ส่ง 3 ครั้ง ครั้งที่ 1,2 ผิดอย่างละครั้ง ครั้งสุดท้ายผิด 3 ครั้ง
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             7
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Value_not_match 
		Save_Result_error1_eKYC_64_1
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP_Value_not_match 
	Save_Result_error1_eKYC_64_2
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_64
	[Teardown]		save_data_excel_page.Save_Unhappy_OTP 				 7				

eKYC_Unhappy_005
	[Documentation]		ลูกค้าไม่สนใจ sms 2 ครั้งแรกและ ครั้งที่ 3 ,4,5 กรอกผิด ทั้งหมด
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             8
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Save_Result_non_action_eKYC_107_1							
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Save_Result_non_action_eKYC_107_2							
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Error3_times								### กรอกผิด 3 ครั้ง
		Save_Result_Error3times_eKYC_107_1							
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
    Verify_OTP_API_page.Verify_OTP_Error3_times									### กรอกผิด 3 ครั้ง
	Save_Result_Error3times_eKYC_107_2							
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Error3_times								### กรอกผิด 3 ครั้ง
		Save_Result_Error3times_eKYC_107_3								
	[Teardown]		save_data_excel_page.Save_Unhappy_OTP 				 8

eKYC_Unhappy_006
	[Documentation]		ลูกค้ารับ sms#1 กรอกผิด 3 ครั้ง sms#2 กรอกผิด 2 ครั้ง sms#3 กรอกผิด3 ครั้ง
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             9
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_108_1
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
    Verify_OTP_API_page.Verify_OTP_Done_2_0f_3
	Save_Result_2_0f_3_eKYC_108
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_108_2
	[Teardown]		save_data_excel_page.Save_Unhappy_OTP 				9		

eKYC_Unhappy_007
	[Documentation]		ลูกค้า ได้รับ SMS 5 ครั้ง และใส่ OTP ผิดทั้งหมด 3 Ref
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             10
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Save_Result_non_action_eKYC_110
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
    	Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_110_3
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
    Verify_OTP_API_page.Verify_OTP_Error3_times
	Save_Result_Error3times_eKYC_110
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Save_Result_non_action_eKYC_110_2
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
    Verify_OTP_API_page.Verify_OTP_Error3_times
	Save_Result_Error3times_eKYC_110_2
	[Teardown]		save_data_excel_page.Save_Unhappy_OTP 				10



eKYC_Unhappy_009
	[Documentation]		DOPA Offline 3 ครั้ง
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             12
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA_OFFLINE_3of3
	[Teardown]		save_data_excel_page.Save_DOPA_Unhappy  				12				6			

# eKYC_Unhappy_010
# 	[Documentation]		DOPA Offline 3 ครั้ง และ Batch Fail
# 	Get_term_and_conditionAPI_page.Get_term_and_conditions
# 	Validate_customer_API_page.Validate_customers			4
# 	Sent_SMS(OTP)API_page.Sent_OTP
# 	Get_Consent_API_page.Get_consent
# 	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
# 	Verify_OTP_API_page.Verify_OTP
# 	Check_DOPA_API_page.Check_DOPA_TimeOut

eKYC_Unhappy_11
	[Documentation]		ข้อมูลที่ใช้ในการตรวจสอบไม่ครบ
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             14
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA_card_loss_Data
	[Teardown]		save_data_excel_page.Save_DOPA_Unhappy  				14				9

eKYC_Unhappy_12
	[Documentation]		ไม่พบเลข Laser จาก PID นี้
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             15
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA_Card_Not_Found_Laser_Code
	[Teardown]		save_data_excel_page.Save_DOPA_Unhappy  				15				11

eKYC_Unhappy_13
	[Documentation]		Chip No สถานะไม่ปกติ
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             16
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA_Error_Chip_no
	[Teardown]		save_data_excel_page.Save_DOPA_Unhappy  				16				5

eKYC_Unhappy_14
	[Documentation]		บัตรสิ้นสภาพการใช้งาน เนื่องจากกรณี บัตรหมดอายุ
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             17
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA_Card_Expire
	[Teardown]		save_data_excel_page.Save_DOPA_Unhappy  				17			10


eKYC_Unhappy_15
	[Documentation]		ทำ FaceRec ไม่ผ่าน 3 ครั้ง Timeout 2 ครั้ง
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             18
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail                  #LN ครั้งที่ 1 fail
    LivenessAPI_page.Liveness_fail                  #LN ครั้งที่ 2 fail
        Facial_RecognitionAPI_page.Face_Rec_fail    #LN ครั้งที่ 3 pass FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail                  #LN ครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout               #LN ครั้งที่ 2 timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout    #LN ครั้งที่ 3 pass FR ครั้งที่ 2 Timeout

    LivenessAPI_page.Liveness_fail                     #LN ครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout                  #LN ครั้งที่ 3 timeout
    LivenessAPI_page.Liveness_Timeout                  #LN ครั้งที่ 4 timeout
    LivenessAPI_page.Liveness_fail                     #LN ครั้งที่ 5 fail
        Facial_RecognitionAPI_page.Face_Rec_fail_2       #LN ครั้งที่ 3 pass FR ครั้งที่ 3 Fail

    LivenessAPI_page.Liveness_fail                     #LN ครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout                  #LN ครั้งที่ 2 timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout_2    #LN ครั้งที่ 2 pass FR ครั้งที่ 4 Timeout

    LivenessAPI_page.Liveness_fail                     #LN ครั้งที่ 1 fail
    LivenessAPI_page.Liveness_Timeout                  #LN ครั้งที่ 1 timeout
        Facial_RecognitionAPI_page.Face_Rec_fail_3       #LN ครั้งที่ 3 pass FR ครั้งที่ 5 Fail
        Face_Rec_reached_max                           #FR ครั้งที่ 6 max

    Save_Log_TC001_UNSUCCESS                    8

	[Teardown]			save_data_excel_page.Save_Facial_Unhappy 		 18			8

eKYC_Unhappy_16
	[Documentation]		Liveness ไม่ผ่าน 3 ครั้ง และ timeout 2 ครั้ง
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             19
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
        Facial_RecognitionAPI_page.Face_Rec_fail      #FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail_2       #FR ครั้งที่ 2 Fail

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout_2
    LivenessAPI_page.Liveness_fail_2
    LivenessAPI_page.Liveness_fail_3
    LN_reached_max

    Save_Log_TC002_UNSUCCESS                                        9
	[Teardown]			save_data_excel_page.Save_Facial_Unhappy 		 19			9


eKYC_Unhappy_17
	[Documentation]		FaceRec ไม่ผ่าน 3 ครั้ง
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             20
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
				Get_Consent_API_page.Agree_Consent
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
        Facial_RecognitionAPI_page.Face_Rec_fail        #FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail_2        #FR ครั้งที่ 2 Fail
        
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout_2
    LivenessAPI_page.Liveness_fail_2
        Facial_RecognitionAPI_page.Face_Rec_fail_3        #FR ครั้งที่ 3 Fail
    Face_Rec_reached_max

    Save_Log_TC003_UNSUCCESS                                        10
	[Teardown]			save_data_excel_page.Save_Facial_Unhappy 		 20			10


eKYC_Unhappy_18
	[Documentation]		Liveness ไม่ผ่าน 3 ครั้ง 
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             21
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA
				Get_Consent_API_page.Agree_Consent
			twin_page.Dont_Have_Twin

    LivenessAPI_page.Liveness_fail_3times
    LN_reached_max

    Save_Log_TC004_UNSUCCESS                                        11
	[Teardown]			save_data_excel_page.Save_Facial_Unhappy 		 21			11


eKYC_Unhappy_19
	[Documentation]		 Liveness timeout 3 ครั้ง
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy            22
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_Timeout3times
    LN_timeOut_reached_max

    # Save_Log_TC005_UNSUCCESS                                12
	# [Teardown]			save_data_excel_page.Save_Facial_Unhappy 		 22			12

eKYC_Unhappy_20
	[Documentation]		Check DOPA Fail
	[Tags]  run
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             23
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
	Get_Consent_API_page.Agree_Consent
			twin_page.Dont_Have_Twin
	Check_DOPA_API_page.Check_DOPA
	[Teardown]		save_data_excel_page.Save_DOPA_Unhappy  				23			5


eKYC_Unhappy_21
	[Documentation]		FaceRec Fail 3 time
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             24
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP
		Get_Consent_API_page.Agree_Consent
			twin_page.Dont_Have_Twin

	Check_DOPA_API_page.Check_DOPA
	Facial_RecognitionAPI_page.Face_Rec_fail 
	Facial_RecognitionAPI_page.Face_Rec_fail 
	Facial_RecognitionAPI_page.Face_Rec_fail 
	Facial_RecognitionAPI_page.Face_Rec_fail 

    Save_Log_TC006_UNSUCCESS                                13
	[Teardown]			save_data_excel_page.Save_Facial_Unhappy 		 24			13

eKYC_Unhappy_22
	[Documentation]		ลูกค้าไม่กดรับ Consent
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             7
	Sent_SMS(OTP)API_page.Sent_OTP
	Get_Consent_API_page.Disagree_Consent

	[Teardown]		save_data_excel_page.Save_Disagree_Consent  			25		


eKYC_Unhappy_23
	[Documentation]		ลูกค้าไม่กดรับ Term and conditions
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Disagree_term_and_conditions
	[Teardown]		save_data_excel_page.Save_Disagree_Term  			26		


eKYC_Unhappy_24
	[Documentation]		Request OTP 5 ครั้งติด
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             27
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Sent_OTP
	[Teardown]		save_data_excel_page.Save_Unhappy_OTP  					27


eKYC_Unhappy_025
	[Documentation]		ใช้งานเกิน 3 REF ผิด ref ละ 1 ครั้ง
	Generate_Transaction_page.Start_Generate_Transaction
	Get_term_and_conditionAPI_page.Agree_term_and_conditions
	Validate_customer_API_page.Validate_customer_for_Unhappy             7
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Value_not_match 
		Save_Result_error1_eKYC_64_1
	Sent_SMS(OTP)API_page.Sent_OTP
	Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
	Verify_OTP_API_page.Verify_OTP_Value_not_match 
	Save_Result_error1_eKYC_64_2
		Sent_SMS(OTP)API_page.Sent_OTP
		Sent_SMS(OTP)API_page.Get_OTP_Value_from_database_by_api
		Verify_OTP_API_page.Verify_OTP_Value_not_match 
	Sent_SMS(OTP)API_page.Sent_OTP
