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

Suite Setup         Create Session    alias=${ALIAS}    url=${URL_CORE_SERVICE}

#python3 -m robot --timestampoutputs --log TC001_UNSUCCESS.html --report  TC001_UNSUCCESS_report.html  --output  TC001_UNSUCCESS.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/UNHAPPY  -t TC001_UNSUCCESS    11.Liveness_FR.robot
#python3 -m robot --timestampoutputs --log TC002_UNSUCCESS.html --report  TC002_UNSUCCESS_report.html  --output  TC002_UNSUCCESS.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/UNHAPPY   -t TC002_UNSUCCESS    11.Liveness_FR.robot
#python3 -m robot --timestampoutputs --log TC003_UNSUCCESS.html --report  TC003_UNSUCCESS_report.html  --output  TC003_UNSUCCESS.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/UNHAPPY   -t TC003_UNSUCCESS    11.Liveness_FR.robot
#python3 -m robot --timestampoutputs --log TC004_UNSUCCESS.html --report  TC004_UNSUCCESS_report.html  --output  TC004_UNSUCCESS.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/UNHAPPY   -t TC004_UNSUCCESS    11.Liveness_FR.robot
#python3 -m robot --timestampoutputs --log TC005_UNSUCCESS.html --report  TC005_UNSUCCESS_report.html  --output  TC005_UNSUCCESS.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/UNHAPPY   -t TC005_UNSUCCESS    11.Liveness_FR.robot

#python3 -m robot --timestampoutputs --log HAPPY_LN_FR.html --report  HAPPY_LN_FR_report.html  --output  HAPPY_LN_FR.xml   --outputdir  /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/HAPPY   -i HAPPY 	   11.Liveness_FR.robot

#python3 -m robot --timestampoutputs --log UNHAPPY_LN_FR.html --report  UNHAPPY_LN_FR_report.html   --output  UNHAPPY_LN_FR.xml    --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/UNHAPPY     -i UNHAPPY 	   11.Liveness_FR.robot


#python3 -m robot --timestampoutputs --log TC001_SUCCESS.html --report  TC001_SUCCESS_report.html  --output  TC001_SUCCESS.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/HAPPY    -t    TC001_SUCCESS    11.Liveness_FR.robot
#python3 -m robot --timestampoutputs --log TC002_SUCCESS.html --report  TC002_SUCCESS_report.html  --output  TC002_SUCCESS.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/HAPPY    -t    TC002_SUCCESS    11.Liveness_FR.robot
#python3 -m robot --timestampoutputs --log TC003_SUCCESS.html --report  TC003_SUCCESS_report.html  --output  TC003_SUCCESS.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/HAPPY    -t    TC003_SUCCESS    11.Liveness_FR.robot
#python3 -m robot --timestampoutputs --log TC004_SUCCESS.html --report  TC004_SUCCESS_report.html  --output  TC004_SUCCESS.xml   --outputdir   /Users/patcharapol/Desktop/eKYC/Log/LN+FR/02_03_2021/HAPPY    -t    TC004_SUCCESS    11.Liveness_FR.robot

***Test Cases***
# python3 -m robot -t  TC001_SUCCESS    11.Liveness_FR.robot
# python3 -m robot -i UNHAPPY 	11.Liveness_FR.robot
# python3 -m robot -i HAPPY 	11.Liveness_FR.robot
# python3 -m robot -t  TC001_UNSUCCESS    11.Liveness_FR.robot


TC001_SUCCESS
    [Tags]          HAPPY
    [Documentation]      LNครั้งที่1_pass-FRครั้งที่1_Pass
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA
    LivenessAPI_page.Liveness_and_FR_Pass
    Save_Log_TC001_SUCCESS                                              4         
    [Teardown]      Save_Final_LN_FR_Result_to_excel                    4


TC002_SUCCESS
    [Tags]          HAPPY
    [Documentation]      LNครั้งที่1,2_failครั้งที่3_pass-FRครั้งที่1_Pass
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail              #LNครั้งที่ 1 fail
    LivenessAPI_page.Liveness_fail_2            #LNครั้งที่ 2 fail
        Facial_RecognitionAPI_page.Face_Rec_Pass    #LNครั้งที่ 3 pass FR ครั้งที่ 1 pass

    Save_Log_TC002_SUCCESS                                          5

    [Teardown]      Save_Final_LN_FR_Result_to_excel                5


TC003_SUCCESS 
    [Tags]          HAPPY   
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             6
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
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
        Facial_RecognitionAPI_page.Face_Rec_Pass   #FR ครั้งที่ 3 Pass

    Save_Log_TC003_SUCCESS                                          6

    [Teardown]      Save_Final_LN_FR_Result_to_excel                6


TC004_SUCCESS 
    [Tags]          HAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers              4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
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
        Facial_RecognitionAPI_page.Face_Rec_Pass        #LNครั้งที่ 3 pass FR ครั้งที่ 5 Pass

    Save_Log_TC004_SUCCESS                  7

    [Teardown]      Save_Final_LN_FR_Result_to_excel                7

##################################################################################
####################################################################################

TC001_UNSUCCESS
    [Tags]          UNHAPPY
    [Documentation]  FR Failed reach Max
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers              4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
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

    [Teardown]      Save_Final_LN_FR_Result_to_excel                8

TC002_UNSUCCESS  
    [Tags]          UNHAPPY
    [Documentation]  Liveness fail reach Max     
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             5
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
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
    [Teardown]      Save_Final_LN_FR_Result_to_excel                9

TC003_UNSUCCESS
    [Tags]          UNHAPPY
    [Documentation]  FR Failed reach Max    
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers              4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
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

    [Teardown]      Save_Final_LN_FR_Result_to_excel                10

TC004_UNSUCCESS
    [Tags]          UNHAPPY
    [Documentation]  Liveness fail 3ครั้ง
    Get_term_and_conditionAPI_page.Get_term_and_conditions   
	Validate_customer_API_page.Validate_customers              5
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail_3times
    # LN_reached_max

    Save_Log_TC004_UNSUCCESS                                        11

    [Teardown]      Save_Final_LN_FR_Result_to_excel                11

TC005_UNSUCCESS
    [Tags]          UNHAPPY
    [Documentation]  Liveness timeout 3ครั้ง
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers             3
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_Timeout3times
    
    Save_Log_TC005_UNSUCCESS                                12

    [Teardown]      Save_Final_LN_FR_Result_to_excel                12


#### ADD ON ####
EU-0054
    [Tags]          ADDON_HAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers            4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail        #FR ครั้งที่ 1 Fail
    
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_fail
        Facial_RecognitionAPI_page.Face_Rec_fail_2        #FR ครั้งที่ 2 Fail

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout    

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout_2

    LivenessAPI_page.Liveness_and_FR_Pass

    Save_Log_EU-0054                                                14

    [Teardown]      Save_Final_LN_FR_Result_to_excel                14

EU-0055
    [Tags]          ADDON_HAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers            4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail        #FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail_2

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout    

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout_2    

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail_2
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout_2
        Facial_RecognitionAPI_page.Face_Rec_Pass

    Save_Log_EU-0055                        15

    [Teardown]      Save_Final_LN_FR_Result_to_excel                15

EU-0068
    [Tags]          ADDON_HAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers            4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail        #FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail_2

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout    

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout_2    

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail_2
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout_2
    LivenessAPI_page.Liveness_fail_3

    LN_reached_max

    Save_Log_EU-0068                                    16

    [Teardown]      Save_Final_LN_FR_Result_to_excel                16

  
EU-0069
    [Tags]          ADDON_HAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers            4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail        #FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail_2

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout_2

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout_2
    LivenessAPI_page.Liveness_fail_2
    LivenessAPI_page.Liveness_Timeout_3

    LN_reached_max

    Save_Log_EU-0069                                                17

    [Teardown]      Save_Final_LN_FR_Result_to_excel                17



EU-0070
    [Tags]          ADDON_HAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers            4
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail        #FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail_2

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout_2

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail_2
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout_2
        Facial_RecognitionAPI_page.Face_Rec_fail_3
    Face_Rec_reached_max

    Save_Log_EU-0070                            18

    [Teardown]      Save_Final_LN_FR_Result_to_excel                18


EU-0071
    [Tags]          ADDON_HAPPY
    Get_term_and_conditionAPI_page.Get_term_and_conditions
	Validate_customer_API_page.Validate_customers            6
	Get_Consent_API_page.Get_consent
	Sent_SMS(OTP)API_page.Sent_OTP
	Verify_OTP_API_page.Verify_OTP 
	Check_DOPA_API_page.Check_DOPA

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail        #FR ครั้งที่ 1 Fail

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_fail_2

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout
        Facial_RecognitionAPI_page.Face_Rec_Timeout_2

    LivenessAPI_page.Liveness_fail
    LivenessAPI_page.Liveness_fail_2
    LivenessAPI_page.Liveness_Timeout
    LivenessAPI_page.Liveness_Timeout_2
        Facial_RecognitionAPI_page.Face_Rec_Timeout_3
    Face_Rec_reached_max

    Save_Log_EU-0071                            19

    [Teardown]      Save_Final_LN_FR_Result_to_excel                19