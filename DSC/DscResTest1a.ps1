# 
# Base configuration for Windows 2016
# 

Configuration DscResTest1a {
	
	Import-DscResource -ModuleName DSCResTestParameters1

    Node $AllNodes.NodeName {
	
		# get the required Automation Credential
		

		xParamTest1 ParamTest
		{
			Param0 = 'Test'
			Param1 = 'Test'
			Param2 = 'Test'
			Param3 = 'Test'
			Param4 = 'Test'
		}

		xSqlServerParameterTest1 SqlServerParameterTest
		{
			Param0 = 'Test'
			Param1 = 'Test'
			Param2 = 'Test'
			Param3 = 'Test'
			Param4 = 'Test'
		}

		xSqlServerReallyReallyReallyReallyReallyLongResName1 SqlServerReallyReallyReallyReallyReallyLongResName
		{
			Param0 = 'Test'
			Param1 = 'Test'
			Param2 = 'Test'
			Param3 = 'Test'
			Param4 = 'Test'
		}

	} # end of all nodes

} #End of Configuration