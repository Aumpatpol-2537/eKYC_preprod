***Settings***

Library                 ExcelLibrary
Library                 OperatingSystem
Library                 BuiltIn
Resource                ../keywords/Sent_SMS(OTP)API_page.robot
Resource                ../keywords/Validate_customer_API_page.robot
Resource                ../keywords/Verify_OTP_API_page.robot
Resource                ../Varriable/varriable.robot


***Keywords***
Get_OTP_Value
    FOR    ${i}    IN    @{response.json()}
                ${data}     Set Variable         ${i["message"]}
    END
        ${otp_value}     Get Substring              ${data}       20      26
        Log to console      ${otp_value}






