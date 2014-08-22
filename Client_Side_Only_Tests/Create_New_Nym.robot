*** Settings ***
Documentation     Use the High-level API to create a new nym
Test Timeout      1 minute
Library           ../opentxsRobot.py
Resource          ../globalVariables.robot

*** Test Cases ***
valid basic
    ${result} =    create pseudonym    1024    ""    ""    #keybits, nym_id_source, alt_location
    print ${result}
    ${verifyResult} =    verify message    ${result}
    Should Be Equal    ${verifyResult}    1

invalid keybits parameter
    ${result} =    create pseudonym    68    ""    ""    #keybits, nym_id_source, alt_location
    ${verifyResult} =    verify message    ${result}
    Should Not Be Equal    ${verifyResult}    1
