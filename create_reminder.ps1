$action = New-ScheduledTaskAction -Execute “msg” -Argument "user.name message" #For what goes in "user.name message" https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msg
$trigger = New-ScheduledTaskTrigger -AtLogOn  # For other trigger options https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/new-scheduledtasktrigger?view=windowsserver2019-ps
$principal = New-ScheduledTaskPrincipal -UserId (Get-CimInstance –ClassName Win32_ComputerSystem | Select-Object -expand UserName)
$task = New-ScheduledTask -Action $action -Trigger $trigger -Principal $principal
Register-ScheduledTask Notepad -InputObject $task
Start-ScheduledTask -TaskName "REMINDER - Words in title bar" # "REMINDER - Words in title bar" is what will show up at the top of the window with the ok button
