<#
    Simple SecureTower Kansa logs collector
    Created by Anton Solovey @ Falcongaze LLC, 2018
#>

#   This script receive a number of arguments from SecureTower
#   and start Kansa script to gather a lot of extra data from
#   the workstation that affected by incident
#   
#   Note that you have to enable appropriate PowerShell execution policy on target hosts
#   https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-powershell-1.0/ee176961(v=technet.10)
#   Also enabled Windows Remote Management feature is a must
#
#   Please read README.md in kansa folder for additional info
#
#   WinRM service must be turned on on target hosts (run Enable-PSRemoting -Force command or use wizard "WinRM quickconfig" as you like)

.\kansa\kansa.ps1 -Target $env:COMPUTERNAME -ModulePath .\Modules -Verbose
