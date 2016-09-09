[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## C#/NUnit sample for demonstrating Testspace

This sample demonstrates techniques for using Testspace with C# code and the [NUnit](http://nunit.org/) test framework, along with the [OpenCover](https://github.com/OpenCover/opencover) coverage tool and [Visual Studio's](https://msdn.microsoft.com/en-us/library/dd264939.aspx) static analysis tool using [NUnit's C# examples](https://github.com/nunit/nunit-csharp-samples).

***
Build using AppVeyor's Online CI:

[![Build status](https://ci.appveyor.com/api/projects/status/1n2pyp8otedkeebq?svg=true)](https://ci.appveyor.com/project/munderseth/csharp-nunit)

***
Publishing **Test Content** using www.testspace.com.

[![Space Health](https://samples.testspace.com/projects/113/spaces/428/badge)](https://samples.testspace.com/projects/113/spaces/428 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/113/spaces/428/metrics/228/badge)](https://samples.testspace.com/spaces/428/schema/Code%20Coverage "Code Coverage (branches)")
[![Space Metric](https://samples.testspace.com/projects/113/spaces/428/metrics/229/badge)](https://samples.testspace.com/spaces/428/schema/Code%20Coverage "Code Coverage (methods)")
[![Space Metric](https://samples.testspace.com/projects/113/spaces/428/metrics/231/badge)](https://samples.testspace.com/spaces/428/schema/Static%20Analysis "Static Analysis (issues)")

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

Publishing Test Content using **Testspace**:

<pre>
curl -fsS -o testspace-windows.zip https://testspace-client.s3.amazonaws.com/testspace-windows.zip
7z x -y .\testspace-windows.zip
testspace publish analysis.xml [Tests]TestResult.xml coverage.xml "master"
</pre>

Checkout the [Testspace Project](https://samples.testspace.com/projects/csharp.nunit).

To fork this example using AppVeyor requires:
  - Account at www.testspace.com.
  - AppVeyor Environment Variable:
    - `TESTSPACE_TOKEN` = `credentials@my-org-name.testspace.com/my-project`
    - `credentials` set to `username:password` or your [access token](http://help.testspace.com/using-your-organization:user-settings).
    - `my-org-name.testspace.com/my-project` based on your subdomain, and project names. Refer [here](http://help.testspace.com/reference:runner-reference#login-credentials) for more details.
