import requests
import os

#searchrulename=(os.environ['FGST_SEARCH_RULE_NAME'])
searchrulename=(os.environ['FGST_SEARCH_RULE_NAME'])
alerttime=(os.environ['FGST_ALERT_TIME'])
documentlink=(os.environ['FGST_DOCUMENT_LINK'])
username=(os.environ['FGST_USER_LOCAL_NAME'])
machineip=(os.environ['FGST_MACHINE_ADDRESS_IP'])
sid=(os.environ['FGST_USER_SID'])


documentlink = documentlink.rstrip(';')

api_token = '$TOKEN$'

requests.get('https://api.telegram.org/bot{}/sendMessage'.format(api_token), params=dict(
    chat_id='$CHATID$',
text='SecureTower alert  ' + searchrulename + '\n\r' + documentlink + '\n\r' + alerttime + '\n\r\n\r' + username + '\n\r' + sid + '\n\r' + machineip
   

))
