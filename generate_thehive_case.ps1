<#
   SecureTower to TheHive incident creator
   Created by Anton Solovey @ Falcongaze LLC, 2018
#>

#	Enter your TheHive's API key and URL
$apiKey = "api_key"
$url = "http://thehive-address:port/api/case"

#	Variables
$severity = 2
$tlp = 2

#	HTTP headers
$headers = @{
	"Authorization" = "Bearer" + $apiKey;
	"Content-Type" = "application/json";
}

#	HTTP body
$body = @{
	"title" = "$env:FGST_SEARCH_RULE_ID"
	"description" = "Rule # $env:FGST_SEARCH_RULE_ID -- $env:FGST_SEARCH_RULE_TYPE at $env:FGST_ALERT_TIME. Link: $env:FGST_DOCUMENT_LINK"
	#"description" = "$env:FGST_MACHINE_DNS_NAME"
	"severity" = $severity
	"tlp" = $tlp
	"tags" = "dlp","automatic"
} | ConvertTo-Json

#	You can debug JSON by uncomment line below
#	$body

#	Make the request and get result
$result = Invoke-WebRequest -Uri $url -Method POST -Headers $headers -Body $body
$result