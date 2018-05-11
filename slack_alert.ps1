<#
   Simple SecureTower Slack alerts
   Created by Anton Solovey @ Falcongaze LLC, 2018
#>

#   First of all, you have to create a bot and get the token from https://api.slack.com/tokens
#   Token will be as like as xoxb-xxxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxx

$token = "yuor_token"
$channel = "#general"
$botName = "SecureTower Alerts"  #   Optional parameter

$msgBody = "*SecureTower alert* `

*Rule*: $env:FGST_SEARCH_RULE_ID at $env:FGST_ALERT_TIME `
*Link*: $env:FGST_DOCUMENT_LINK `

*Details* `

*User*: $env:FGST_USER_LOCAL_NAME `
*IP*: $env:FGST_MACHINE_ADDRESS_IP `
*SID*: $env:FGST_USER_SID"

$SlackMsg = @{
    token = $token;
    channel = $channel;
    text = $msgBody;
    username = $botName
}

Invoke-RestMethod -Uri https://slack.com/api/chat.postMessage -Body $SlackMsg