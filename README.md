[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## C#/NUnit sample for demonstrating Testspace

This is a sample for the use of the [NUnit](http://nunit.org/) test framework using C#  [examples](https://github.com/nunit/nunit-csharp-samples). It is used to demonstrate Testspace usage models for easier test content management.

[![Build status](https://ci.appveyor.com/api/projects/status/x76ee4x2hc84l55a?svg=true)](https://ci.appveyor.com/project/jeffs-s2/csharp-nunit)
[![Space Health](https://samples.testspace.com/projects/94/spaces/343/badge)](https://samples.testspace.com/projects/94/spaces/343 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/94/spaces/343/metrics/217/badge)](https://samples.testspace.com/spaces/343/schema/Code%20Coverage "Code Coverage (branches)")
[![Space Metric](https://samples.testspace.com/projects/94/spaces/343/metrics/218/badge)](https://samples.testspace.com/spaces/343/schema/Code%20Coverage "Code Coverage (methods)")
[![Space Metric](https://samples.testspace.com/projects/94/spaces/343/metrics/219/badge)](https://samples.testspace.com/spaces/343/schema/Code%20Coverage "Code Coverage (sequences)")
[![Space Metric](https://samples.testspace.com/projects/94/spaces/343/metrics/220/badge)](https://samples.testspace.com/spaces/343/schema/Static%20Analysis "Static Analysis (issues)")
***

We have made a few minor modifications to to original samples for reporting purposes. In order to run this sample you will need a host workstation with Visual Studio, the [Nunit](http://nunit.org/) test framework and the [OpenCover](https://github.com/OpenCover/opencover) coverage tool.

Publishing results example:

<pre>
OpenCover.Console.exe -target:nunit3-console.exe -targetargs:cs-money.dll -output:codecoverage.xml -register:user

testspace publish TestResult.xml codecoverage.xml
</pre>

Checkout the [Space](https://samples.testspace.com/projects/csharp/spaces/nunit).

To fork this example using AppVeyor requires:
  - Account at www.testspace.com.
  - AppVeyor Environment Variable:
    - `TESTSPACE_URL` = `credentials:@my-org-name.testspace.com/my-project/my-space`
    - `credentials` set to `username:password` or your [access token](http://help.testspace.com/using-your-organization:user-settings).
    - `my-org-name.testspace.com/my-project/my-space` based on your subdomain, project, and space names. Refer [here](http://help.testspace.com/reference:runner-reference#login-credentials) for more details.
