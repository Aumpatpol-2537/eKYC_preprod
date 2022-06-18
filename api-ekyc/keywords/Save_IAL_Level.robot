***Settings***

Library                 ExcelLibrary
Library                 OperatingSystem
Resource                ../keywords/Sent_SMS(OTP)API_page.robot
Resource                ../keywords/Validate_customer_API_page.robot
Resource                ../keywords/Verify_OTP_API_page.robot
Resource                ../keywords/IAL_Page.robot    

***Keywords***
Save_IAL_Result_to_excel
    [Arguments]     ${row}
    Open Excel Document	        filename=${FILE_NAME}      doc_id=doc9
    Write Excel Cell	        row_num=${row}	    col_num=12      value=${SCORE_IAL_KYCTRAN}        sheet_name=IAL_LEVEL
    Write Excel Cell	        row_num=${row}	    col_num=13      value=${SCORE_IAL_CS_INFO}        sheet_name=IAL_LEVEL   
    Write Excel Cell	        row_num=${row}	    col_num=14      value=${TEST STATUS}                sheet_name=IAL_LEVEL
    Save Excel Document	        filename=${FILE_NAME}
    Close All Excel Documents	



    