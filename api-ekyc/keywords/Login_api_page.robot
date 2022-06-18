***Settings***
Library                 ExcelLibrary
Library                 OperatingSystem
Library                 BuiltIn
Resource            ../Varriable/varriable.robot
Resource            ../Varriable/Tablet_varriable.robot
Resource            ../keywords/Encrypt_page.robot



***Keywords***
Login_Get_Token

    Create_File_Keep_Text                                     {"username":"ekyc003","password":"P@ssw0rd","partner_code":"TCRB-TABLET"}
    Encrypt_page.Encrypt_Function_with_long_Text            keep_text.txt      
    Encrypt_page.Read_File_Encrypt                          encrypt_text.txt        

    Create Session          alias=${ALIAS}    url=${URL_CORE_SERVICE}
    &{body}=      Create dictionary        data=${RESULT_ENCRYPT_DATA}
    ${response}=    POST On Session     alias=${ALIAS}     url=${URI_LOGIN}   headers=&{HEADER_LOGIN}    json=${body}
    # Request Should Be Successful    response=${response}
    Set global variable     ${RESPONSE_ENCRYPT_TYPE}         ${response.json()["data"]}

    
    Encrypt_page.Decrypt_Function           ${RESPONSE_ENCRYPT_TYPE}
    ${convert_result}       Convert String to JSON	       ${OUTPUT_VALUE_FROM_ENCRYPT}	
    ${values}          	  Get Value From Json	           ${convert_result}	$..id_token
    Log                 ${values}
	Set global variable          ${LOGIN_IDTOKEN}        ${values[0]}