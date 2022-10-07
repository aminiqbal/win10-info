# ------------------------------------------------
# Powershell: [reinitialize.ps1]
# Authors: AM1N (github.com/aminiqbal) and countless good people on stackoverflow.com
# Last Updated: 2022.10.04
# Verified working: Win 10 Home 21H2 Build-19044.1288
# ------------------------------------------------
# This is rather machine specific, but when we first start up our Windows:
# We should run an elevated CMD and execute 'tasklist'.
# Then we should examine and decide on which processes NOT to kill, which we will append to the {$avoid} array.
# Probably best to keep all items upto 'wininit', otherwise the whole thing is like signing out and in again.
# Actually, all the pre-added processes in the {$avoid} array should be more or less essential to not end.
# ------------------------------------------------
# Usage:
# 1. We must replace 'USER' at <line 20> of this file with our own username.
# 2. Make sure both [reinitialize.ps1] and [reinitialize.bat] are at the same location.
# 3. Edit line 2 of [reinitialize.bat] to ensure the path to reinitialize.ps1 is explicit and absolute.
# 4. Right-click [reinitialize.bat] and click 'Run as administrator'. As long as we execute [reinitialize.ps1] in elevated mode.
# ------------------------------------------------

$plist = Get-Process -IncludeUserName | where {$_.UserName -like "*USER*"}

$avoid = @("cmd", "powershell", "System", "Registry", "System Idle Process", "explorer", "wininit", "services", "smss", "csrss", "lsass", "winlogon", "fontdrvhost", "dwm" , "spoolsv", "WmiPrvSE", "sihost", "taskhostw", "ctfmon", "StartMenuExperienceHost", "RuntimeBroker", "LMS", "SgrmBroker", "MoUsoCoreWorker", "conhost")

foreach($p in $plist)
{
	if($avoid.Contains($p.ProcessName))
	{
		continue;
	}
	else
	{
		Stop-Process $p.Id -Force
	}
}
