Set-Variable -Name "basedir" -Value "$PSScriptRoot/../.."

(Get-Content "$basedir/vorestation.dme").Replace('#include "maps\southern_cross\southern_cross.dm"', '#include "maps\virgo_minitest\virgo_minitest.dm"') | Set-Content "$basedir/vorestation.dme"
& "$basedir/tools/build/build.bat"
(Get-Content "$basedir/vorestation.dme").Replace('#include "maps\virgo_minitest\virgo_minitest.dm"', '#include "maps\southern_cross\southern_cross.dm"') | Set-Content "$basedir/vorestation.dme"
Read-Host -Prompt "Press any key to continue"