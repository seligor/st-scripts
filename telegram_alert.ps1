<#
   Simple SecureTower Telegram alerts
   Created by Anton Solovey @ Falcongaze LLC, 2018
#>

#$token = "token"
#$chat_id = "chat_id"
$token = "476433888:AAGpKv8mSX8T5INoH8kAFVdqLTNXR02Snmo"
$chat_id = "34444503"
$text = "SecureTower alert `
	Rule: $env:SEARCHRULENAME at $env:ALERTTIME. `
	Link: $env:DOCUMENTLINK"


$payload = @{
    "chat_id" = $chat_id;
    "text" = $text
}

$res = Invoke-WebRequest `
    -Uri ("https://api.telegram.org/bot{0}/sendMessage" -f $token) `
    -Method Post `
    -ContentType "application/json;charset=utf-8" `
    -Body (ConvertTo-Json -Compress -InputObject $payload)

Write-host "Status Code: "  $res.StatusCode
Write-host $res.Content