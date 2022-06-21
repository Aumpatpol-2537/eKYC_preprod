*** Settings ***
Library         RequestsLibrary

Resource        ../keywords/Support_Test_BU_Page.robot




***Test Cases***
start_bu_journeys
    BU_journey        4


#  robot   api-ekyc/Test\ case/24.BU_testing.robot 