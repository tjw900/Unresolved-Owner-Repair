$share1 = Read-Host -prompt 'ZRS Share Path'
$share2 = Read-Host -prompt 'ressvm01 Share Path'
$user = Read-Host -Prompt 'user name'
$pwd = Read-Host -Prompt 'password'
net use /delete * /y
net use Z: $share1 /u:UNCLE\$user $pwd
net use y: $share2 /u:UNCLE\$user $pwd
&"C:\Program Files\JAM Software\TreeSize\TreeSize.exe" /SEARCH:Start /OPTIONS "$PSScriptRoot\searchsettings.xml" /TEXT "$PSScriptRoot\output.csv"