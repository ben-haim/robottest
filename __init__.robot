*** Settings ***
Suite Setup       serverSetup
Suite Teardown    serverShutdown
Test Timeout      2 minutes
Library           Process
Library           OperatingSystem

*** Keywords ***
serverSetup
    Remove File    ${/}home${/}%{USER}${/}.ot${/}server_data${/}ot.pid
    Remove File    ${/}home${/}%{USER}${/}.ot${/}client_data${/}ot.pid
    Start Process    opentxs-server

serverShutdown
    Terminate All Processes
    Remove File    ${/}home${/}%{USER}${/}.ot${/}server_data${/}ot.pid
    Remove File    ${/}home${/}%{USER}${/}.ot${/}client_data${/}ot.pid
