*** Settings ***
Library             RequestsLibrary
Library           DatabaseLibrary
Library           OperatingSystem
Library           Collections
Resource           ../Varriable/varriable.robot 
Resource                ../keywords/Login_api_page.robot
Resource                ../keywords/Encrypt_page.robot

*** Variables ***
${DBHost}         tcrb-bot-nprd-db.cluster-ckedyfslvwdh.ap-southeast-1.rds.amazonaws.com
${DBName}         bot_v2
${DBPass}         &6gh2#5ONWisCQ
${DBPort}         5432
${DBUser}         postgres


***Keywords***
Start Project
    # Connect To Database     psycopg2     ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Login_Get_Token

Stop Project
    Disconnect From Database


