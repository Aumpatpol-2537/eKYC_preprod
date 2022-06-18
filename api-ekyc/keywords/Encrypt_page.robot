***Settings***
Library         Process
Library         RequestsLibrary
Library         BuiltIn
Library         JSONLibrary
Library         OperatingSystem
Library         String


***Variables***
${PATH_JAR_LONG_TEXT}      tcrb-ekyc-cipher-2.0.jar
${PATH_JAR}                tcrb-ekyc-cipher-1.0-2.jar
${PATH_JAR_NEW}            tcrb-ekyc-cipher-3.5.jar

***Keywords***
Encrypt_Function_with_long_Text
    [Arguments]          ${input_txt_file}
    Log to console       START ENCRYPT
    Run Process          java     -jar       ${PATH_JAR_NEW}    encrypt    default    file   file       ${input_txt_file}      alias=myproc   ###นำ body ใส่ไฟล์txtและ encrypt และใส่resultไปอัก txt file
    Log to console          FINISH ENCRYPT !!
    # Terminate All Processes	       	kill=true	

Encrypt_Function
    [Arguments]         ${input_data_for_encrypt}
    Log to console     START ENCRYPT
    Run Process       java    -jar    ${PATH_JAR_NEW}   encrypt    default    file   file       ${input_data_for_encrypt}      alias=myproc		   
    ${result_encrypt}      Get Process Result	   myproc
    # Log to console     ${result_encrypt.stdout}	
    Set global variable     ${RESULT_ENCRYPT_DATA}         ${result_encrypt.stdout}	
    Log to console     FINISH ENCRYPT !!
    Terminate All Processes	       	kill=true	


Decrypt_Function
    [Arguments]             ${input_decrypt_data}
    Run Process    java     -jar       ${PATH_JAR_NEW}      decrypt   default    text    text            ${input_decrypt_data}	      alias=myproc		   
    ${result_decrypt}      Get Process Result	   myproc
    Log    ${result_decrypt.stdout}	
	Set global variable          ${OUTPUT_VALUE_FROM_ENCRYPT}        ${result_decrypt.stdout}


        Terminate All Processes    kill=True

Decrypt_Long_Text_Function
    [Arguments]             ${input_decrypt_data}
    Run Process    java     -jar       ${PATH_JAR}    decrypt         ${input_decrypt_data}	      alias=myproc		   
    ${result_decrypt}      Get Process Result	   myproc
    Log    ${result_decrypt.stdout}	
	Set global variable          ${OUTPUT_VALUE_FROM_ENCRYPT}        ${result_decrypt.stdout}


Decrypt_Consent
    [Arguments]             ${input_decrypt_data}
    Run Process    java     -jar       ${PATH_JAR_NEW}     decrypt    default    file     file       consent.txt      alias=myproc		   
    ${result_decrypt}      Get Process Result	   myproc
    Log    ${result_decrypt.stdout}	
	Set global variable          ${OUTPUT_VALUE_FROM_ENCRYPT}        ${result_decrypt.stdout}




Create_File_Keep_Text
    [Arguments]         ${data_for_save}
    Create File         keep_text.txt          ${data_for_save}

Create_File_Keep_Text_Facial
    [Arguments]         ${data_for_save}
    Create File         keep_facial_body.txt         ${data_for_save}

Create_File_Keep_Consent
    [Arguments]         ${data_for_save}
    Create File         keep_Consent.txt         ${data_for_save}


Read_File_Encrypt
    [Arguments]     ${data_encrypt_file}
    ${TextFileContent}          Get File           ${data_encrypt_file}
    Set global variable     ${RESULT_ENCRYPT_DATA}           ${TextFileContent}

Save_Long_text_to_file
    [Arguments]         ${data_for_save}
    Create File         consent.txt         ${data_for_save}
