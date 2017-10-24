# 
# Base configuration for Windows 2016
# 

Configuration DscResTest2a {
	
	Import-DscResource -ModuleName DSCResTestParameters2

    Node $AllNodes.NodeName {
	
		# get the required Automation Credential
		

		xParamTest2 ParamTest
		{
			Param0 = 'Test'
			Param1 = 'Test'
			Param2 = 'Test'
			Param3 = 'Test'
			Param4 = 'Test'
		}

		xSqlServerParameterTest2 SqlServerParameterTest
		{
			Param0 = 'Test'
			Param1 = 'Test'
			Param2 = 'Test'
			Param3 = 'Test'
			Param4 = 'Test'
		}

		xSqlServerReallyReallyReallyReallyReallyLongResName2 SqlServerReallyReallyReallyReallyReallyLongResName
		{
			Param0 = 'Test'
			Param1 = 'Test'
			Param2 = 'Test'
			Param3 = 'Test'
			Param4 = 'Test'
		}

	} # end of all nodes

} #End of Configuration