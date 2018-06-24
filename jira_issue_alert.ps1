<#
    Simple SecureTower JIRA issue creator
    Created by Anton Solovey @ Falcongaze LLC, 2018
#>

#   Note that this scripts was only tested on JIRA 6.4.3
#   TODO: add feature to make upload the file from $env:FGST_DOCUMENT_LINK or $env:FGST_DOCUMENT_UUID to the issue

#   Works on Jira 6.4.x, not tested on 7.x versions

function ConvertTo-Base64($string) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($string);
    $encoded = [System.Convert]::ToBase64String($bytes);
    return $encoded;
}

#   Please fill $username and $password below with your JIRA's credentials
$username = "your Jira login"
$password = "your Jira password"

$global:base64_auth_string = ConvertTo-Base64($username + ":" + $password)

$global:Summary = "SecureTower Incident: $env:FGST_SEARCH_RULE_NAME # $env:FGST_ALERT_ID"
$global:uri = "your lira link"
#$global:IssueParent = "Project Parent"
$global:ProjectKey = "your Jira project key"
$global:description =
"Incident at: $env:FGST_ALERT_TIME `
    SecureTower link: $env:FGST_DOCUMENT_LINK `
    Leak type: $env:FGST_DOCUMENT_COLLECTION_NAME `
    User name: $env:FGST_USER_LOGIN_NAME `
    User SID: $env:FGST_USER_SID `
    IP address: $env:FGST_MACHINE_ADDRESS_IP"

#   HTTP headers
$headers = @{
    "Authorization" = "Basic " + $base64_auth_string;
    "Content-Type"  = "application/json";
}

#   HTTP body

$global:IssueCreationBody = 
@{
    fields = @{
        project     = @{ key = $projectKey }
        #parent = @{ key = $issueParent }
        summary     = $summary
        description = $description 
        issuetype   = @{ name = 'Task' }
        #assignee    = @{ name = $username }
        #priority    = @{ id = '5' }    #   no priority
        #customfield_number = @{ yourkey = yourdata }
    }
} | ConvertTo-Json -Depth 100

$IssueCreationBody


$IssueCreation = Invoke-WebRequest -Uri "$uri/rest/api/latest/issue" -Method POST -Headers $headers -Body $IssueCreationBody
#$IssueCreation     #   Uncomment if you want see created issue info