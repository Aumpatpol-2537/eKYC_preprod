***Settings***
Library         Process
Library         RequestsLibrary
Library         BuiltIn
Library         JSONLibrary
Library         OperatingSystem
Library         String
Resource                ../keywords/Encrypt_page.robot

***Variables***

***Test Cases***
Encrypt_Function_with_long_Text
    Log to console       START ENCRYPT

    Create_File_Keep_Text             aaaaaaaaaaa
    Run Process           java     -jar       tcrb-ekyc-cipher-3.2.jar    encrypt   file   file       keep_text.txt      alias=myproc   ###นำ body ใส่ไฟล์txtและ encrypt และใส่resultไปอัก txt file


    # Run Process    java     -jar       tcrb-ekyc-cipher-1.0-2.jar     encrypt        ${AA}      alias=myproc      {\"agent_id\":640001,\"alley\":\" \",
    # ${result} =    Wait For Process    myproc     timeout=10 secs	
    # log       ${result.stdout}
    # Log         ${result_process.stdout} 

    # ${result_process}      Get Process Result	   myproc       
    # Log      ${result_process.stdout}	

    # Run Process    java     -jar       tcrb-ekyc-cipher-1.0-2.jar     decrypt        ${AA}      alias=myproc		   
    # ${result_decrypt}      Get Process Result	   myproc
