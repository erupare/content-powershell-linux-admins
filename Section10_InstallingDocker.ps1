# Linux
Set-Location '/home/coreyknapp/Documents/code/PowerShellCore'

# Run a bash script to install docker
bash ./Demo/m11-install-docker.sh 

# Need to install the SqlServer Module. (You only need to do this once.)
Install-Module SqlServer

$serverName = 'localhost,1433'
$dbName = 'master'
$userName = 'sa'
$pw = 'passW0rd!'
$queryTimeout = 50000

$sql = "SELECT * FROM master.INFORMATION_SCHEMA.Tables"
Invoke-Sqlcmd -Query $sql `
              -ServerInstance $serverName `
              -Database $dbName `
              -Username $userName `
              -Password $pw `
              -QueryTimeout $queryTimeout


# Splatting
# As you see, Invoke-SqlCmd has a lot of parameters. If we are going to execute
# this cmdlet over and over, we can save typing and space by using a technique
# called 'splatting'. Essentially, you create a hash table with the parameter
# / value pairs, then pass that to the cmdlet. In this case Invoke-Sqlcmd, but
# the technique will work on any cmdlet.

# Note in this example we are filling from variables, but we could also 
# hard code the values or use any other method to generate a value
$sqlParams = @{ "ServerInstance" = $serverName;
                "Database" = $dbName;
                "Username" = $userName;
                "Password" = $pw;
                "QueryTimeout" = $queryTimeout
              }

$sql = @"
CREATE DATABASE SmallDB 
"@
Invoke-Sqlcmd -Query $sql @sqlParams

# As you can see the above was much simplier to enter, to read, and makes the
# code much more compact. Do note one thing, when passing in the hashtable
# you'll need to replace the $ with an @ symbol. This tells PowerShell to
# look for a hashtable type variable and use the contents as parameters

# We can also update values in the hashtable, just like we would normally.
$dbName = 'SmallDB'
$sqlParams["Database"] = $dbName

# Now proceed normally with the updated database name
# Let's create a table
$sql = @'
CREATE TABLE [dbo].[FavoriteYouTubers]
(
   
)
'@
Invoke-Sqlcmd -Query $sql @sqlParams

# Next insert some data into the table
$sql = @'
INSERT INTO [dbo].
VALUES
  
'@
Invoke-Sqlcmd -Query $sql @sqlParams

# Let's read back what we just wrote
$sql = 'SELECT * FROM dbo.'
Invoke-Sqlcmd -Query $sql @sqlParams

# We can also take the data and place it in a variable
$data = Invoke-Sqlcmd -Query $sql @sqlParams

# And display it back, or work with it however we want
$data


