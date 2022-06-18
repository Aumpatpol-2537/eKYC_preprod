*** Settings ***
Library         Process
Library         RequestsLibrary
Library         BuiltIn
Library         JSONLibrary
Library         OperatingSystem
Library         String
Library                 ExcelLibrary


***Variables***
${PATH_JAR_PARTNER}            tcrb-ekyc-partner-1.5.jar
# ${PATH_JAR_PARTNER}            tcrb-ekyc-cipher-3.5.jar



***Keywords***
Generate_Partner_Secret
    Run Process     java   -jar     ${PATH_JAR_PARTNER}      TCMB    partner-secret    preprod     file    alias=myproc
    ${TextFileContent}          Get File           partner_secret.txt
    Set global variable         ${GET_PARTNER_SECRET}           ${TextFileContent}

    # Open Excel Document	        filename=${FILE_NAME_QR}      doc_id=doc10
    # Write Excel Cell	        row_num=1	    col_num=1      value=${TextFileContent}          sheet_name=partner_secret
    # Save Excel Document	        filename=${FILE_NAME_QR}
    # Close All Excel Documents






