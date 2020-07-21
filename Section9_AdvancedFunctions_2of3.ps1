Write-Host 'Loading m10-reuse-1-functions.ps1'

function Add-SomeNumbers ($a, $b)
{
  <#
.SYNOPSIS
Adds two numbers

.DESCRIPTION
This function adds two numbers together 

.INPUTS
a and b, both numbers

.OUTPUTS
A number

.EXAMPLE
Example 1 - Simple use
Add-Numbers 1 2

#>

  $result = $a + $b
  return $result 
}

Write-Host 'Done Loading m10-reuse-1-functions.ps1'
