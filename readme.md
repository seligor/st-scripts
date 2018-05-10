# Репозиторий скриптов Security Center для DLP-системы SecureTower

1. **generate_thehive_case.ps1** — создает инцидент в IRP-системе The Hive.

2. **telegram_alert.ps1** — отправляет сообщение об инциденте в Telegram.

3. **account_lockout.ps1** — блокирует учетную запись, по которой произошел инцидент. Учетная запись передается в переменной окружения %FGST_USER_SID%, от нее отпиливается домен до "\\", имя передается аргументом в тулзу net user.

4. **session_break.ps1** — разрывает все активные сессии на рабочей станции, на которой произошел инцидент. 
