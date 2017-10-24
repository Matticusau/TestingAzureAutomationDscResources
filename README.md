# TestingAzureAutomationDscResources
This is a project of files used in testing/reproducing the current issue being tracked with Azure Automation and DSC Resources. Specifically in the xSqlServer repo.


# Background
There are a number of issues currently being tracked in the xSqlServer dsc module project regarding it's use with Azure Automation. In the discussions there are a couple of problems which some people are confusing. This project will attempt to repoduce those issues with the objective to assist the team in troubleshooting and also remove the confusion.

Some of the issues I have been watching are:
[#137](https://github.com/PowerShell/xSQLServer/issues/137)
[#713](https://github.com/PowerShell/xSQLServer/issues/713)
[#716](https://github.com/PowerShell/xSQLServer/issues/716)

# Problem 1
DSC Resources do not always appear as activities in the Azure portal for a loaded module.


## Steps to Replicate
1. Upload the DSCResTestParameters1.zip and DSCResTestParameters2.zip modules to your automation account
2. Wait for import then review the listed Activities for each module.
DSCResTestParameters1 will list only xParamTest1
but DSCResTestParameters2 will list all three xParamTest1, xSqlServerParameterTest1, and xSqlServerReallyReallyReallyReallyReallyLongResName1

The only difference between DSCResTestParameters1 and DSCResTestParameters2 is the number of parameters on xSqlServerParameterTest where DSCResTestParameters1 has 50 parameters and DSCResTestParameters2 has 35 parameters. Thus changing the size of the schema MOF file. Durring the evaluation of DSCResTestParameters1 it then fails on xSqlServerParameterTest's MOF file and never reads the following resources. As there are no changes to that last resource between modules, there is therefore nothing to prevent it listing as an activity other than the impact of a previous activity.

Furthermore, even though the resources are not listed against the activity this does not prevent them being used as the next problem will show.

# Problem 2
DSC Resource names exceed some apparent file length limit and will not load 

This is a heavily documented issue but has no relationship to the above issue. If you compile the 4 DSC configurations provided you will find that each of them is able to use the xParamTest or xSqlServerParameterTest resources from either DSCResTestParameters1 or DSCResTestParameters2. However none of them can use xSqlServerReallyReallyReallyReallyReallyLongResName1.

***DscResTest1a*** - This tries to use all three resources in a configuration. Remember that only 1 is listed as an activity. It fails to compile due to the file path length of the resource  xSqlServerReallyReallyReallyReallyReallyLongResName1

***DscResTest1b*** - This tries to use two of the three resources in a configuration. Remember that only 1 is listed as an activity. It completes successfully as we no longer reference the long path name resource, yet it still references the xSqlServerParameterTest resource which is not listed in the portal as an activity, thus demonstrating the earlier problem is just display related.

***DscResTest2a*** - This tries to use all three resources in a configuration. In this cases all 3 are listed as activities. It fails to compile due to the file path length of the resource  xSqlServerReallyReallyReallyReallyReallyLongResName1

***DscResTest2b*** - This tries to use two of the three resources in a configuration. In this cases all 3 are listed as activities. It completes successfully as we no longer reference the long path name resource. This proves again that the listing of an activity in the portal has no impact on it's use as the long named resource lists fine but fails to compile.

