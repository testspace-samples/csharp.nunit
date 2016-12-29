[![Testspace](http://www.testspace.com/img/Testspace.png)](http://www.testspace.com)

***

## C#/NUnit sample for demonstrating Testspace

This sample demonstrates techniques for using Testspace with C# code and the [NUnit](http://nunit.org/) test framework, along with the [OpenCover](https://github.com/OpenCover/opencover) coverage tool and [Visual Studio's](https://msdn.microsoft.com/en-us/library/dd264939.aspx) static analysis tool using [NUnit's C# examples](https://github.com/nunit/nunit-csharp-samples).

***
Example branching only: **topic**

* Reference article: [git branching workflow](https://git-scm.com/book/en/v1/Git-Branching-Branching-Workflows)

***

In order to run this sample you will need a host workstation with Visual Studio, the [Nunit](http://nunit.org/) test framework and the [OpenCover](https://github.com/OpenCover/opencover) coverage tool.

Building with static analysis:

<pre>
msbuild money\cs-money.csproj /p:platform=anycpu /p:configuration=debug /p:runCodeAnalysis=true /p:codeanalysislogfile=..\analysis.xml
</pre>
Running tests with code coverage:

<pre>
OpenCover.Console -target:"nunit3-console.exe" -targetargs:"cs-money.dll" -output:"coverage.xml" -filter:"+[*]* -[*]*MoneyTest*" -register:user
</pre>

Pushing Content using **Testspace client**:

<pre>
curl -fsS -o testspace-windows.zip https://testspace-client.s3.amazonaws.com/testspace-windows.zip
7z x -y .\testspace-windows.zip
testspace @.testspace.txt %TESTSPACE_TOKEN%/testspace-samples:csharp.nunit/%APPVEYOR_REPO_BRANCH%#appveyor.build.%APPVEYOR_BUILD_NUMBER%
</pre>

Checkout the published [Testspace Content](https://samples.testspace.com/projects/csharp.nunit). Note that the `.testspace.txt` file contains the [set of files](http://help.testspace.com/how-to:publish-content#publishing-via-content-list-file) to publish. 

To replicate this sample: 
  - Setup account at www.testspace.com.
  - Create a Environment variable called `TESTSPACE_TOKEN`
     - `TESTSPACE_TOKEN` = `credentials@Your-Org-Name.testspace.com`
     - `credentials` set to `username:password` or your [access token](http://help.testspace.com/reference:client-reference#login-credentials)
     - To [use Testspace with a CI system](http://help.testspace.com/how-to:add-to-ci-workflow), store `TESTSPACE_TOKEN` as a secure environment variable
 