***Settings***
Library                 ExcelLibrary
Library                 OperatingSystem
Library                 String
Resource                ../keywords/Sent_SMS(OTP)API_page.robot
Resource                ../keywords/Validate_customer_API_page.robot
Resource                ../keywords/Verify_OTP_API_page.robot
Resource                ../Varriable/varriable.robot

***Keywords***
Get_Data_Customer
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc1
    ${get_cid}=	    Read Excel Cell	        row_num=${row}	        col_num=6      sheet_name=OTP
    # ${PO_Number}    Generate random string      13        ${get_cid}
    Set global variable         ${GET_CID}              ${get_cid}
    Close All Excel Documents

Get_Data_Customer_LN_FR
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc1
    ${get_cid}=	    Read Excel Cell	        row_num=${row}	        col_num=5      sheet_name=Liveness&FaceREC
    Set global variable         ${GET_CID}              ${get_cid}
    Close All Excel Documents

Get_Data_Customer_MainCase
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc1
    ${get_cid}=	            Read Excel Cell	        row_num=${row}	        col_num=4      sheet_name=eKYC-HAPPY
    ${name}=                Read Excel Cell	        row_num=${row}	        col_num=5      sheet_name=eKYC-HAPPY
    ${surname}=             Read Excel Cell	        row_num=${row}	        col_num=6      sheet_name=eKYC-HAPPY
    ${name_en}=             Read Excel Cell	        row_num=${row}	        col_num=7      sheet_name=eKYC-HAPPY
    ${surname_en}=          Read Excel Cell	        row_num=${row}	        col_num=8      sheet_name=eKYC-HAPPY
    ${bithdate}=            Read Excel Cell	        row_num=${row}	        col_num=9      sheet_name=eKYC-HAPPY
    # ${alley}=               Read Excel Cell	        row_num=${row}	        col_num=14      sheet_name=eKYC-HAPPY
    # ${district}=            Read Excel Cell	        row_num=${row}	        col_num=16      sheet_name=eKYC-HAPPY
    # ${house_no}=            Read Excel Cell	        row_num=${row}	        col_num=10      sheet_name=eKYC-HAPPY
    # ${road}=                Read Excel Cell	        row_num=${row}	        col_num=12      sheet_name=eKYC-HAPPY
    # ${lane}=                Read Excel Cell	        row_num=${row}	        col_num=13      sheet_name=eKYC-HAPPY
    # ${moo}=                 Read Excel Cell	        row_num=${row}	        col_num=11      sheet_name=eKYC-HAPPY
    # ${province}=            Read Excel Cell	        row_num=${row}	        col_num=17      sheet_name=eKYC-HAPPY
    # ${sub_district}=        Read Excel Cell	        row_num=${row}	        col_num=15      sheet_name=eKYC-HAPPY
    # ${sex}=                 Read Excel Cell	        row_num=${row}	        col_num=18      sheet_name=eKYC-HAPPY  
    # ${get_cif}=             Read Excel Cell	        row_num=${row}	        col_num=19      sheet_name=eKYC-HAPPY
    ${get_mobile}=          Read Excel Cell	        row_num=${row}	        col_num=10      sheet_name=eKYC-HAPPY
    ${get_lasercode}=       Read Excel Cell	        row_num=${row}	        col_num=11      sheet_name=eKYC-HAPPY

    #ADDRESS
    # Set global variable         ${GET_ALLEY}                    ${alley}
    # Set global variable         ${GET_DISTRICT}                 ${district}
    # Set global variable         ${GET_HOUSENO}                  ${house_no}
    # Set global variable         ${GET_LANE}                     ${lane}
    # Set global variable         ${GET_MOO}                      ${moo}
    # Set global variable         ${GET_PROVINCE}                 ${province}
    # Set global variable         ${GET_SUB_DISTRICT}             ${sub_district}
    # Set global variable         ${GET_ROAD}                     ${road}

    Set global variable         ${GET_CID}              ${get_cid}
    Set global variable         ${FIRST_NAME}           ${name}
    Set global variable         ${SURNAME}              ${surname}
    Set global variable         ${FIRST_NAME_EN}        ${name_en}
    Set global variable         ${SURNAME_EN}           ${surname_en}
    Set global variable         ${BIRTH_DATE}           ${bithdate}
    # Set global variable         ${GET_CIF}              ${get_cif}
    Set global variable         ${MOBILE_NO}           ${get_mobile}
    Set global variable         ${GET_LASER_CODE}       ${get_lasercode}
    # Set global variable         ${GET_SEX}              ${sex}
    Close All Excel Documents
# {"houseNo":"99/99","moo":"1","alley":"ตรอก-ปฐม","lane":"ซอย-สุขุมวิท","road":"สุขุมวิท","subDistrict":"คลองเตย","district":"พระโขนง","province":"กรุงเทพมหานคร"}

Get_Data_Customer_IAL
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc1
    ${get_cid}=	            Read Excel Cell	        row_num=${row}	        col_num=3      sheet_name=IAL_LEVEL
    ${name}=                Read Excel Cell	        row_num=${row}	        col_num=4      sheet_name=IAL_LEVEL
    ${surname}=             Read Excel Cell	        row_num=${row}	        col_num=5      sheet_name=IAL_LEVEL
    ${bithdate}=            Read Excel Cell	        row_num=${row}	        col_num=6      sheet_name=IAL_LEVEL
    ${get_cif}=             Read Excel Cell	        row_num=${row}	        col_num=7      sheet_name=IAL_LEVEL
    ${get_mobile}=          Read Excel Cell	        row_num=${row}	        col_num=8      sheet_name=IAL_LEVEL
    ${get_lasercode}=       Read Excel Cell	        row_num=${row}	        col_num=9      sheet_name=IAL_LEVEL
    Set global variable     ${GET_CID}              ${get_cid}
    Set global variable     ${FIRST_NAME}           ${name}
    Set global variable     ${SURNAME}              ${surname}
    Set global variable     ${BIRTH_DATE}           ${bithdate}
    Set global variable     ${GET_CIF}              ${get_cif}
    Set global variable     ${GET_MOBILE}           ${get_mobile}
    Set global variable     ${GET_LASER_CODE}       ${get_lasercode}



Get_Data_Customer_UnHappyCase
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc1
    ${get_cid}=	            Read Excel Cell	        row_num=${row}	        col_num=4      sheet_name=eKYC-UNHAPPY
    ${name}=                Read Excel Cell	        row_num=${row}	        col_num=5      sheet_name=eKYC-UNHAPPY
    ${surname}=             Read Excel Cell	        row_num=${row}	        col_num=6      sheet_name=eKYC-UNHAPPY
    ${name_en}=             Read Excel Cell	        row_num=${row}	        col_num=7      sheet_name=eKYC-UNHAPPY
    ${surname_en}=          Read Excel Cell	        row_num=${row}	        col_num=8      sheet_name=eKYC-UNHAPPY
    ${bithdate}=            Read Excel Cell	        row_num=${row}	        col_num=9      sheet_name=eKYC-UNHAPPY
    ${alley}=               Read Excel Cell	        row_num=${row}	        col_num=14      sheet_name=eKYC-UNHAPPY
    # ${district}=            Read Excel Cell	        row_num=${row}	        col_num=16      sheet_name=eKYC-UNHAPPY
    # ${house_no}=            Read Excel Cell	        row_num=${row}	        col_num=10      sheet_name=eKYC-UNHAPPY
    # ${road}=                Read Excel Cell	        row_num=${row}	        col_num=12      sheet_name=eKYC-UNHAPPY
    # ${lane}=                Read Excel Cell	        row_num=${row}	        col_num=13      sheet_name=eKYC-UNHAPPY
    # ${moo}=                 Read Excel Cell	        row_num=${row}	        col_num=11      sheet_name=eKYC-UNHAPPY
    # ${province}=            Read Excel Cell	        row_num=${row}	        col_num=17      sheet_name=eKYC-UNHAPPY
    # ${sub_district}=        Read Excel Cell	        row_num=${row}	        col_num=15      sheet_name=eKYC-UNHAPPY
    # ${sex}=                 Read Excel Cell	        row_num=${row}	        col_num=18      sheet_name=eKYC-UNHAPPY  
    # ${get_cif}=             Read Excel Cell	        row_num=${row}	        col_num=19      sheet_name=eKYC-UNHAPPY
    ${get_mobile}=          Read Excel Cell	        row_num=${row}	        col_num=10      sheet_name=eKYC-UNHAPPY
    ${get_lasercode}=       Read Excel Cell	        row_num=${row}	        col_num=11      sheet_name=eKYC-UNHAPPY

    ####### ADDRESS
    # Set global variable         ${GET_ALLEY}                    ${alley}
    # Set global variable         ${GET_DISTRICT}                 ${district}
    # Set global variable         ${GET_HOUSENO}                  ${house_no}
    # Set global variable         ${GET_LANE}                     ${lane}
    # Set global variable         ${GET_MOO}                      ${moo}
    # Set global variable         ${GET_PROVINCE}                 ${province}
    # Set global variable         ${GET_SUB_DISTRICT}             ${sub_district}
    # Set global variable         ${GET_ROAD}                     ${road}

    Set global variable         ${GET_CID}              ${get_cid}
    Set global variable         ${FIRST_NAME}           ${name}
    Set global variable         ${SURNAME}              ${surname}
    Set global variable         ${FIRST_NAME_EN}        ${name_en}
    Set global variable         ${SURNAME_EN}           ${surname_en}
    Set global variable         ${BIRTH_DATE}           ${bithdate}
    # Set global variable         ${GET_CIF}              ${get_cif}
    Set global variable         ${GET_MOBILE}           ${get_mobile}
    Set global variable         ${GET_LASER_CODE}       ${get_lasercode}
    # Set global variable         ${GET_SEX}              ${sex}
    Close All Excel Documents



Get_cid_excel
    [Arguments]         ${row}          ${input_sheet_name}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc1
    ${get_cid}=	                 Read Excel Cell	        row_num=${row}	        col_num=3         sheet_name=${input_sheet_name}
    # ${get_partner_secret}=       Read Excel Cell	        row_num=1   	        col_num=1         sheet_name=partner_secret
    # Set global variable          ${GET_PARTNER_SECRET}         ${get_partner_secret}
    Set global variable          ${GET_CID}                    ${get_cid}
    Close All Excel Documents



Get_data_Generate_QRCODE
    [Arguments]         ${row}  
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc2
    ${get_cid}=	               Read Excel Cell	        row_num=${row}	        col_num=3         sheet_name=Generate_QR
    ${get_twin_status}=	       Read Excel Cell	        row_num=${row}	        col_num=4         sheet_name=Generate_QR
    ${get_twin_gender}=	       Read Excel Cell	        row_num=${row}	        col_num=5         sheet_name=Generate_QR
    ${get_journey_code}=	   Read Excel Cell	        row_num=${row}	        col_num=6         sheet_name=Generate_QR
    # ${get_partner_secret}=     Read Excel Cell	        row_num=1   	        col_num=1         sheet_name=partner_secret
    Set global variable         ${GET_CID}                    ${get_cid}
    Set global variable         ${GET_TWIN__STATUS}           ${get_twin_status}
    Set global variable         ${GET_TWIN__GENDER}           ${get_twin_gender}
    Set global variable         ${GET_JOR_CODE}               ${get_journey_code}
    # Set global variable         ${GET_PARTNER_SECRET}         ${get_partner_secret}
    Close All Excel Documents


Get_data_Validate_QRCODE
    [Arguments]         ${row}          ${sheet_name}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc2
    ${get_qr_validate}=	       Read Excel Cell	        row_num=${row}	        col_num=3         sheet_name=${sheet_name}
    ${jira}=	               Read Excel Cell	        row_num=${row}	        col_num=15         sheet_name=${sheet_name}
    Set global variable         ${GET_QR_STRING}               ${get_qr_validate}
    Set global variable         ${JIRA_CARD_NUMBER}            ${jira}

    Close All Excel Documents


Get_data_facial_authen
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc2
    ${get_cid}=	                Read Excel Cell	        row_num=${row}	        col_num=5         sheet_name=Facial_authen
    ${get_process_id}=	        Read Excel Cell	        row_num=${row}	        col_num=6         sheet_name=Facial_authen
    ${get_base64}=	            Read Excel Cell	        row_num=${row}	        col_num=7         sheet_name=Facial_authen
    ${jira}=	                Read Excel Cell	        row_num=${row}	        col_num=20        sheet_name=Facial_authen
    Set global variable         ${GET_PROCESS_ID}             ${get_process_id}
    Set global variable         ${GET_CID}                    ${get_cid}
    Set global variable         ${BASE64}                     ${get_base64}
    Set global variable         ${JIRA_CARD_NUMBER}           ${jira}
    Close All Excel Documents


Get_data_Modify_Validate_QR
    [Arguments]         ${row}  
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc2
    ${get_qr_validate}=	       Read Excel Cell	        row_num=${row}	        col_num=4         sheet_name=Modify_validate
    ${get_id_card}=	           Read Excel Cell	        row_num=${row}	        col_num=3         sheet_name=Modify_validate
    ${jira}=	               Read Excel Cell	        row_num=${row}	        col_num=16        sheet_name=Modify_validate
    Set global variable         ${GET_QR_STRING}               ${get_qr_validate}
    Set global variable         ${JIRA_CARD_NUMBER}            ${jira}
    Set global variable         ${GET_ID_CARD}                 ${get_id_card}
    Close All Excel Documents


Get_facial_lock
    [Arguments]                 ${row}  
    Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc2
    ${get_id_card}=	               Read Excel Cell	        row_num=${row}	        col_num=4         sheet_name=Check_lock_Face
    ${get_status_lock}=	           Read Excel Cell	        row_num=${row}	        col_num=3         sheet_name=Check_lock_Face
    # ${jira}=	               Read Excel Cell	        row_num=${row}	        col_num=16        sheet_name=Check_lock_Face
    Set global variable         ${GET_STATUS_LOCK}             ${get_status_lock}
    # Set global variable         ${JIRA_CARD_NUMBER}            ${jira}
    Set global variable         ${GET_ID_CARD}                 ${get_id_card}
    Close All Excel Documents


Get_Data_Counter_Service
    [Arguments]                 ${row}  
    Open Excel Document	        filename=${FILE_CS}      doc_id=doc1
    ${get_trans_ref}=	      Read Excel Cell	        row_num=${row}	        col_num=3         sheet_name=Signup_CS
    ${get_cid}=	              Read Excel Cell	        row_num=${row}	        col_num=4         sheet_name=Signup_CS
    ${image_id_card}=	      Read Excel Cell	        row_num=${row}	        col_num=5         sheet_name=Signup_CS
    ${image_identify}=	      Read Excel Cell	        row_num=${row}	        col_num=6         sheet_name=Signup_CS
    ${compare_score}=	      Read Excel Cell	        row_num=${row}	        col_num=7         sheet_name=Signup_CS
    ${dopa_pass}=	          Read Excel Cell	        row_num=${row}	        col_num=8         sheet_name=Signup_CS
    # ${jira}=	               Read Excel Cell	        row_num=${row}	        col_num=16        sheet_name=Signup_CS

    Set global variable         ${GET_TRANS_REF}             ${get_trans_ref}
    Set global variable         ${GET_CID}                   ${get_cid}
    Set global variable         ${GET_IMG_ID_CARD}           ${image_id_card}
    Set global variable         ${GET_SELFIE}                ${image_identify}
    Set global variable         ${GET_IMG_SCORE}             ${compare_score}
    Set global variable         ${GET_DOPA_PASS}             ${dopa_pass}

    # Set global variable         ${JIRA_CARD_NUMBER}            ${jira}
    Close All Excel Documents
