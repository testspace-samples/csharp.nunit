[![Testspace](https://www.testspace.com/img/Testspace.png)](http://www.testspace.com)

***

## C#/NUnit sample for demonstrating Testspace

This sample demonstrates techniques for using Testspace with C# code and the [NUnit](http://nunit.org/) test framework, along with the [OpenCover](https://github.com/OpenCover/opencover) coverage tool and [Visual Studio's](https://msdn.microsoft.com/en-us/library/dd264939.aspx) static analysis tool using [NUnit's C# examples](https://github.com/nunit/nunit-csharp-samples).

  * Using a Testspace Project that is `connected` with this GitHub Repo
  * Using 1 Online CI services for demonstration purposes only
  * Can review the Results at [testspace-samples:csharp.nunit](https://samples.testspace.com/projects/testspace-samples:charp.nunit)  
  * Refer to our [Getting Started](https://help.testspace.com/getting-started) help articles for more information

***
Using CI Services:

[![Build status](https://ci.appveyor.com/api/projects/status/ar9a03m96h210kil/branch/master?svg=true)](https://ci.appveyor.com/project/Testspace-samples/csharp-nunit/branch/master)

***
Publishing **Test Content** using www.testspace.com.

[![Space Health](https://samples.testspace.com/spaces/822/badge?token=f69d3020d64d4e67db7983e06dfa58e40dad78b6)](https://samples.testspace.com/spaces/822 "Test Cases")
[![Space Metric](https://samples.testspace.com/spaces/822/metrics/807/badge?token=d1a8f3d6ac33fcf16b7551db665eef0fbb28d328)](https://samples.testspace.com/spaces/822/schema/Code%20Coverage "Code Coverage (sequences)")
[![Space Metric](https://samples.testspace.com/spaces/822/metrics/808/badge?token=91f58b9b056beadd479ccf587fcdf83046cba695)](https://samples.testspace.com/spaces/822/schema/Static%20Analysis "Static Analysis (issues)")

***

In order to run this sample you will need a host workstation with Visual Studio, the [Nunit](http://nunit.org/) test framework and the [OpenCover](https://github.com/OpenCover/opencover) coverage tool.

Download and configure the Testspace client 

<pre>
appveyor DownloadFile https://testspace-client.s3.amazonaws.com/testspace-windows.zip
7z x -y testspace-windows.zip
testspace config url samples.testspace.com
</pre>


Building with static analysis:

<pre>
msbuild money\cs-money.csproj /p:platform=anycpu /p:configuration=debug /p:runCodeAnalysis=true /p:codeanalysislogfile=..\analysis.xml
</pre>
Running tests with code coverage:

<pre>
OpenCover.Console -target:"nunit3-console.exe" -targetargs:"cs-money.dll" -output:"coverage.xml" -filter:"+[*]* -[*]*MoneyTest*" -register:user
</pre>

Push Content using Testspace client 

<pre>
testspace analysis.xml [Tests]TestResult.xml coverage.xml
</pre> 

