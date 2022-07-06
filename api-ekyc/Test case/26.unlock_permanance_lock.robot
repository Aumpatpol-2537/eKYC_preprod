*** Settings ***
Resource        ../keywords/Connect_database_page.robot




***Test Cases***
Start_unlock_permanance_Lock
    Connect_database_page.Process_unlock_permanance_Lock             1100600292875