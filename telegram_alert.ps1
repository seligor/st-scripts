<#
   Simple SecureTower Telegram alerts
   Created by Anton Solovey @ Falcongaze LLC, 2018
#>

#   Due to RKN is bloking Telegram messenger in Russia you have to use proxy server
#   You can find a lof of free servers at https://hidemy.name

$Proxy = "proxy_server_ip:port"

$token = "token"
$chat_id = "chat_id"

$text = "*SecureTower alert* `

	Rule: $env:FGST_SEARCH_RULE_ID at $env:FGST_ALERT_TIME `
    Link: $env:FGST_DOCUMENT_LINK `

	*Details* `

	*User*: $env:FGST_USER_LOCAL_NAME `
	*IP*: $env:FGST_MACHINE_ADDRESS_IP `
	*SID*: $env:FGST_USER_SID"

$payload = @{
    "chat_id" = $chat_id;
    "text" = $text;
    "parse_mode" = "Markdown";
    "disable_web_page_preview" = "True"
}

Invoke-WebRequest `
    -Uri ("https://api.telegram.org/bot{0}/sendMessage" -f $token) `
    -Method Post `
    -ContentType "application/json;charset=utf-8" `
    -Body (ConvertTo-Json -Compress -InputObject $payload) `
    -Proxy $Proxy