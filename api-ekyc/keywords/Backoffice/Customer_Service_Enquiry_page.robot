*** Settings ***
Library             RequestsLibrary
Library             Collections
Resource            ../Varriable/varriable.robot
# Suite Setup         Create Session    alias=${ALIAS}    uri=${URL_CORE_SERVICE}

*** Keywords ***
Backoffice_Save_ActivityLog_to_excel
    ${response}=        GET On Session      alias=${ALIAS}          
    ...         url=/v1/backoffices/customer_enquiry?fromDate=&toDate=&agentId=&cid=&firstName=&channel=&entity=      
    ...         headers=${xxxxxxxxx}
    Request Should Be Successful       response=${response}

    ${row}      Set Variable           1     #Set ROW แรก

    FOR     ${data}      IN      @{response.json()}
        Write Excel Cell            row_num=${row}	    col_num=x      value= ${i["message"]}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${CHANNEL}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${SERVICE_TYPE}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${TRANS_SUB_TYPE}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${SERVICE_SUB_TYPE}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${INITIATED_BY}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${FIRST_NAME}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${LAST_NAME}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${TRANS_RESULT}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${REASONS}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${BACKOFFICE_TRANS_ID}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${OTHER_TRANS_ID}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${LATITUDE}           sheet_name=x
        Write Excel Cell            row_num=${row}	    col_num=x      value=${LONGTITUDE}           sheet_name=x

        ${row}        Evaluate        ${row} + 1  

    END
