<#
   Simple SecureTower AD account lock
   Created by Anton Solovey @ Falcongaze LLC, 2018
#>

function GetSessionInfo()
{
    $line = @(query session) | ?{$_.contains(">")}
    $raw = -split $line

    $session = New-Object psobject -Property @{"SessionName" = 0; "Username" = 0; "ID" = 0; "State" = 0;};
    $session.SessionName = $raw[0].trim(">")
    $session.Username = $raw[1]
    $session.ID = $raw[2]
    $session.State = $raw[3]
    return $session
}

GetSessionInfo
