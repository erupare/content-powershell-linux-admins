# All commands in PowerShell are in the form of a verb-noun syntax
Get-ChildItem

# A command in PowerShell is known as a cmdlet

# Here it produces a list of items in the current location. 
# The current location is displayed in the prompt, here it is a folder
# in the file system. 

# You can find a list of the currently loaded commands by using:
Get-Command

# Note the 'currently loaded'. You can extend the commands available to 
# you through the addition of modules. We will talk briefly about modules
# in a later lesson. 

# If you want to learn more about a command, you can always get help
# on it. 
Get-Help Get-Command 

# Right after installing PowerShell, and periodically thereafer, you
# should update your help library
Update-Help


# Reading Markdown
# Note, you must be using PowerShell Core 6.1 or greater!

# First set a variable to your root path where you extracted the code
# An example for Linux
$rootPath = '/home/coreyknapp/Documents/code/PowerShellCore/Notes/'
