#-----------------------------------------------------------------------------#
# Cmdlet Pipelining 
#-----------------------------------------------------------------------------#
#region Cmdlet Pipelining

# Moving around the file tree
# Get-ChildItem lists all items in current path
Get-ChildItem 

# Get-Location will get the current folder
Get-Location

# Set-Location will change the current path

# Linux
Set-Location '/home/coreyknapp/Documents/code/PowerShellCore/Demo'

# Pipelining - combine CmdLets for power
Get-ChildItem | Where-Object { $_.Length -gt 1kb } 

Get-ChildItem | Where-Object { $_.Length -gt 1kb } | Sort-Object Length

# Can break commands up among several lines 
# (note pipe must be last char on line)
Get-ChildItem |
  Where-Object { $_.Length -gt 1kb } |
  Sort-Object Length

# To specify columns in the output and get nice formatting, use Format-Table  
Get-ChildItem |
  Where-Object { $_.Length -gt 1kb } |
  Sort-Object Length |
  Format-Table -Property Name, Length -AutoSize
  
# You can also use the Select-Object to retrieve certain properties from an object
Get-ChildItem | Select-Object Name, Length

# If you have an especially long command without pipes, you can also use
# a line continuation charcter of the reverse single quote ` (typically 
# located to the left of the number 1 on your keyboard)
# Note that just as with the |, the ` must be the very last character
# on the line. No spaces or comments are allowed after it
$currentLocation = Get-Location

Get-ChildItem -Path $currentLocation  `
              -File "*.ps1" `
              -Verbose

# Can combine line continuation and pipes
Get-ChildItem -Path $currentLocation `
              -File "*.ps1" `
              -Verbose |
              Format-Table -Property Name, Length -AutoSize

#endregion Cmdlet Pipelining







#-----------------------------------------------------------------------------#
# Providers
#-----------------------------------------------------------------------------#
#region Providers

#List default Providers
Clear-Host
Get-PSProvider

# Now show how these providers equate to "drives" we can navigate
Clear-Host
Get-PSDrive

# Move to the ENV (environmental variables) drive
Clear-Host
Set-Location env:
Get-ChildItem

Clear-Host
Get-ChildItem | Format-Table -Property Name, Value -AutoSize

# Get a list of aliases
Clear-Host
Set-Location alias:
Get-ChildItem

# Access the variables via Variables provider

$zvar = 0  # add a variable so we can show it

Clear-Host
Set-Location variable:
Get-ChildItem

# Setting up provider aliases
New-PSDrive -Name PSC `
            -PSProvider FileSystem `
            -Root '/home/coreyknapp/Documents/code/PowerShellCore/'

Set-Location PSC:
Get-ChildItem | Format-Table

Set-Location PSC:\demo
Get-ChildItem | Format-Table


# When done, either use the remove cmdlet below, otherwise
# when this session ends so does the lifespan of the PSDrive
# Make sure to set your location outside the PSDrive first

# Linux
Set-Location '/home/coreyknapp/Documents/code/PowerShellCore/Demo'

Remove-PSDrive PSC

#endregion Providers
