*** Settings ***
Documentation     Use the High-level API to download a user's public key from the server
Test Timeout      1 minute
Library           ../opentxsRobot.py
Resource          ../globalVariables.robot

*** Test Cases ***
valid basic
    ${result} =    check user    ${Server}    ${FT_Nym}    ${BOB_Nym}
    ${verifyResult} =    verify message    ${result}
    Should Be Equal    ${verifyResult}    1

invalid nym
    ${result} =    check user    ${Server}    ${InvalidNym}    ${BOB_Nym}
    ${verifyResult} =    verify message    ${result}
    Should Not Be Equal    ${verifyResult}    1
