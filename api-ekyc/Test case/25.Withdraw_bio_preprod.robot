*** Settings ***
Resource        ../keywords/Withdraw_ial_page.robot




***Test Cases***
Start_withdraw_bio
    Withdraw_ial_page.Gen_cid_hash              1100600292875
    Withdraw_ial_page.withdraw_bio              ${GET_CID_HASH}

