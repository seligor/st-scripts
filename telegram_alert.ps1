<#
   Simple SecureTower Telegram alerts
   Created by Anton Solovey @ Falcongaze LLC, 2018
#>

$token = "token"
$chat_id = "chat_id"
$text = "SecureTower alert `
	Rule: $env:SEARCHRULENAME at $env:ALERTTIME. `
	Link: $env:DOCUMENTLINK"


$payload = @{
    "chat_id" = $chat_id;
    "text" = $text
}

Invoke-WebRequest `
    -Uri ("https://api.telegram.org/bot{0}/sendMessage" -f $token) `
    -Method Post `
    -ContentType "application/json;charset=utf-8" `
    -Body (ConvertTo-Json -Compress -InputObject $payload)