Set-Location $HOME

# 1
Remove-Item C:\Windows\Temp -Recurse

# 2

$PSVersionTable
$Host
Get-Host

# 3
Get-Location

# 4 
(Get-ChildItem \ -Depth 3 2>Out-Null).Count


# 5
Get-Date

# 6
New-Item -ItemType Directory ejer2
Set-Location .\ejer2

# 7
New-Item -ItemType File planetas.txt

# 8 
Add-Content .\planetas.txt -Value "Mercurio","Venus","Tierra","Marte","Júpiter","Saturno","Urano","Neptuno","Plutón"

# 9
Get-Content .\planetas.txt

# 10
Get-Content .\planetas.txt | Sort-Object | Add-Content planetas_ord.txt


# 11
Add-Content .\planetas_ord.txt -Value "Marte","Tierra","Urano","Mercurio"

# 12
Get-Content .\planetas_ord.txt

# 13
Get-Content .\planetas_ord.txt | Sort-Object | Get-Unique

# 14
(Get-Content .\planetas_ord.txt).Count

# 15
Get-Content .\planetas_ord.txt | Sort-Object -Descending

# 16
Get-Content .\planetas_ord.txt | Sort-Object -Descending | Get-Unique

# 17
Copy-Item .\planetas.txt planetas.doc

# 18
Rename-Item .\planetas.doc SistemaSolar.txt

# 19
Clear-Content .\planetas_ord.txt

# 20
Get-ChildItem
Get-ChildItem | Format-List -Property Name, Length

# 21
Get-Alias | Out-Host -Paging
Get-Command -CommandType Alias | Out-Host -Paging

# 22
Get-Help Sort-Object -Online

# 23
Get-ChildItem C:\ | Out-Host -Paging

# 24
Get-ChildItem Env:

# 25
Get-ChildItem Env:OS

# 26
Get-ChildItem Env:\USERNAME

# 27
Get-ChildItem Env:\USERPROFILE

# 28
Get-ChildItem Env:\NUMBER_OF_PROCESSORS

# 29
Get-Command | Out-Host -Paging

# 30
Get-Command -CommandType Cmdlet

# 31
Get-Command -CommandType Cmdlet -Name 're*'

# 32
Get-Alias rni

# 33
Get-Alias gal

# 34
Get-Alias gcm


# 35
Get-ChildItem C:\Windows | Select-Object -First 5


# 36
Get-ChildItem C:\Windows | Select-Object -Last 5


# 37
Get-ChildItem C:\Windows | Select-Object Name | Sort-Object | Out-Host -Paging

# 38
(Get-ChildItem C:\Windows -Hidden).Count

