***Settings***

Library                 ExcelLibrary
Library                 OperatingSystem
Library                 BuiltIn
Resource                ../keywords/Sent_SMS(OTP)API_page.robot
Resource                ../keywords/Validate_customer_API_page.robot
Resource                ../keywords/Verify_OTP_API_page.robot
Resource                ../Varriable/varriable.robot

***Variables***



***Keywords***
Save_Getterm_Individual_api_to_excel
    [Arguments]         ${row}
    Open Excel Document	        filename=${FILE_NAME_INDIVIDUAL}      doc_id=doc1
    ${data}     Write Excel Cell	        row_num=${row}	    col_num=      value=${RESPONES_CODE}        sheet_name=GetTerm_Condition
    ${data}     Write Excel Cell	        row_num=${row}	    col_num=      value=${RESPONES_MESSAGE}        sheet_name=GetTerm_Condition
    # ${data}     Write Excel Cell	        row_num=${row}	    col_num=      value=${RESPONES_CODE}        sheet_name=GetTerm_Condition
    Save Excel Document	        filename=${FILE_NAME_INDIVIDUAL}
    Close All Excel Documents	
