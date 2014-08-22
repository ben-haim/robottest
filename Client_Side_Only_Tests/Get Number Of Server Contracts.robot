*** Settings ***
Documentation     Get the number of server contracts available on client side
Test Timeout      1 minute
Library           ../opentxsRobot.py
Resource          ../globalVariables.robot

*** Test Cases ***
valid basic check 1 server contract
    ${numberOfServers} =    count server contracts
    ${numberOfServers} =    Convert To String    ${numberOfServers}
    Should Be Equal    ${numberOfServers}    1

invalid basic check 2 server contracts
    ${numberOfServers} =    count server contracts
    ${numberOfServers} =    Convert To String    ${numberOfServers}
    Should Not Be Equal    ${numberOfServers}    2
