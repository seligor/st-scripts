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
	"title" = "$env:SEARCHRULENAME"
	"description" = "Rule # $env:SEARCHRULEID -- $env:SEARCHRULETYPE at $env:ALERTTIME. Link: $env:DOCUMENTLINK"
	#"description" = "$env:COMPUTERNAME"
	"severity" = $severity
	"tlp" = $tlp
	"tags" = "dlp","automatic"
} | ConvertTo-Json

#	You can debug JSON by uncomment line below
#	$body

#	Make the request and get result
$result = Invoke-WebRequest -Uri $url -Method POST -Headers $headers -Body $body
$result