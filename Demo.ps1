https://github.com/powershell/powershell
https://github.com/pjsamesp/OReillyFeb25

verb-noun

Get-ChildItem
# These are the same thing
dir 
ls

Get-Verb | Sort-Object Verb
(get-command).count
(get-verb).count

Update-Help

get-help -Name Get-Service
get-help -name get-service -Full
get-help -name get-service -Examples
get-help -name get-service -ShowWindow
get-help -name get-service -online


Get-Command -Name *process*
get-process 

get-help -name Enter-PSHostProcess -ShowWindow

get-service | Get-Member


Get-Service -name spooler

Get-Service -n spooler #don't do this its a bad habbit to get into


get-service -name spooler | Select-Object *
get-service -name spooler | Select-Object Name,DisplayName,Status,StartType

get-service -Name spooler,bits | Stop-Service

stop-service -Name Spooler
 # DO NOT DO THIS

get-service | Stop-Service -WhatIf
Get-Process | stop-process 

get-service -Name bits,spooler | Start-Service

get-command -ParameterName whatif


$service = get-service -name Spooler
$service | Get-member
$service | Select-Object *



$dime = 10
$dime = "ten"
$dime = "10"
[int]$dime = "10"
[string]$dime = 10


5 + 5 # Int + Int
5 + "five" # Int + String

"five" + 5 # String + string
"5" + 5


$dime + 1

1 + $dime
"5" + 5

("10" + 1).GetType()

1 + "10"
$date = 1152025
[datetime]$date = 1152025

Get-ChildItem | Sort-Object -Property name | Format-Table
Get-ChildItem | Sort-Object -Property name | Format-List



get-process | Select-Object name,PagedMemorySize | Sort-Object Name

if(!(test-path C:\scripts\OReillyFeb25\files)){New-Item -Path C:\Scripts\OReillyFeb25\ -name files -ItemType Directory}

if((test-path C:\scripts\OReillyFeb25\files) -eq $false){New-Item -Path C:\Scripts\OReillyFeb25\ -name files -ItemType Directory}

1..10 | ForEach-Object {new-item -ItemType File -name "$_.md"}



"dog"

dog

"dog" | Out-Default


Write-Host "hi" -ForegroundColor green
Write-Output

1..10 | Write-Output
1..10 | % { write-output $_ }
1..10 | ForEach-Object { write-output $_ }
1..10 | ForEach-Object { write-output "dog" }
"dog" | ForEach-Object { write-output $_ }



1..10 | ForEach-Object {new-item -ItemType File -name "$_.md"}
Get-ChildItem -Path C:\Scripts\OReillyFeb25 | Select-Object name | ForEach-Object { write-output $_ }

$planets = "Earth","Mars",'Saturn',
$planets | ForEach-Object {new-item -ItemType File -name "$_.md"}

$files = Get-ChildItem -path C:\Scripts\OReillyFeb25 | Select-Object Name


Get-ChildItem | Where-Object name -like *.md | Remove-Item
Get-ChildItem -Filter *.md


ForEach ($f in $files)
{ write-output $f }

$service = get-service spooler, BITS
foreach ($s in $service) {
    stop-service -name $s.Name
}

$service = get-service spooler, BITS
foreach ($s in $service) {
    if ($s.status -eq "stopped"){
        Start-Service $s.name
    write-output "I started the service " $s.displayname}
}

$service = (get-content c:\temp\myservices.txt)

Get-Date 
get-date 1/15/2055

(get-date 1/15/2026) - (get-date)

get-date | Get-Member

get-date | Select-Object hour

mm is mins not months
get-date -Format mm-dd-yyyy

get-date -Format "MM-dd-yyyy HH:mm" -

get-date -Format MMddyyyyhhmm
(get-date).AddDays(-4)
(get-date).addhours(4)

$dog = "Daisy"
"My dogs name is $dog"
'My dogs name is $dog'

$files = 20..100
foreach ($f in $files){new-item -path .\files\$f.md}

$folder = 'C:\scripts\OReillyFeb25\files'


Get-ChildItem -Path $folder -Recurse | Where-Object Name -NE "_readmefirst.txt" | Remove-Item
Get-ChildItem -Path $folder -Recurse | Where-Object {$_.Name -eq "_readmefirst.txt" `
-and $_.lastwritetime -gt "5/5/2024"}| Remove-Item

-eq Equal
-NE Not Equal
-gt Great Than
-lt Less Than
-le Less than or Equal to
-ge greater than or equal to
-and 
-like
-notlike
-match




Remove-Item

# Remoting
$cred = Get-Credential
Enter-PSSession -ComputerName srv01 -Credential $cred

invoke-command -ComputerName srv01, srv02 -ScriptBlock {$env:COMPUTERNAME} -Credential 714tech\bob

invoke-command -ComputerName (get-content c:\scripts\computers.txt) -ScriptBlock {$env:COMPUTERNAME}
invoke-command -ComputerName (Import-Csv c:\scripts\computers.Import-Csv) -ScriptBlock {$env:COMPUTERNAME}
invoke-command -ComputerName (get-adcomputer -filter "OU=printers,dc=test,dc=lab") -ScriptBlock {$env:COMPUTERNAME}

invoke-command -ComputerName srv01, srv02 -FilePath c:\scripts\myfile.ps1 -Credential 714tech\bob

# File system
Get-ChildItem
Set-LocalGroup
New-Item

Get-PSDrive

$env:computername

If ($IsMacOS -eq $true){}
elseif ($IsLinux -eq $true){}
else {}

switch ($OS)
{
    $IsMacOS {}
    $IsLinux {}
    $IsWindows {}
    Default {}
}

get-item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'

Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name PortNumber -value "3399"

New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "smileyface" -value "yes"

Remove-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "smileyface"

ForEach-Object ($s in $servers)
copy-item -Path \\myshare.test.lab\sql2024update.msu -Destination \\$s\d:\temp
} -parallel


$session = New-PSSession -ComputerName srv01,srv02,dc01 -Credential 714tech\bob

Enter-PSSession -Session $session

copy-item -fromsession $session -path c:\sql.msu -Destination d:\temp

invoke-command srv01,srv02 -ScriptBlock {copy-item -path \\myserverpath\sqlupdate.msu -Destination d:\temp}


Enter-PSSession ubuntu -UserName azureuser


$PSVersionTable
$env:hostname
$env:computername
Enter-PSSession -ComputerName dc01

Invoke-Command -ComputerName dc01 -ScriptBlock{$PSVersionTable} 
Invoke-Command -ComputerName dc01,srv01 -ScriptBlock {$env:COMPUTERNAME}
Invoke-Command -ComputerName dc01,srv01 -ScriptBlock {restart-service Spoojjkbhjvjvler}


foreach ($s in $servers){
    invoke-command -computer $s -ScriptBlock {mystuff here}
}


Enter-PSSession -HostName dc01 -UserName bob


$a = New-PSSession -ComputerName dc01 -Credential (Get-Credential)

invoke-command -Session $a -ScriptBlock {$env:COMPUTERNAME}

$b = New-PSSession -ComputerName dc01 -Credential (Get-Credential)

Get-PSSession |Remove-PSSession


git config --global user.email "james.petty714@outlook.com"
  git config --global user.name "James Petty"