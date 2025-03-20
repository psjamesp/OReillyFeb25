Get-Command
get-help 
Get-Member


Restart-Service -DisplayName spooler


get-process | where-object name -like *notepad*  |stop-process -Force 

$var = "cat"
$var = 10

#Do not have to do this
[string]$var = "cat"

$var | Get-Member


-eq Equal
-NE not equal
-gt greater than
-lt less than
-ge greater than equal to
-le less than equal to
-like
-match
-and
-or

go here for more info https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.4




$planets = "earth","mars",'Saturn',"earth"

$planets | ForEach-Object {Write-Output $_}
# starting to itterate through my array
$Currentvalue = 0 # starting my counter at zero so I know what index i am at
foreach ($p in $planets){
    write-output $p
    Write-Output "The current positon in the array is $currentvalue"
    $currentvalue = $currentvalue + 1 
}

'$planets'
"$planets"

