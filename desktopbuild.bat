REM Remove any old test content
del *.xml

REM "test_script:"
msbuild money\cs-money.csproj /p:platform=anycpu /p:configuration=debug /p:runCodeAnalysis=true /p:codeanalysislogfile=..\analysis.xml
.\money\packages\OpenCover.4.6.519\tools\OpenCover.Console -target:".\money\packages\NUnit.ConsoleRunner.3.4.1\tools\nunit3-console.exe" -targetargs:"money\bin\Debug\cs-money.dll" -output:"coverage.xml" -filter:"+[*]* -[*]*MoneyTest*" -register:user

REM "after_test:"
curl -fsS -o testspace-windows.zip https://testspace-client.s3.amazonaws.com/testspace-windows.zip
7z x -y .\testspace-windows.zip
del testspace-windows.zip

for /f %%i in ('git symbolic-ref --short HEAD') do set BRANCH_NAME=%%i
testspace @.testspace.txt %TESTSPACE_TOKEN%/testspace-samples:csharp.nunit/%BRANCH_NAME%#desktop.Build
