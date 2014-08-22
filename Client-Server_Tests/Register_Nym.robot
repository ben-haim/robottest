*** Settings ***
Documentation     Use the High-level API to register a new nym at the server
Test Timeout      1 minute
Library           ../opentxsRobot.py
Resource          ../globalVariables.robot

*** Test Cases ***
valid basic
    ${nym} =    create pseudonym    1024    ""    ""    #keybits, nym_id_source, alt_location
    ${verifyResult} =    verify message    ${nym}
    Should Be Equal    ${verifyResult}    1
    ${result} =    register nym    ${Server}    ${nym}
    ${verifyResult1} =    verify message    ${result}
    Should Be Equal    ${verifyResult1}    1

invalid nym
    ${result} =    register nym    ${Server}    ${InvalidNym}
    ${verifyResult1} =    verify message    ${result}
    Should Not Be Equal    ${verifyResult1}    1
