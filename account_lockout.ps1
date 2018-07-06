<#
   Simple SecureTower AD account lock
   Created by Anton Solovey @ Falcongaze LLC, 2018
#>

#   =============
#    IMPORTANT
#   =============
#       This script must run from account that has appropriate rights.
#       at domain you want to block specified account. Otherwise you will get an error.
#   =============
#    WARNING
#   =============
#       The result of the script execution is the account lockout, please be carefull!
#       In case of successful execution you will get locked account and Event ID # 4725
#       on Domain Controller.
function ResolveSID($SID)
{ 
    if ($SID)
    {    
        $objSID = New-Object System.Security.Principal.SecurityIdentifier($SID) 
        $objUser = $objSID.Translate([System.Security.Principal.NTAccount])
        #   Out-File -FilePath C:\scripts\out.txt -InputObject $objUser.Value   #   Temp debug output
        return $objUser.Value.Split("\")[-1]    #   Cause user in domain\name format net user accept user name only
    }
    else 
    {
        Out-File -FilePath C:\error.log -InputObject "Enviroment variable is empty due to unknown reason."
        exit
    }
}

Write-Host "Active Directory account lock"

$usr = ResolveSID($env:FGST_USER_SID)
net user $usr /Domain /Active:no

Write-Host "==========================================================="
Write-Host "  The user account" $usr "is successfully locked !         " 
Write-Host "==========================================================="