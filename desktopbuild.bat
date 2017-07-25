REM Remove any old test content
del *.xml

REM "install"
wget -q https://testspace-client.s3.amazonaws.com/testspace-windows.zip
7z x -y testspace-windows.zip
del testspace-windows.zip
REM host requires "access token", storing in Windows "Control Panel" refer to https://help.testspace.com/reference:client-reference#login-credentials)
testspace config url samples.testspace.com CI=true
testspace -v

REM "before_script"
REM nuget restore money/cs-money.sln

REM "test_script:"
msbuild money\cs-money.csproj /p:platform=anycpu /p:configuration=debug /p:runCodeAnalysis=true /p:codeanalysislogfile=..\analysis.xml
.\money\packages\OpenCover.4.6.519\tools\OpenCover.Console -target:".\money\packages\NUnit.ConsoleRunner.3.4.1\tools\nunit3-console.exe" -targetargs:"money\bin\Debug\cs-money.dll" -output:"coverage.xml" -filter:"+[*]* -[*]*MoneyTest*" -register:user

REM "after_test:"
testspace analysis.xml [Tests]TestResult.xml coverage.xml "#desktop.Build"
