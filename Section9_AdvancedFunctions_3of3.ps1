# Set the location
# Linux
Set-Location '/home/coreyknapp/Documents/code/PowerShellCore'

# Try to execute the function before it is loaded 
Add-SomeNumbers 1 2

# ...or try and get help on it
Get-Help Add-SomeNumbers

# And you'll get errors. So now run the script to load its functions into memory

. ./Demo/m10-reuse-1-functions.ps1

Get-Help Add-SomeNumbers

Add-SomeNumbers 1 2
