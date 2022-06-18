***Settings***
Library         RequestsLibrary
Library             Collections

Resource       ../keywords/Get_term_and_conditionAPI_page.robot
Resource       ../keywords/validate_customer_API_page.robot
Resource       ../${ENV}/keywords/Get_Consent_API_page.robot
Resource       ../keywords/sent_SMS(OTP)API_page.robot
Resource       ../keywords/verify_OTP_API_page.robot
Resource       ../keywords/Check_DOPA_API_page.robot
Resource       ../keywords/Validate_imageAPI_page.robot
Resource		../keywords/save_data_excel_page.robot
Suite Setup         Create Session    alias=${ALIAS}    url=${URL_CORE_SERVICE}

# python3 -m robot -t Verrify_Success	07.OTP_test.robot
# python3 -m robot -t Request_3x3  07.OTP_test.robot

#python3 -m robot --timestampoutputs --log TEST.html --report  TEST_Report.html  --output  TEST.xml    --outputdir  /Users/patcharapol/Desktop/eKYC/Log    12.POC_OTP_test.robot

***Variables***
${TAGSSSSSSS}			Print


***Keywords***
Save_Result_OTP_Happy_DEMO
	[Arguments]					${data}
	Run keyword if      		'${data}' == 'print'				Result_PASS
    ...         ELSE      		Result_FAILS

Result_PASS
	Log to console				PRINT REPORT hello

Result_FAILS
	Log to console				DON'T PRINT REPORT 

***Test Cases***
DEMO_1
	[Tags]		print121212
	Save_Result_OTP_Happy_DEMO			@{TEST TAGS} 

