*** Settings ***
Library  Process
Test Teardown  Run Keywords  Kill process  AND  Check kill process


*** Variables ***

*** Test Cases ***
Test1
  Start Process
  Check process pid

*** Keywords ***
Start Process
    Process.Start Process         command=mspaint.exe   alias=paint
    Process Should Be Running     #If handle is not given, uses the current active process.      #Is Process Running
Check process pid
    Get Process Id                paint
Kill process
    Terminate Process             #or kill=true
Check kill process
    Process Should Be Stopped