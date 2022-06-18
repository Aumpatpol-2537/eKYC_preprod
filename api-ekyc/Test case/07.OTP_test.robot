***Settings***
Library         RequestsLibrary
Resource       ../keywords/Get_term_and_conditionAPI_page.robot
Resource       ../keywords/Validate_customer_API_page.robot
Resource       ../keywords/Get_Consent_API_page.robot
Resource       ../keywords/Sent_SMS(OTP)API_page.robot
Resource       ../keywords/Verify_OTP_API_page.robot
Resource       ../keywords/Check_DOPA_API_page.robot
Resource       ../keywords/Validate_imageAPI_page.robot
Resource		../keywords/save_data_excel_page.robot
Suite Setup         Create Session    alias=${ALIAS}    url=${URL_CORE_SERVICE}

# python3 -m robot -t eKYC_45		07.OTP_test.robot
# python3 -m robot -t Mobile_Not_Found	  07.OTP_test.robot
# python3 -m robot -i HAPPY 	07.OTP_test.robot
# python3 -m robot -i UNHAPPY 	07.OTP_test.robot

#python3 -m robot --timestampoutputs --log OTP_Happy.html --report  OTP_Happy_Report.html  --output  OTP_Happy.xml  --outputdir   /Users/patcharapol/Desktop/eKYC/Log/OTP/HAPPY     -i HAPPY 	   07.OTP_test.robot
#python3 -m robot --timestampoutputs --log OTP_UnHappy.html --report  OTP_UnHappy_Report.html  --output  OTP_UnHappy.xml  --outputdir   /Users/patcharapol/Desktop/eKYC/Log/OTP/UNHAPPY     -i UNHAPPY 	   07.OTP_test.robot

#python3 -m robot --timestampoutputs --log Request_3x3.html --report  Request_3x3_report.html  --output  Request_3x3.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/OTP/UNHAPPY  -t Request_3x3    07.OTP_test.robot
#python3 -m robot --timestampoutputs --log eKYC_64.html --report  eKYC_64_report.html  --output  eKYC_64.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/OTP/UNHAPPY  -t eKYC_64    07.OTP_test.robot


#python3 -m robot -t Verrify_Success api-ekyc/Test\ case/07.OTP_test.robot 

***Test Cases***
Verrify_Success
	[Tags]				HAPPY
    [Documentation]     ยิงผ่านได้ในครั้งแรก || HAPPY
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             3
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP
	save_data_excel_page.Save_Result_OTP_Happy
	[Teardown]		Save_Final_Result_to_excel					4	

eKYC_45
	[Tags]				HAPPY
    [Documentation]     ส่ง OTP 3 ครั้ง REFแรกไม่สนใจ REF ที่2 กรอกผิด REF 3 กรอกถูกครั้งที่ 3  || HAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             4
	Get_Consent_API_page.Get_consent
		Sent_SMS(OTP)API_page.Sent_OTP
		Save_Result_non_action_eKYC_45						
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP_Value_not_match
	Save_Result_REF_2_eKYC_45								
		Sent_SMS(OTP)API_page.Sent_OTP
		Verify_OTP_API_page.Verify_OTP_Done_3_0f_3
		Save_Result_REF_3_eKYC_45								
	[Teardown]		Save_Final_Result_to_excel						5	

eKYC_106
	[Tags]				HAPPY
    [Documentation]     ส่ง OTP ทั้งหมด 5 ครั้ง 2 REF แรกไม่สนใจ REF3,4 กรอกผิดทั้งหมด REF 5 กรอกถูกครั้งสุดท้าย  || HAPPY  
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             4 
	Get_Consent_API_page.Get_consent
		Sent_SMS(OTP)API_page.Sent_OTP
		Save_Result_non_action_eKYC_106_1							
	Sent_SMS(OTP)API_page.Sent_OTP
	Save_Result_non_action_eKYC_106_2							
		Sent_SMS(OTP)API_page.Sent_OTP
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_106_1							
	Sent_SMS(OTP)API_page.Sent_OTP
    Verify_OTP_API_page.Verify_OTP_Error3_times
	Save_Result_Error3times_eKYC_106_2							
		Sent_SMS(OTP)API_page.Sent_OTP
		Verify_OTP_API_page.Verify_OTP_Done_3_0f_3 
		Save_Result_REF_3_eKYC_106										
	[Teardown]		Save_Final_Result_to_excel						6	


###############################################################################################

Request_3x3
	[Tags]				UNHAPPY
    [Documentation]     ส่ง 3 ครั้ง และผิดทุก REF อย่างละ 3 ครั้ง || UNHAPPY
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             3
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Save_Result_non_action_3x3
		Sent_SMS(OTP)API_page.Sent_OTP                  #ส่งครั้งที่ 1
		Verify_OTP_API_page.Verify_OTP_Error2_times         #กรอกผิด 3 ครั้ง
		Save_Result_Error3times_3x3_1
	Sent_SMS(OTP)API_page.Sent_OTP                  #ส่งครั้งที่2
	Verify_OTP_API_page.Verify_OTP_Error3_times         #กรอกผิด 3 ครั้ง
	Save_Result_Error3times_3x3_2

	Sent_SMS(OTP)API_page.Sent_OTP
	Save_Result_non_action_3x3_2

		Sent_SMS(OTP)API_page.Sent_OTP                  #ส่งครั้งที่ 3
		Verify_OTP_API_page.Verify_OTP_Error3_times         #กรอกผิด 3 ครั้ง
		Save_Result_Error3times_3x3_3
	# Sent_SMS(OTP)API_page.Sent_OTP_Check_Maximum_times
	[Teardown]		Save_Final_Result_to_excel					10

eKYC_64
	[Tags]				UNHAPPY
    [Documentation]   ส่ง 3 ครั้ง ครั้งที่ 1,2 ผิดอย่างละครั้ง ครั้งสุดท้ายผิด 3 ครั้ง || UNHAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             4
	Get_Consent_API_page.Get_consent
		Sent_SMS(OTP)API_page.Sent_OTP
		Verify_OTP_API_page.Verify_OTP_Value_not_match 
		Save_Result_error1_eKYC_64_1
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP_Value_not_match 
	Save_Result_error1_eKYC_64_2
		Sent_SMS(OTP)API_page.Sent_OTP
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_64
	[Teardown]		Save_Final_Result_to_excel				7

eKYC_107
	[Tags]				UNHAPPY
    [Documentation]     2 ครั้งแรกไม่สนใจ REF ที่3,4,5 ผิดอย่างละ 3 ครั้ง || UNHAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             5
	Get_Consent_API_page.Get_consent
		Sent_SMS(OTP)API_page.Sent_OTP
		Save_Result_non_action_eKYC_107_1							
	Sent_SMS(OTP)API_page.Sent_OTP
	Save_Result_non_action_eKYC_107_2							
		Sent_SMS(OTP)API_page.Sent_OTP
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_107_1							
	Sent_SMS(OTP)API_page.Sent_OTP
    Verify_OTP_API_page.Verify_OTP_Error3_times
	Save_Result_Error3times_eKYC_107_2							
		Sent_SMS(OTP)API_page.Sent_OTP
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_107_3								
	[Teardown]		Save_Final_Result_to_excel						8			

eKYC_108
	[Tags]				UNHAPPY
    [Documentation]   ส่งทั้งหมด 3 ครั้ง ครั้งที่ 1,3 ผิด 3 ครั้ง ครั้งที่ 2 ผิด 2 ครั้ง
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             5
	Get_Consent_API_page.Get_consent
		Sent_SMS(OTP)API_page.Sent_OTP
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_108_1
	Sent_SMS(OTP)API_page.Sent_OTP
    Verify_OTP_API_page.Verify_OTP_Done_2_0f_3
	Save_Result_2_0f_3_eKYC_108
		Sent_SMS(OTP)API_page.Sent_OTP
		Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_108_2
	# Sent_SMS(OTP)API_page.Sent_OTP_Check_Maximum_times
	[Teardown]		Save_Final_Result_to_excel					9

eKYC_110
	[Tags]				UNHAPPY
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             3
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Save_Result_non_action_eKYC_110
		Sent_SMS(OTP)API_page.Sent_OTP
    	Verify_OTP_API_page.Verify_OTP_Error3_times
		Save_Result_Error3times_eKYC_110_3
	Sent_SMS(OTP)API_page.Sent_OTP
    Verify_OTP_API_page.Verify_OTP_Error3_times
	Save_Result_Error3times_eKYC_110
		Sent_SMS(OTP)API_page.Sent_OTP
		Save_Result_non_action_eKYC_110_2
	Sent_SMS(OTP)API_page.Sent_OTP
    Verify_OTP_API_page.Verify_OTP_Error3_times
	Save_Result_Error3times_eKYC_110_2
	[Teardown]		Save_Final_Result_to_excel			11

Mobile_Not_Found
	[Tags]				UNHAPPY
	[Documentation]     เบอร์ไม่มีอยู่ในระบบ || UNHAPPY
	Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customer_Get_Mobile_Number_Not_Found		
	# Get_Consent_API_page.Get_consent
	# Sent_SMS(OTP)API_page.Sent_OTP
	# Verify_OTP_API_page.Verify_OTP
	# save_data_excel_page.Save_Result_OTP_Happy
	Save_Mobile_Not_Found
	[Teardown]		Save_Final_Result_to_excel					12
